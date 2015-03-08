(add-to-list 'load-path "~/emacs_site-lisp/ide")

;; cedet
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elib-1.0"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/common"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/srecode"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/cogre"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/semantic"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/speedbar"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/eieio"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/cedet-1.1/ede"))
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/jdee-2.4.0.1/lisp"))
;; ignore cedet bundled with emacs
(setq load-path
      (remove (concat "/usr/share/emacs/"
                      (substring emacs-version 0 -2)
                      "/lisp/cedet")
              load-path))

;; ecb
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/ecb-2.40"))
;; popup
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/popup-20150116.1223"))
;; auto-complete
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/auto-complete-20150201.150"))
;; anything
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/anything-20130605.1746"))
;; paredit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/paredit-20150126.155")
;; autopair
(add-to-list 'load-path "~/emacs_site-lisp/elpa/autopair-20140825.427")

;; F#
(add-to-list 'load-path "~/emacs_site-lisp/ide/fsharp")
;; clojure
(add-to-list 'load-path "~/emacs_site-lisp/elpa/clojure-mode-20150113.1048")
;; ensime(scala IDE)
(add-to-list 'load-path "~/emacs_site-lisp/elpa/dash-20141220.1452")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/s-20140910.334")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/sbt-mode-20141110.1116")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/yasnippet-20150212.240")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/company-20150204.836")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/scala-mode2-20150113.2309")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/ensime-20150211.1505")
;; markdown
(add-to-list 'load-path "~/emacs_site-lisp/elpa/markdown-mode-20150121.1229")

;; evernote
(add-to-list 'load-path "~/emacs_site-lisp/evernote-mode")

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))


(require 'anything)

(require 'paredit)

(autoload 'autopair-global-mode "autopair" nil t)
(autopair-global-mode)
(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))


