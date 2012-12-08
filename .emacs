(setq debug-on-error t)

(setq load-path (cons "~/emacs_site-lisp" load-path))

(load "std")

(setq default-tab-width 4)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list (quote ("/home/zw/emacs/ide/ecb-2.40/info-help")))
 '(canlock-password "7d08884fa2c0227b852b30402bbc6fb7d1b866d5")
 '(case-fold-search t)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-show-sources-in-directories-buffer nil)
 '(ecb-source-path (quote ("/home/zw/work/trunk" "/home/zw/work" "/home/zw/code" "/home/zw/mylib")))
 '(ecb-windows-width 0.21)
 '(global-font-lock-mode t nil (font-lock))
 '(standard-indent 2)
 '(transient-mark-mode t))

  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 ;;'(jde-make-args "" nil nil "all"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;(set-default-font "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1")
;;(set-default-font "-adobe-courier-medium-r-normal--14-100-100-100-m-90-iso8859-1")

(let ((ws (window-system)))
  (cond ((eq ws 'x) (load "linux.el"))
        ((eq ws 'ns) (load "mac.el"))
        ((eq ws 'w32) (load "win.el"))))

(load "myext")
(load "ide-base") ;; split original modes to ide-base and modes
(load "modes")

;;; sdcv-mode
(require 'sdcv-mode)

;; Read Mail menu
;;;(if (boundp 'read-mail-commnad) (setq read-mail-command 'mew))

;; Optional setup (e.g. C-xm for sending a message)
;;;(autoload 'mew-user-agent-compose "mew" nil t)

;;;(if (boundp 'mail-user-agent) (setq mail-user-agent 'mew-user-agent))
;;;(if (fboundp 'define-mail-user-agent )
;;;    (define-mail-user-agent
;;;      'mew-user-agent
;;;      'mew-user-agent-compose
;;;      'mew-draft-send-message
;;;      'mew-draft-kill
;;;      'mew-send-hook))

;;; color-theme
(add-to-list 'load-path "~/emacs_site-lisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-calm-forest)
;(color-theme-gnome2)
(color-theme-deep-blue)

(load "myetag.el")
(load "key-bind.el")
;;;(load "emms-conf.el")
      
(require 'psvn)
(require 'tramp)

(load "eclipse-goto-offset.el")

;; byte-compile error in linux:
(setq warning-suppress-types nil)
;(require 'warnings)

(ignore-errors
  (server-start))
