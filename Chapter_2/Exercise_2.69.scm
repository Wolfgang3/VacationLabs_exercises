// huffman tree 
=> 

;from the earlier exercise
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
;;;;;;;;;

;from the question
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs))
)

;successive-merge procedure
(define (successive-merge all_leaf_nodes)
  (cond ((null? all_leaf_nodes) ())
        ((= (length all_leaf_nodes) 1) all_leaf_nodes)
        (else (successive-merge (adjoin-set (make-code-tree (car all_leaf_nodes) (cadr all_leaf_nodes))
                                            (cddr all_leaf_nodes) )
              )
        )

  )
)

;run
(define huffman_pair '((A 4) (B 2) (C 1) (D 1)) )
(generate-huffman-tree huffman_pair)
;value= (((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8))