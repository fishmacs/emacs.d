;; Simple Lisp Files
(add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/el")
(require 'pabbrev)

;; Ruby Mode
(add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/ruby-mode")

(require 'ruby-mode)
(require 'ruby-electric)

(autoload 'ruby-mode "ruby-mode" "ruby editing mode." t)
(setq auto-mode-alist (cons '("\\.rb\\'" . ruby-mode) auto-mode-alist))
;;如果文件后缀名不为.rb，但是脚本第一行有#!ruby之类的说明 
;;也相应调用此ruby模式 
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) 
                                     interpreter-mode-alist)) 

(defun ruby-eval-buffer () (interactive)
"Evaluate the buffer with ruby."
(shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
(font-lock-mode t)
(setq standard-indent 2)
(pabbrev-mode t)
(ruby-electric-mode t)
(define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
;;(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
(add-hook 'ruby-mode-hook 
          '(lambda () 
             (inf-ruby-keys)
	     (ruby-electric-mode))) 

;; Rinari Mode (Rails)
(add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/rinari")
(add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/rinari/rhtml")
(require 'rinari)
(setq auto-mode-alist (cons '("\\.rhtml\\'" . rhtml-mode) auto-mode-alist))



