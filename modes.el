;; setq is useless, must use setq-default
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "<f8>") `toggle-indent-tabs-mode)

(defun toggle-indent-tabs-mode ()
  (interactive)
  (setq indent-tabs-mode (if indent-tabs-mode nil t))
  (message "set indent-tabs-mode to %s." indent-tabs-mode))

;; paredit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/paredit-22")
(require 'paredit)

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
;;;(load "ruby")

;; python
;(setq load-path (cons "~/emacs_site-lisp/ide/python" load-path))
;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq ;interpreter-mode-alist
      ;(cons '("python" . python-mode) interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
           ;(set-variable 'py-indent-offset 2)
           (set-variable 'py-smart-indentation nil)
           (set-variable 'indent-tabs-mode nil))))
;(autoload 'python-mode "python-mode" "python editing mode." t)
;(autoload 'pdb "python-debug" "python debug." t)
;(define-key py-mode-map "\C-cj!"     '(py-shell "manage.py" "shell"))

;; perl
(setq perl-mode-hook
      '(lambda ()
         (setq perl-indent-level 2)))

;; common lisp(slime)

;;(setq inferior-lisp-program "sbcl")
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
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq javascript-mode-hook
      '(lambda ()
         (setq javascript-indent-level 2)))

;; aspx
(autoload 'asp-mode "asp-mode")
(setq auto-mode-alist 
      (cons '("\\.asp\\'" . asp-mode) auto-mode-alist))

;; F#
(setq load-path (cons "~/emacs_site-lisp/ide/fsharp" load-path))
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
(add-to-list 'load-path "~/emacs_site-lisp/evernote")
(require 'evernote-mode)
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(global-set-key "\C-cvc" 'evernote-create-note)
(global-set-key "\C-cvo" 'evernote-open-note)
(global-set-key "\C-cvs" 'evernote-search-notes)
(global-set-key "\C-cvS" 'evernote-do-saved-search)
(global-set-key "\C-cvw" 'evernote-write-note)
(global-set-key "\C-cvp" 'evernote-post-region)
(global-set-key "\C-cvb" 'evernote-browser)

(add-to-list 'load-path "~/emacs_site-lisp/elpa/clojure-mode-1.11.5")
(require 'clojure-mode)
(add-hook 'clojure-mode-hook
          '(lambda ()
             (paredit-mode 1)))
(setq inferior-lisp-program "lein repl")

;; (require 'swank-clojure)
;; ;; (add-to-list 'slime-lisp-implementations
;; ;;              '(clojure ,(swank-clojure-cmd) :init swank-clojure-init))
;; (setq slime-lisp-implementations
;;       (append slime-lisp-implementations
;;               `((clojure ,(swank-clojure-cmd) :init swank-clojure-init))))

;; magit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/magit-1.1.1")
(autoload 'magit-status "magit" nil t)

;; scala/ensime
(add-to-list 'load-path "~/emacs_site-lisp/elpa/scala-mode-0.0.2")
(require 'scala-mode-auto)

(add-to-list 'load-path "~/emacs_site-lisp/ide/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; (setq yas/scala-directory "~/emacs_site-lisp/elpa/scala-mode-0.0.2/contrib/yasnippet/snippets")
;; (yas/load-directory yas/scala-directory)
(add-hook 'ensime-scala-mode-hook
          '(lambda ()
             ;;(yas/minor-mode-on)
             (local-set-key "\C-c \C-c" 'ensime-inf-eval-buffer)
             (local-set-key "\C-c \C-r" 'ensime-inf-eval-region)
             ))

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode) auto-mode-alist))
