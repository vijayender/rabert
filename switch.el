(require 'comint)
(load "~/work/elisp/rabert/queue-0.1.el")
(defvar *xx-yy* "*SDF*")
(defvar *input-queue* (queue-create))
(defvar *pending-input*)
(defvar *next-callback*)
(defvar *temp-output-buffer*)

(defmacro define-command (name args &rest body)
  `(defun ,name ,args
     (let ((comm (format "%s" (progn ,@body))))
       (call-command comm nil))))

(defun call-command (comm callback)
  (if (not (pending-output))
	   (progn
	     (setq *pending-input* t)
	     (process-send-string *proc* comm)
	     (setq *next-callback* callback))
	 (queue-enqueue *input-queue* (list comm callback))))

(defmacro with-output-from-comm (comm &rest body)
  `(call-command (format "%s\r" ,comm) #'(lambda ,@body)))
(print (macroexpand '(with-output-from-comm "sh flash" (str)
					    (print str)
					    (print str))))

(defun sw-exec () 
  (process-send-string *proc* "en\r\r\r"))

(define-command sw-config (comm)
  ;; (print comm)
  ;; (print (current-time-string))
  (format "%s\r" comm))

(defun sw-open (address port)
  (let* ((tname (format "switch-%s %s" address port))
	 (name (format "*%s*" tname))
	process)
    (setq *temp-output-buffer* nil)
    (setq *second-callback* nil)
    (setq *next-callback* nil)
    (setq *input-queue* (queue-create))
    (setq *pending-input* nil)
    (make-comint tname "telnet" nil address port)
    (setq process (get-buffer-process name))
    (accept-process-output process)
    (with-current-buffer name
      (setq comint-prompt-regexp "^S5"))
    (set-process-filter process 'send-input-on-output)
    (list process name)))

(defun sw-close (process name)
  (queue-clear *input-queue*)
  (sleep-for 1)
  (process-send-string process "\C-c\r")
  (process-send-string process "exit\r")
  (accept-process-output process)
  (delete-process process)
  ;; (kill-buffer name)
  )

(defun send-input-on-output (proc string)
  (ordinary-insertion-filter proc string)
  (setq *temp-output-buffer* (cons string *temp-output-buffer*))
  (if string
      (if (string-match "^S5" string)
	  (progn	    
	    (setq *pending-input* nil)
	    (if *next-callback*
		(progn
		  (print *next-callback*)
		  (print *temp-output-buffer*)
		  (apply *next-callback* (list (mapconcat 'identity (reverse *temp-output-buffer*) "")))))
	    (if (not (queue-empty *input-queue*))
	      (let ((elem (queue-dequeue *input-queue*)))
		(print "DDD")
		(print elem)
		(process-send-string proc (first elem))
		(setq *next-callback* (second elem)))
	      (print "Input NUll!!"))
	    (setq *temp-output-buffer* nil)))
    (print "BBB")))

(defun ordinary-insertion-filter (proc string)
  (with-current-buffer (process-buffer proc)
    (let ((moving (= (point) (process-mark proc))))
      (save-excursion
	;; Insert the text, advancing the process marker.
	(goto-char (process-mark proc))
	(insert string)
	(set-marker (process-mark proc) (point)))
      (if moving (goto-char (process-mark proc))))))

(multiple-value-bind (*proc* name) (sw-open "10.104.34.136" "2050")
  (sw-exec)
  (sit-for 3)
  (sw-config "en")
  (sw-config "conf t")
  (sw-config "hostname S5")
  (sw-config "int g3/0/1")
  (sw-config "do sh run int g3/0/2")
  (accept-process-output *proc* 1)
  (with-output-from-comm "do sh flash"
			 (str)
			 (print "SSSUCCC")
			 (print str))
  ;; (sw-close *proc* name)
  )

(print (queue-head *input-queue*))

