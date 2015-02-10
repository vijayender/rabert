
;; (start-process "my-process" "foo" "sleep" "15")
;; (delete-process (get-buffer-process "foo"))
(start-process "my-process" (format "**%s**" "hello") "ls")

(defun start-auth (buff interface conf)
  (start-process
   "auth"
   (format "**%s**" buff)
   "sudo"
   "wpa_supplicant"
   "-i"
   interface
   "-D"
   "wired"
   "-c"
   conf))

(defun end-auth (buff)
  (delete-process (get-buffer-process (format "**%s**" buff))))

