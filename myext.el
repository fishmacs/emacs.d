(add-to-list 'load-path "~/emacs_site-lisp/extend")

(load-library "yic-buffer")

(require 'iswitchb)
(iswitchb-mode 1)
;; for old emacs: (iswitchb-default-keybindings)

(require 'redo)

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((ws (window-system)))
    (cond ((eq ws 'x) (x-toggle-fullscreen f))
          ((eq ws 'ns) (ns-toggle-fullscreen)))))

(defun toggle-maximize-frame (&optional f)
  (interactive)
  (let ((ws (window-system)))
    (cond ((eq ws 'x) (x-toggle-maximize-frame f))
          ((eq ws 'ns) (ns-toggle-maximize-frame))
          ((eq ws 'w32) (w32-maximize-frame)))))

;;(if (or (eq window-system 'w32) (eq window-system 'win32))
;;    (progn
;;      (require 'gnuserv)
;;      (setq server-done-function 'bury-buffer gnuserv-frame (car (frame-list)))
;;      (gnuserv-start)
      ;;; open buffer in existing frame instead of creating new one...
;;      (setq gnuserv-frame (selected-frame))
;;      (message "gnuserv started.")))

;;(autoload 'all "all" nil t)

(setq grep-null-device "/dev/null")
(autoload (function igrep) "igrep" "*Run 'grep' PROGRAM to match EXPRESSION in Files..." t)
(autoload (function igrep-find) "igrep" "*Run 'grep' via 'find'..." t)

;;这个功能是从苹果机里非常流行的编辑器TextMate学来的。在TextMate里，ALT-up会把光标所在的整行文字上移一行，而ALT-down会把光标所在的整行文字下移一行。这在调整语句顺序时非常有用。
(local-set-key [(meta up)] 'move-line-up)
(local-set-key [(meta down)] 'move-line-down) 

(defun move-line (&optional n)
 "Move current line N (1) lines up/down leaving point in place."
 (interactive "p")
 (when (null n)
    (setq n 1))
 (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))

(defun move-line-up (n)
 "Moves current line N (1) lines up leaving point in place."
 (interactive "p")
 (move-line (if (null n) -1 (- n)))) 

(defun move-line-down (n)
 "Moves current line N (1) lines down leaving point in place."
 (interactive "p")
 (move-line (if (null n) 1 n)))

;; auto complete
;;require 'hippie-exp)
;;(setq hippie-expand-try-functions-list
;;         '(try-expand-dabbrev
;;               try-expand-dabbrev-all-buffers
;;               try-expand-dabbrev-from-kill
;;               try-complete-file-name-partially
;;               try-complete-file-name
;;               try-complete-lisp-symbol-partially
;;               try-complete-lisp-symbol
;;               try-expand-whole-kill))

(autoload 'dired-do-igrep "igrep"
  "*Run `grep` on the marked (or next prefix ARG) files." t)

(autoload 'dired-do-igrep-find "igrep"
  "*Run `grep` via `find` on the marked (or next prefix ARG) directories." t)
