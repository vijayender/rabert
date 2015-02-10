(load "~/work/elisp/rabert/switch.el")

(defun run-test ()
  (setq sw1 (make-switch))
  (switch-input-receiver sw-1-in sw1)
  (setf (switch-hostname sw1) "^S5")
  (sw-open sw1 "10.104.34.136" "2050" 'sw-1-in)
  (switch-to-buffer-other-window (switch-buffer sw1))
  (sw-exec sw1)
  (sit-for 10)
  (sw-config-multiple sw1 '("en"
			    "conf t"
			    "int g3/0/1"
			    "do sh run int g3/0/2"))
  (with-output-from-comm sw1 "do sh auth sess"
			 (str)
			 (print "SSSUCCC")
			 (print (split-string str "\r\n" t))
			 (sw-close sw1 name)))

(run-test)
