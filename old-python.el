;; python
(setq load-path (cons "~/emacs_site-lisp/elpa/python-mode-6.0.3" load-path))
(require 'python-mode)
;(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;(autoload 'python-mode "python-mode" "python editing mode." t)
;(autoload 'pdb "python-debug" "python debug." t)

(add-hook
      'python-mode-hook
      '(lambda ()
         (progn
           ;(set-variable 'py-indent-offset 2)
           (ropemacs-mode)
           (global-set-key (kbd "RET") 'newline-and-indent)
           (set-variable 'py-smart-indentation nil)
           (set-variable 'indent-tabs-mode nil))))

;; autopair on ' & '''
(add-hook 'python-mode-hook
          '(lambda ()
             (push '(?' . ?')
                   (getf autopair-extra-pairs :code))
             (setq autopair-handle-action-fns
                   (list #'autopair-default-handle-action
                         #'autopair-python-triple-quote-action))))

;(define-key py-mode-map "\C-cj!"     '(py-shell "manage.py" "shell"))

(add-to-list 'load-path "~/emacs_site-lisp/elpa/ipython-2927")
(setq py-python-command "ipython")
(require 'ipython)

;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/anything-ipython-0.1.2009")
;; (require 'anything-ipython)
;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;;                                 '(length initial-pattern)))

;; python/virtualenv
(add-to-list 'load-path "~/emacs_site-lisp/elpa/virtualenv-1.2")
(require 'virtualenv)

;; pymacs
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/elpa/pymacs-0.25"))
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(setq ropemacs-enable-shortcuts nil)
(setq reopmacs-local-prefix "C-c C-p")
