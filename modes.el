;; setq is useless, must use setq-default
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "<f8>") `toggle-indent-tabs-mode)

(defun toggle-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode (if indent-tabs-mode nil t))
  (message "set indent-tabs-mode to %s." indent-tabs-mode))

;; c/c++
(load "c")

;; jde
;; ident space
(defun my-java-mode-hook ()
  (progn
    (setq c-basic-offset 2)
    (cscope:hook)))

(add-hook 'java-mode-hook 'my-java-mode-hook)
(load "java")

;;; comment ruby
;; ruby
(load "ruby")

;; perl
(setq perl-mode-hook
      '(lambda ()
         (setq perl-indent-level 2)))

;; common lisp(slime)

(setq inferior-lisp-program "clisp")
;(add-to-list 'load-path "~/emacs_site-lisp/ide/slime-2.0")
;(require 'slime)
;(slime-setup)

;; haskell
;;(load "~/emacs_site-lisp/ide/haskell-mode-2.7.0/haskell-site-file")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;(add-hook 'haskell-mode-hook 'font-lock-mode)
;; no effect?!
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 
 '(lambda ()
   (local-set-key (kbd "C-c C-d") 'inferior-haskell-send-decl)))
          
(setq haskell-ghci-program-args '("-fbang-patterns" "-XMultiParamTypeClasses"))

;; ocaml
; --old caml mode
;; (setq auto-mode-alist
;;           (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))

;; (setq load-path (cons "~/emacs_site-lisp/ide/ocaml" load-path))

;; (autoload 'caml-mode "ocaml" (interactive)
;;   "Major mode for editing Caml code." t)
;; ;(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
;; (autoload 'camldebug "camldebug" (interactive) "Debug caml mode")

; --new tuareg mode
;(add-to-list 'load-path "~/emacs_site-lisp/ide/tuareg-mode-1.45.6")

;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" "Configuration of imenu for tuareg" t)

;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)

;; (setq auto-mode-alist
;;       (append '(("\\.ml[iylp]?$" . tuareg-mode)
;;                 ("\\.topml$" . tuareg-mode))
;;               auto-mode-alist))

(add-hook 'tuareg-mode-hook
	  '(lambda ()
	     (setq tuareg-lazy-= t)
					; indent `=' like a standard keyword
	     (setq tuareg-lazy-paren t)
					; indent [({ like standard keywords
	     (setq tuareg-in-indent 0)
					; no indentation after `in' keywords
             (setq tuareg-let-always-indent 0)
                                        ; no indentation after `let' keywords
             ;(setq tuareg-with-indent 0)
                                        ; make `let x = match ... with' and
                                        ;`match ... with' indent the save way
;	     (auto-fill-mode 1)
					; turn on auto-fill minor mode
	     (if (featurep 'sym-lock)   ; Sym-Lock customization only
		 (setq sym-lock-mouse-face-enabled nil))
					; turn off special face under mouse
	     ))

;; If you use Sym-Lock, you could also add some customization code after the
;; `(require 'sym-lock)' in your `.emacs'

(if (featurep 'sym-lock)
    (setq tuareg-sym-lock-keywords
	  '(("<-" 0 1 172 nil) ("->" 0 1 174 nil)
	    ;; (":=" 0 1 220 nil)
	    ("<=" 0 1 163 nil) (">=" 0 1 179 nil)
	    ("<>" 0 1 185 nil) ("==" 0 1 186 nil)
	    ("||" 0 1 218 nil) ("&&" 0 1 217 nil)
	    ("[^*]\\(\\*\\ nil)\\." 1 8 180 nil)
	    ("\\(/\\ nil)\\." 1 3 184 nil)
	    ;; (":>" 0 1 202 nil)
	    ;; (";;" 0 1 191 nil)
	    ("\\<_\\>" 0 3 188 nil) ("\\<sqrt\\>" 0 3 214 nil)
	    ("\\<unit\\>" 0 3 198 nil) ("\\<fun\\>" 0 3 108 nil)
	    ("\\<or\\>" 0 3 218 nil) ("\\<not\\>" 0 3 216 nil))))

;;; comment ess
;;; ess
;;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ess-5.3.7")
;(load "/usr/share/emacs/site-lisp/ess-5.3.7/ess-site")
;;;(require 'ess-site)

;; lua
(setq auto-mode-alist (cons '("\\.mpl" . lua-mode) auto-mode-alist))
(setq lua-mode-hook
      '(lambda ()
         (let ((map (if lua-prefix-key
                        (make-sparse-keymap)
                        lua-mode-map)))
         ;; communication
           (local-set-key (kbd "C-c C-b") 'lua-send-buffer)
           (local-set-key (kbd "C-c C-r") 'lua-send-region)
           (local-set-key (kbd "C-c C-l") 'lua-send-line)
           (local-set-key (kbd "C-c C-p") 'lua-send-proc))))
           ;; (setq tab-width 2)
           ;; (setq lua-indent-level 2))))

;; c#
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
   (cons '("\\.cs$" . csharp-mode) auto-mode-alist))

;; javascript
;; (require 'js2-mode)
;; (require 'ac-js2)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))
; node/EJS
(add-to-list 'auto-mode-alist '("\\.ejs" . html-mode))
;(autoload 'javascript-mode "javascript" nil t)
(autoload 'js2-mode "js2-mode" nil t)
(add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-hook 'javascript-mode-hook
;;       '(lambda ()
;;          (setq js-indent-level 2)))
(setq js2-basic-offset 2)
(setq js2-highlight-level 3)
(setq js2-mode-show-trailing-comma-warning nil)
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
;(setq nodejs-repl-command "\"node --use-strict --harmony_arrow_functions\"")

;; coffeescript
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook
          (lambda ()
            (setq coffee--repl-multiline-initialized t)
            (global-set-key "\C-c\C-v" 'coffee-repl-multiline)))

(defun coffee-repl-multiline ()
  (interactive)
  (let ((proc (coffee-get-repl-proc)))
    (comint-send-string proc "\026")))

;; livescript
(setq livescript-command "lsc")
(setq livescript-args-repl '("-w"))

;; julia
(add-hook 'julia-mode-hook
          (lambda ()
            (require 'julia-shell)
            (setq julia-indent-offset 2)
            (local-set-key "\C-c\C-c" 'julia-shell-save-and-go)
            (local-set-key "\C-c\C-r" 'julia-shell-run-region-or-line)))

;; aspx
(autoload 'asp-mode "asp-mode")
(setq auto-mode-alist 
      (cons '("\\.asp\\'" . asp-mode) auto-mode-alist))

;; F#
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)
(setq inferior-fsharp-program "~/bin/fsi --readline-")
(setq fsharp-compiler "~/bin/fsc")
; indent
;; (add-hook 'fsharp-mode-hook
;;           '(lambda ()
;;              (setq fsharp-indent-offset 2)))

;; android
;; (add-to-list 'load-path "~/emacs_site-lisp/ide/android")
;; (require 'android-mode)
;; (setq android-mode-sdk-dir "~/sdk/android-sdk-linux_86")
;; (add-hook 'gud-mode-hook
;;           '(lambda ()
;;             add-to-list 'gud-jdb-classpath "/home/zw/sdk/android-sdk-linux_86/platforms/android-7/android.jar"))

;; objc and cscope
(add-hook 'objc-mode-hook
          '(lambda ()
             (cscope:hook)))

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; php
(load "php-mode")
(add-to-list 'auto-mode-alist
     	     '("\\.php[345]?\\'\\|\\.phtml\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;;; comment tex
;; auctex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

;; (add-hook 'LaTeX-mode-hook
;; (lambda()
;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;; (setq TeX-command-default "XeLaTeX")))

;; ;; open with external program
;; (defun define-trivial-mode(mode-prefix file-regexp &optional command) 
;;   (or command (setq command mode-prefix)) 
;;   (let ((mode-command (intern (concat mode-prefix "-mode")))) 
;;     (fset mode-command 
;;           '(lambda () 
;;              (interactive) 
;;              (toggle-read-only t) 
;;              (start-process ,mode-prefix nil 
;;                             ,command (buffer-file-name))
;;              (kill-buffer (current-buffer)))) 
;;     (add-to-list 'auto-mode-alist (cons file-regexp mode-command))) 
;;   ) 

;; (define-trivial-mode "gv" "\\.ps$") 
;; (define-trivial-mode "evince" "\\.pdf$")

;;; evernote
(require 'org-evernote)
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(setq enh-enclient-command "/usr/local/Cellar/ruby/1.9.3-p327/bin/enclient.rb")
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)

;; clojure
;(require 'clojure-mode)
(add-hook 'clojure-mode-hook
          '(lambda ()
             (paredit-mode 1)))
(setq inferior-lisp-program "lein repl")

;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/dash-20141106.455")
;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/queue-0.1.1")
;; (add-to-list 'load-path "~/emacs_site-lisp/ide/cider")
;; (require 'cider)
;; (require 'swank-clojure)
;; (add-to-list 'slime-lisp-implementations
;;              '(clojure ,(swank-clojure-cmd) :init swank-clojure-init))
;; (setq slime-lisp-implementations
;;       (append slime-lisp-implementations
;;               `((clojure ,(swank-clojure-cmd) :init swank-clojure-init))))

;; magit
;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/magit-1.1.1")
;; (autoload 'magit-status "magit" nil t)

;; scala/ensime
;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/scala-mode-0.0.2")
;; (require 'scala-mode-auto)

;; ensime(scala IDE)
(require 'ensime)
;(remove-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook
          '(lambda()
             (local-set-key (kbd "RET") 'newline-and-indent)))

;; (setq yas/scala-directory "~/emacs_site-lisp/elpa/scala-mode-0.0.2/contrib/yasnippet/snippets")
;; (yas/load-directory yas/scala-directory)
;; (add-hook 'scala-mode-hook
;;           '(lambda ()
;;              (yas/minor-mode-on)
;;              ))
(add-hook 'scala-mode-hook
          '(lambda ()
             ;;(yas/minor-mode-on)
             (local-set-key "\C-c\C-c" 'scala-eval-buffer)
             (local-set-key "\C-c\C-r" 'scala-eval-region)
             ))

(add-hook 'ensime-scala-mode-hook
          '(lambda ()
             ;;(yas/minor-mode-on)
             (local-set-key "\C-c\C-c" 'ensime-inf-eval-buffer)
             (local-set-key "\C-c\C-r" 'ensime-inf-eval-region)
             ))

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;(require 'undo-tree)
;(global-undo-tree-mode 1)

;; go-lang
(add-hook 'go-mode-hook
          (lambda()
            (local-set-key (kbd "M-.") 'godef-jump)))

