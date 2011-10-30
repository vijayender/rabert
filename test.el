(defvar sw-comint-buffer "*sw*")
(defvar sw-comint-buffer1 "*sw1*")
(let (process)
  (make-comint "sw" "telnet" nil "10.104.34.136" "2050")
  (setq process (get-buffer-process sw-comint-buffer))
  (accept-process-output process))
(make-comint "sw1" "bash")
(setq process (get-buffer-process sw-comint-buffer))

(process-send-string process "conf t\r")



