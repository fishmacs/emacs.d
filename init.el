(setq command-line-default-directory "~/")
(setq default-directory "~/")

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
 '(custom-safe-themes
   (quote
    ("cfb2c939ab12c7267c5ac28f2c85928f2c40e3a1ae569af61614d884a047d619" "8fd393097ac6eabfcb172f656d781866beec05f27920a0691e8772aa2cdc7132" default)))
 '(delete-selection-mode t)
 '(ecb-compilation-buffer-names
   (quote
    (("*Calculator*")
     ("*vc*")
     ("*vc-diff*")
     ("*Apropos*")
     ("*Occur*")
     ("\\*[cC]ompilation.*\\*" . t)
     ("\\*i?grep.*\\*" . t)
     ("*JDEE Compile Server*")
     ("*Help*")
     ("*Completions*")
     ("*Backtrace*")
     ("*Compile-log*")
     ("*bsh*")
     ("*Messages*"))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-windows-width 0.21)
 '(evernote-developer-token
   "S=s79:U=870e2d:E=14c502db87e:C=144f87c8c82:P=1cd:A=en-devtoken:V=2:H=62ff5596b7c8b0b8c759d14ace033e13")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(term-default-bg-color "#10295a")
 '(term-default-fg-color "#dddd00")
 '(tool-bar-mode nil))
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 ;;'(jde-make-args "" nil nil "all"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "set-load-path")
(load "myext")
(load "base-ide") ;; split original modes to ide-base and modes
(load "modes")

;;; sdcv-mode
;(require 'sdcv-mode)

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

(load "myetag.el")
(load "key-bind.el")
;;;(load "emms-conf.el")
      
(require 'psvn)
(require 'tramp)

(load "eclipse-goto-offset.el")


(autopair-global-mode 0)

;; byte-compile error in linux:
(setq warning-suppress-types nil)
;(require 'warnings)

(defvar zw-server-emacs t
  "If non-null, this emacs should run emacsclient.")

(add-to-list
 'command-switch-alist
 '("gnus" . (lambda (&rest ignore)
              ;; Start Gnus when Emacs starts
              (setq zw-server-emacs nil)
              (toggle-maximize-frame)
              (add-hook 'emacs-startup-hook 'gnus t)
              ;; Exit Emacs after quitting Gnus
              (add-hook 'gnus-after-exiting-gnus-hook
                        'save-buffers-kill-emacs))))

(add-to-list
 'command-switch-alist
 '("my" . (lambda (&rest ignore)
            (setq zw-server-emacs nil))))

(add-hook 'emacs-startup-hook
          (lambda ()
            (when zw-server-emacs
              (server-start))))

;; (ignore-errors
;;   (server-start))

(let ((ws (window-system)))
  (cond ((eq ws 'x) (load "linux.el"))
        ((eq ws 'ns) (load "mac.el"))
        ((eq ws 'w32) (load "win.el"))))

;; (mf-set-frame-pixel-size
;;  (selected-frame)
;;  660
;;  (mf-max-display-pixel-height))

(setq yas-snippet-dirs '("~/emacs_site-lisp/mysnippets"))
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

;;; color-theme
;(color-theme-initialize)
;(add-to-list 'load-path "~/emacs_site-lisp/color-theme-6.6.0")
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-calm-forest)
;(color-theme-gnome2)
;(color-theme-deep-blue)
;(color-theme-jsc-dark)
;; (load-file "~/emacs_site-lisp/themes/zw-color-theme.el")
;; (color-theme-zwtm)
(add-to-list 'load-path "~/emacs_site-lisp/elpa/hc-zenburn-theme-20150119.823")
(require 'hc-zenburn-theme)
;(add-to-list 'custom-theme-load-path "~/emacs_site-lisp/elpa/hc-zenburn-theme-20140811.831")
(load-theme 'hc-zenburn t)
