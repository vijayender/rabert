(require 'comint)
(load "~/work/elisp/rabert/queue-0.1.el")
(defvar *xx-yy* "*SDF*")
(defvar *input-queue* (queue-create))
(defvar *pending-input*)
(defvar *next-callback*)
(defvar *temp-output-buffer*)

(defstruct switch
  input-queue
  pending-input
  pending-output
  next-callback
  hostname
  temp-output-buffer
  process
  buffer)

(defmacro define-command (name args &rest body)
  `(defun ,name ,args
     (let ((comm (format "%s" (progn ,@body))))
       (call-command comm nil))))

(defmacro with-switch-slots (name &rest body)
  `(symbol-macrolet ((input-queue (switch-input-queue ,@name))
		     (pending-input (switch-pending-input ,@name))
		     (pending-output (switch-pending-output ,@name))
		     (next-callback (switch-next-callback ,@name))
		     (hostname (switch-hostname ,@name))
		     (temp-output-buffer (switch-temp-output-buffer ,@name))
		     (process (switch-process ,@name))
		     (buffer (switch-buffer ,@name)))
     ,@body))

(defun call-command (sw comm callback)
  (with-switch-slots (sw)
   (if (not (check-pending-output sw))
	(progn
	  (setf pending-input t)
	  (process-send-string process comm)
	  (setf next-callback callback))
      (queue-enqueue input-queue (list comm callback)))))

(defun check-pending-output (sw)
  (with-switch-slots (sw)
		     (if (not (queue-empty input-queue))
			 t
		       pending-input)))


(defmacro with-output-from-comm (sw comm &rest body)
  `(call-command ,sw (format "%s\r" ,comm) #'(lambda ,@body)))

;; (print (macroexpand '(with-output-from-comm "sh flash" (str)
;; 					    (print str)
;; 					    (print str))))

(defun sw-exec (sw) 
  (with-switch-slots (sw)
   (process-send-string process "\r\r\r")))

(defun sw-config-multiple (sw comms)
  (loop for comm in comms
	do (sw-config sw comm)))

(defun sw-config (sw comm)
  (call-command sw (format "%s\r" comm) nil))

(defun sw-open (sw address port input-func)
  (with-switch-slots (sw)
		     (let* ((tname (format "switch-%s %s" address port))
			    (name (format "*%s*" tname)))
		       (setf temp-output-buffer nil)
		       (setf second-callback nil)
		       (setf next-callback nil)
		       (setf input-queue (queue-create))
		       (setf pending-input nil)
		       (make-comint tname "telnet" nil address port)
		       (setf (switch-process sw) (get-buffer-process name))
		       (accept-process-output process)
		       (with-current-buffer name
			 (setf comint-prompt-regexp hostname))
		       (setf buffer name)
		       (set-process-filter process input-func))))

(defun sw-close (sw name)
  (with-switch-slots (sw)
   (queue-clear *input-queue*)
   (sleep-for 1)
   (process-send-string process "\C-c\r")
   (process-send-string process "exit\r")
   (accept-process-output process)
   (delete-process process)
   ;; (kill-buffer name)
   ))

(defmacro switch-input-receiver (func-name switch-name)
  `(defun ,func-name (proc string)
     (with-switch-slots (,switch-name)
			(ordinary-insertion-filter proc string)
			(setf temp-output-buffer (cons string temp-output-buffer))
			(if string
			    (if (string-match hostname string)
				(let ((callback next-callback)
				      (output-buffer temp-output-buffer))
				  (setf pending-input nil)
				  (setf next-callback nil)
				  (setf temp-output-buffer nil)
				  (if (not (queue-empty input-queue))
				      (let ((elem (queue-dequeue input-queue)))
					(process-send-string proc (first elem))
					(setf next-callback (second elem))))
				  (if callback
				      (progn
					(apply callback (list (mapconcat 'identity (reverse output-buffer) "")))))))))))

(defun ordinary-insertion-filter (proc string)
  (with-current-buffer (process-buffer proc)
    (let ((moving (= (point) (process-mark proc))))
      (save-excursion
	;; Insert the text, advancing the process marker.
	(goto-char (process-mark proc))
	(insert string)
	(set-marker (process-mark proc) (point)))
      (if moving (goto-char (process-mark proc))))))

