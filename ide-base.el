(setq load-path (cons "~/.emacs.d/ide" load-path))

;; cedet
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elib-1.0"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/common"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/srecode"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/cogre"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/semantic"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/speedbar"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/eieio"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/cedet-1.0/ede"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/jdee-2.4.0.1/lisp"))

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
(global-ede-mode 1)                      ; Enable project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 

;;to enable code folding
;;下面两行忽然出错？2009-12-30
;;;(global-semantic-tag-folding-mode)
;;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

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
(add-to-list 'load-path (expand-file-name "~/.emacs.d/ide/ecb-2.40"))
(require 'ecb-autoloads)
(setq truncate-partial-width-windows nil)

;;格式化整个文件。Eclipse下面CTRL+SHIFT+F就解决问题了。Vim下面gg=G也顺利搞定。Emacs下面得C-x h TAB。怎么敲速度都上不去。有了下面这段代码，事情就好办多了, M-x iwb
(defun iwb ()
 "indent whole buffer"
 (interactive)
 (delete-trailing-whitespace)
 (indent-region (point-min) (point-max) nil))

;;一列语言中的每一个创建一组mode-map(其实就是Lisp里的一个Pair类型)。如果在创建的mode-map或者global-map里找到了\C-j的定义，就把它替换成回车。这样做的好处是我们只需要替换自己关心的语言模式。其它情况下\C-j不受影响。
(mapcar
 (lambda (mode)
   (let ((mode-hook (intern (concat (symbol-name mode) "-hook")))
         (mode-map (intern (concat (symbol-name mode) "-map"))))
     (add-hook mode-hook
               `(lambda nil 
                        (local-set-key 
                               (kbd "RET")
                               (or (lookup-key ,mode-map "\C-j")
                                   (lookup-key global-map "\C-j"))))))) '(c-mode c++-mode cperl-mode emacs-lisp-mode java-mode html-mode lisp-mode ruby-mode sh-mode))

;; (setq gdb-many-windows t)
;(load-library "multi-gud.el")
;(load-library "multi-gdb-ui.el")