(setq load-path (cons "~/emacs_site-lisp/ide" load-path))

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

;; ;; Initialize CEDET
(load "cedet")
(setq semantic-ectag-program "/usr/bin/etags")
(setq ede-locate-setup-options
      '(ede-locate-global 
	ede-locate-idutils
	ede-locate-cscope
	;ede-locate-locate
	ede-locate-base))
; for prebuild cedet with emacs
;;(global-ede-mode 1)                      ; Enable project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 

;; to enable code folding
;; 下面两行忽然出错？2009-12-30
;; (global-semantic-tag-folding-mode)
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

(require 'semantic-ia)
;;to work with my include files and cedet
(semantic-add-system-include "~/include" 'c++-mode)
(semantic-add-system-include "~/include" 'c-mode)

;; bug with semantic-idle
;;(setq semantic-idle-scheduler-idle-time 99999999)
(global-semantic-idle-scheduler-mode -1) 
(global-semantic-idle-completions-mode 1)

;; use CScope to accelerate finding files within a project
(setq ede-locate-setup-options
      '(ede-locate-cscope
        ede-locate-base))

;; semantic 搜索范围
(setq semanticdb-project-roots 
      (list
       (expand-file-name "/")))

;; 自定义自动补齐命令，这部分是抄hhuu的，如果在单词中间就补齐，否则就是tab。 
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
 	  (hippie-expand nil)
 	  (indent-for-tab-command))
   )

;; hippie-expand的自动补齐策略，优先调用了senator的分析结果： 
(autoload 'senator-try-expand-semantic "senator")
(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
      )

;; cscope
(require 'xcscope)

;;ecb
(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/ecb-2.40"))
(require 'ecb-autoloads)
(setq truncate-partial-width-windows nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-source-path '(("/Users/zw/myproj" "myproj")
                        ("~/opensource" "opensource")
                        ("~/work/lanzhou/web/bookbag" "bookbag")
                        ("~/work/lanzhou/web/bookbag2" "bookbag2")
                        ("~/work/lanzhou/apps" "lanzhou-app")
                        ("~/work/mba/bupt" "bupt")
                        ("~/work/zhongou" "zhongou")
                        ("~/work" "work")
                        ("~/emacs_site-lisp" "emacs")
                        ("~/.virtualenvs" "pyenv")))

;;格式化整个文件。Eclipse下面CTRL+SHIFT+F就解决问题了。Vim下面gg=G也顺利搞定。Emacs下面得C-x h TAB。怎么敲速度都上不去。有了下面这段代码，事情就好办多了, M-x iwb
(defun iwb ()
 "indent whole buffer"
 (interactive)
 (delete-trailing-whitespace)
 (indent-region (point-min) (point-max) nil))

;;一列语言中的每一个创建一组mode-map(其实就是Lisp里的一个Pair类型)。如果在创建的mode-map或者global-map里找到了\C-j的定义，就把它替换成回车。这样做的好处是我们只需要替换自己关心的语言模式。其它情况下\C-j不受影响。
;; (dolist
;;  (lambda (mode)
;;    (let ((mode-hook (intern (concat (symbol-name mode) "-hook")))
;;          (mode-map (intern (concat (symbol-name mode) "-map"))))
;;      (add-hook mode-hook
;;                `(lambda nil 
;;                         (local-set-key 
;;                                (kbd "RET")
;;                                (or (lookup-key ,mode-map "\C-j")
;;                                    (lookup-key global-map "\C-j")))))))
;;  '(c-mode c++-mode cperl-mode emacs-lisp-mode java-mode html-mode lisp-mode ruby-mode sh-mode))

;; (setq gdb-many-windows t)
;(load-library "multi-gud.el")
;(load-library "multi-gdb-ui.el")

;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/yasnippet-0.6.1")
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/emacs_site-lisp/elpa/yasnippet-0.6.1/snippets")

(add-to-list 'load-path "~/emacs_site-lisp/elpa/popup-0.5")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/auto-complete-1.4")
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(add-to-list 'load-path "~/emacs_site-lisp/elpa/anything-1.287")
(require 'anything)

;; paredit
(add-to-list 'load-path "~/emacs_site-lisp/elpa/paredit-22")
(require 'paredit)

;; autopair
;; (add-to-list 'load-path "~/emacs_site-lisp/elpa/autopair-0.3")
;; (autoload 'autopair-global-mode "autopair" nil t)
;(autopair-global-mode)
;(add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))

;; emacs-for-python
;(add-to-list 'load-path (expand-file-name "~/emacs_site-lisp/ide/emacs-for-python"))
(load-file (expand-file-name "~/emacs_site-lisp/ide/emacs-for-python/epy-init.el"))
(epy-setup-ipython)
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)
(add-hook
      'python-mode-hook
      '(lambda ()
         (progn
           ;(set-variable 'py-indent-offset 4)
           (set-variable 'python-indent-offset 4))))
           ;; (ropemacs-mode)
           ;; (global-set-key (kbd "RET") 'newline-and-indent)
           ;; (set-variable 'py-smart-indentation nil)
           ;; (set-variable 'indent-tabs-mode nil))))

;; flycheck
(add-to-list 'load-path "~/emacs_site-lisp/elpa/f-20131207.804")
(add-to-list 'load-path "~/emacs_site-lisp/elpa/flycheck-20131213.445")
(add-hook 'after-init-hook
          '(lambda ()
             (progn
               (global-flycheck-mode)
               (setq autopair-dont-activate t))))

(speedbar-add-supported-extension ".scala")
(speedbar-add-supported-extension ".xml")
(speedbar-add-supported-extension ".png")
(speedbar-add-supported-extension ".properties")

