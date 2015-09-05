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
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/popup-20150315.612"))
;; auto-complete
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/auto-complete-20150408.1132"))
;; anything
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/anything-20130605.1746"))
;; paredit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/paredit-20150217.713")
;; autopair
(add-to-list 'load-path "~/emacs_site-lisp/elpa/autopair-20140825.427")

;; F#
(add-to-list 'load-path "~/emacs_site-lisp/ide/fsharp")
;; clojure
;(add-to-list 'load-path "~/emacs_site-lisp/elpa/clojure-mode-20150517.6")
;; ensime(scala IDE)
(add-to-list 'load-path "~/emacs_site-lisp/elpa/dash-20150513.1027")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/s-20140910.334")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/sbt-mode-20141110.1116")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/yasnippet-20150415.244")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/company-20150516.1441")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/scala-mode2-20150113.2309")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/ensime-20150515.2326")
;; markdown
(add-to-list 'load-path "~/emacs_site-lisp/elpa/markdown-mode-20150121.1229")

;; evernote
(add-to-list 'load-path "~/emacs_site-lisp/evernote-mode")

;; multi-term
(add-to-list 'load-path "~/emacs_site-lisp/elpa/multi-term-20150220.1320")

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; color-theme
(add-to-list 'load-path "~/emacs_site-lisp/elpa/hc-zenburn-theme-20150119.823")

(add-to-list 'load-path "~/emacs_site-lisp/elpa/js2-mode-20150514.550")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/ac-js2-20140906.442")
