;; Simple Lisp Files
;(add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/el")
;(require 'pabbrev)

;; ;; Ruby Mode
(add-to-list 'load-path "~/emacs_site-lisp/elpa/ruby-mode-1.1")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/ruby-electric-20131027.2245")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/inf-ruby-20131113.1130")
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;;如果文件后缀名不为.rb，但是脚本第一行有#!ruby之类的说明 
;;也相应调用此ruby模式 

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)

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
;; (add-hook 'ruby-mode-hook 
;;           '(lambda () 
;;              'inf-ruby-minor-mode
;;              (ruby-electric-mode)))

(eval-after-load "ruby-mode"
  '(add-hook 'ruby-mode-hook
             '(lambda ()
                (progn
                  (ruby-electric-mode)
                  (flycheck-mode)
                  (inf-ruby-minor-mode)))))

;; ;; Rinari Mode (Rails)
;; (add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/rinari")
;; (add-to-list 'load-path "~/emacs_site-lisp/ide/ruby/rinari/rhtml")
;; (require 'rinari)
;; (setq auto-mode-alist (cons '("\\.rhtml\\'" . rhtml-mode) auto-mode-alist))



