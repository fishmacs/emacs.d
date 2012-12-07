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
(global-font-lock-mode t)
;;(setq font-lock-maximum-decoration)

(setq search-highlight t)

;; display Chinese characters in GBK extended
;(setq font-encoding-alist 
;     (cons '("gb2312.1980" . chinese-gbk) font-encoding-alist))

;(create-fontset-from-fontset-spec
;  "-*-Courier New-normal-r-*-*-16-*-*-*-c-*-fontset-chinese,
;  chinese-gb2312:-outline-ËÎÌו-normal-r-normal-normal-*-*-96-96-p-*-gb2312.1980-0" t)

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

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load "package")
;; change package-user-dir
(setq package-user-dir "~/emacs_site-lisp/elpa")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))