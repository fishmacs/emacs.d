(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/popup-20150116.1223"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/auto-complete-20150201.150"))
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))

(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/anything-20130605.1746"))
(require 'anything)

;; paredit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/paredit-20150126.155")
(require 'paredit)

;; autopair
(add-to-list 'load-path "~/emacs_site-lisp/elpa/autopair-20140825.427")
(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))


