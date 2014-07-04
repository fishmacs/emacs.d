;; '(set-selection-coding-system 'euc-cn)
;; '(modify-coding-system-alist 'process "*" 'euc-cn)
;; '(setq default-process-coding-system '(euc-cn . euc-cn))
;; '(setq default-pathname-coding-system 'euc-cn)
;;'(default-input-method "chinese-pinyin-gb")
;;(custom-set-faces)

(setq debug-on-error t)
(setq next-line-add-newlines nil)
;;(setq-default transient-mark-mode t)
;;(setq-default delete-selection-mode t)

;;;Symbol's function definition is void: resize-minibuffer-mode
;;(resize-minibuffer-mode)

;;(setq font-encoding-alist
;;(append '(("MuleTibetan-0" (tibetan . 0))
;;	  ("GB2312"     (chinese-gb2312 . 0)))
;;font-encoding-alist))
	  
;;(set-default-font "-outline-Courier New-normal-r-normal-normal-12-12-96-96-c-*-iso8859-1")
(set-default-font "-apple-Menlo-medium-normal-normal-*-12-120-72-72-m-120-iso10646-1")
;;"-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"

(global-font-lock-mode t)
;;(setq font-lock-maximum-decoration)

(setq search-highlight t)

;; display Chinese characters in GBK extended
;(setq font-encoding-alist 
;     (cons '("gb2312.1980" . chinese-gbk) font-encoding-alist))

;(create-fontset-from-fontset-spec
;  "-*-Courier New-normal-r-*-*-16-*-*-*-c-*-fontset-chinese,
;  chinese-gb2312:-outline-ËÎÌå-normal-r-normal-normal-*-*-96-96-p-*-gb2312.1980-0" t)

;(setq default-frame-alist
;    (append
;    '((font . "fontset-chinese"))
;     default-frame-alist))

(setq dired-recursive-deletes t)
(setq dired-recursive-copies t)
(setq dired-isearch-filenames t)
(setq delete-by-moving-to-trash t)

(require 'dired-x)
;(push '("java" . (gb2312 . gb2312)) process-coding-system-alist)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(load "package")
;; change package-user-dir
(setq package-user-dir "~/emacs_site-lisp/elpa")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))

(setq stack-trace-on-error t)

;;; --- 相同缓存名字时加上路径以区别
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ;反方向的显示重复的Buffer名字
(setq uniquify-separator "/")                                  ;分隔符
(setq uniquify-after-kill-buffer-p t)                          ;删除重复名字的Buffer后重命名

(defun get-emacs-version ()
  (let* ((str-ver (split-string (substring emacs-version 0 -2) "\\."))
         (major (string-to-int (car str-ver)))
         (minor (string-to-int (cadr str-ver))))
    (list major minor)))

(let* ((ver (get-emacs-version))
       (major (car ver))
       (minor (cadr ver)))
  (if (or (and (= major 24) (>= minor 3))
          (> major 24))
      (defun compile-internal (command error-message
                                       &optional _name-of-mode parser
                                       error-regexp-alist name-function
                                       _enter-regexp-alist _leave-regexp-alist
                                       file-regexp-alist _nomessage-regexp-alist
                                       _no-async highlight-regexp _local-map)
        (if parser
            (error "Compile now works very differently, see `compilation-error-regexp-alist'"))
        (let ((compilation-error-regexp-alist
               (append file-regexp-alist (or error-regexp-alist
                                             compilation-error-regexp-alist)))
              (compilation-error (replace-regexp-in-string "^No more \\(.+\\)s\\.?"
                                                           "\\1" error-message)))
          (compilation-start command nil name-function highlight-regexp)))))

