(require 'cl)

(setq test-func-symbols '(and or not))

(defun is-test-func-p (func)
  (memq (car func) test-func-symbols))

(defun regexp (str)
  (lexical-let ((arg str))
   (lambda (x) (string-match arg x))))

(defmacro t-func (args)
  )

(defun header (head)
  (let ((i -1))
   (mapcar #'(lambda (x)
	       (incf i)
	       `(,x . ,i)) head)))

(defun columns-f (header)
  (lexical-let ((head (header data)))
    (lambda (x)
      (lexical-let ((col (cdr (assoc x head))))
	(lambda (y)
	  (nth col y))))))

;; (and-f (regexp "^200$") (regexp "8eff"))

(defun and-f (&rest args)
  (lexical-let ((funcs args))
    (lambda (x)
      (every #'identity (mapcar (lambda (y) (funcall y x)) funcs))))))

(defun or-f (&rest args)
  (lexical-let ((funcs args))
    (lambda (x)
      (some #'identity (mapcar (lambda (y) (funcall y x)) funcs))))))

(defun not-f (arg)
  (lexical-let ((func arg))
    (lambda (x)
      (not (funcall arg x)))))

;; (key-f (regexp "^200$") (c "Vlan"))
(defun key-f (selector1 func1)
  (lexical-let ((func func1)
		(selector selector1))
    (lambda (x)
      (funcall func (funcall selector1 data)))))

;; (let ((c (column)))
;;   (test-f (regexp (c "Vlan")) data))

;; examples
;; (and (regexp "4e2f") (regexp "8144"))
;; (filter-f (and (regexp "4e2f") (regexp "8144")) data &key (c "Vlan"))
;; (filter-f (and (key (regexp "^200$") (c "Vlan")) (key (regexp "4e2f") (c "Mac"))))
;; 


;; (let ((a (regexp "Vlan$"))
;;       (b (regexp "^Hell")))
;;   (print (funcall (or-f a b) "Hello Vlana"))
;;   (print (funcall (and-f a b) "Hello Vlanc"))
;;   (remove-if-not (or-f a b) '("Hello"
;; 			       "Vlan"
;; 			       "trust"
;; 			       "B Vlan"
;; 			       "Vlan 1")))

