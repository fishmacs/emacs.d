(global-set-key [(f5)] 'visit-tags-table)         ; visit tags table
(global-set-key [C-f5] 'sucha-generate-tag-table) ; generate tag table
;; leave this to backward-kill-word
;(global-set-key [(control .)] '(lambda () (interactive) (lev/find-tag t)))
;(global-set-key [(control ,)] 'sucha-release-small-tag-window)
;(global-set-key [(meta .)] 'lev/find-tag)
;(global-set-key [(meta ,)] 'pop-tag-mark)
(global-set-key (kbd "C-M-,") 'find-tag)
(define-key lisp-mode-shared-map [(shift tab)] 'complete-tag)

(add-hook 'c-mode-common-hook      ; both c and c++ mode
          (lambda ()
            (define-key c-mode-base-map [(shift tab)] 'complete-tag)))

(defun lev/find-tag (&optional show-only)
  "Show tag in other window with no prompt in minibuf."
  (interactive)
  (let ((default (funcall (or find-tag-default-function
                              (get major-mode 'find-tag-default-function)
                              'find-tag-default))))
    (if show-only
        (progn (find-tag-other-window default)
               (shrink-window (- (window-height) 12)) ;; 限制为 12 行
               (recenter 1)
               (other-window 1))
      (find-tag default))))

(defun sucha-generate-tag-table ()
  "Generate tag tables under current directory(Linux)."
  (interactive)
  (let
      ((exp "")
       (dir ""))
    (setq dir
          (read-from-minibuffer "generate tags in: " default-directory)
          exp
          (read-from-minibuffer "suffix: "))
    (with-temp-buffer
      (shell-command
       (concat "find " dir " -name \"" exp "\" | xargs etags ")
       (buffer-name)))))

(defun sucha-release-small-tag-window ()
  "Kill other window also pop tag mark."
  (interactive)
  (delete-other-windows)
  (ignore-errors
    (pop-tag-mark)))
