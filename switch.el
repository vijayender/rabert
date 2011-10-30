(require 'comint)
(load "~/work/elisp/rabert/queue-0.1.el")
(defvar *xx-yy* "*SDF*")
(defvar *input-queue* (queue-create))
(defvar *pending-input*)

(defmacro define-command (name args &rest body)
  `(defun ,name ,args
     (let ((comm (format "%s" (progn ,@body))))
       (if (not (pending-output))
	   (progn
	     (setq *pending-input* t)
	     (process-send-string *proc* comm))
	 (queue-enqueue *input-queue* comm)))))

(defun pending-output ()
  (if (not (queue-empty *input-queue*))
      t
    *pending-input*))

(defun sw-exec () 
  (process-send-string *proc* "\r\r\r\r\ren\r\r"))

(define-command sw-config (comm)
  ;; (print comm)
  ;; (print (current-time-string))
  (format "%s\r" comm))

(defun sw-open (address port)
  (let* ((tname (format "switch-%s %s" address port))
	 (name (format "*%s*" tname))
	process)
    (setq *input-queue* (queue-create))
    (setq *pending-input* nil)
    (make-comint tname "telnet" nil address port)
    (setq process (get-buffer-process name))
    (accept-process-output process)
    (with-current-buffer name
      (setq comint-prompt-regexp "^S5"))
    (set-process-filter process 'send-input-on-output)
    (process-send-string process "\r\r\r\r")
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
  (setq *pending-input* nil)
  (if string
      (if (string-match "^S5" string)
	  (if (not (queue-empty *input-queue*))
	      (let ((elem (queue-dequeue *input-queue*)))
		(print (format "Sending: %s" elem))
		(process-send-string proc elem))
	    (print "Input NUll!!")))
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
;;(macroexpand '(define-command sw-exec (comm) (format "%s\r" comm)))


(multiple-value-bind (*proc* name) (sw-open "10.104.34.136" "2050")
  (sw-exec)
  (sw-config "en")
  (sw-config "conf t")
  (sw-config "hostname S5")
  (sw-config "int g3/0/1")
  (setq *xx-yy* "JJJJ")
  (sw-config "do sh run int g3/0/2")
  (accept-process-output *proc* 1)
  ;; (sw-close *proc* name)
  )

(process-send-string (get-buffer-process "*switch-10.104.34.136 2050*") "\C-c")

(setq *input-queue* (queue-create))
(queue-empty *input-queue*)