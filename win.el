(defun w32-restore-frame (&optional arg)
    "Restore a minimized frame"
     (interactive)
     (w32-send-sys-command 61728 arg))

(defun w32-maximize-frame (&optional arg)
    "Maximize the current frame"
     (interactive)
     (w32-send-sys-command 61488 arg))

(w32-maximize-frame)
(add-hook 'after-make-frame-functions 'w32-maximize-frame)
