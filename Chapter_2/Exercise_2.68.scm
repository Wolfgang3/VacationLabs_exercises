// encode-symbol procedure in encode
=> 
;using the previous exercise i.e. 67
(define (make-leaf symbol weight)
  (list 'leaf symbol weight)
)

(define (leaf? object)
  (eq? (car object) 'leaf)
)

(define (symbol-leaf x)
  (cadr x)
)

(define (weight-leaf x)
  (caddr x)
)

(define (make-code-tree left right)
  (list left 
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))
  )
)

(define (left-branch tree)
  (car tree)
)

(define (right-branch tree)
  (cadr tree)
)

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)
  )
)

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)
  )
)

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))
  )
)

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
              (adjoin-set x (cdr set))))
  )
)

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-set (cdr pairs))
      )
    )
  )
)

;from the question
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)
                    )
                  )
  )
)

; referring to exercise 2.59 , to check if the element is in the list
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))
  )
)

;decode procedure
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
             (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
            (cons (symbol-leaf next-branch)
                  (decode-1 (cdr bits) tree))
            (decode-1 (cdr bits) next-branch)
            )
      )
    )
  )
  (decode-1 bits tree)
)

;encode procedure (from the question) 
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))
  )
)

;encode-symbol procedure 
;first go to all left add keep on adding 0, simillarly while visiting right keep on adding 1
(define (encode-symbol symb s_tree)
  (cond ((element-of-set? symb (symbols (left-branch s_tree)))
         (if (leaf? (left-branch s_tree))
            '(0); for the left node
            (cons 0  (encode-symbol symb (left-branch s_tree))) ;else add 0 if it still on the left 
          )
        )
        ((element-of-set? symb (symbols (right-branch s_tree)))
         (if (leaf? (right-branch s_tree))
            '(1) ; for the right node
            (cons 1  (encode-symbol symb (right-branch s_tree))) ;else add 1 if it still on the right 
          )
        )
        (else (error "symbol not in the tree"))
  )
)

;run 
; sample-tree drawn on the note book

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(decode sample-message sample-tree)
;value= (a d a b b c a)
(define sample-symbols '(a d a b b c a))
;(element-of-set? (car sample-symbols) (symbols (left-branch sample-tree)))

;now the encoding procedure
(encode sample-symbols sample-tree)
;value= (0 1 1 0 0 1 0 1 0 1 1 1 0)
(encode '(x y z) sample-tree)
;symbol not in the tree
