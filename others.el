;; .emacs initialization file
; -*- mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))



(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function 
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl))))) 

(global-set-key [(control x)(control r)] 'recentf-open-files-compl)


;; 让sentence-end可以识别全角的标点符号
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(load "desktop") 
(desktop-load-default) 
(desktop-read)

;;打开文件和转换 buffer 的方便模式。
;;在Win下这个东西不爽，不能切换盘符
(require 'ido)
(ido-mode t)

(require 'color-theme)
(color-theme-gnome2)

(autoload 'table-insert "table" "WYGIWYS table editor")

(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key (kbd "") 'tabbar-backward)
(global-set-key (kbd "") 'tabbar-forward)


(require 'swbuff)
(global-set-key (kbd "") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps 
     '("^ " "\\*.*\\*"))

(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)


(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; copy lines
(defun copy-lines(&optional arg) 
  (interactive "p") 
  (save-excursion 
    (beginning-of-line) 
    (set-mark (point)) 
    (if arg 
        (next-line (- arg 1))) 
    (end-of-line) 
    (kill-ring-save (mark) (point)))) 
;; set key 
(global-set-key (kbd "C-c w") 'copy-lines) 



;; Load CEDET
(load-file "C:/emacs/cedet-1.0pre3/common/cedet.el")

(add-to-list 'load-path "C:/emacs/ecb-2.32/")
(require 'ecb-autoloads)

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
'(column-number-mode t)
'(cua-mode nil)
'(ecb-auto-activate t)
'(ecb-gzip-setup (quote ("c:\\emacs\\bin\\gzip.exe" . windows)))
'(ecb-options-version "2.32")
'(ecb-other-window-behavior (quote all))
'(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
'(ecb-source-path (quote ("D:/")))
'(ecb-tar-setup (quote ("c:\\emacs\\bin\\tar.exe" . windows)))
'(ecb-wget-setup (quote ("c:\\emacs\\bin\\wget.exe" . windows)))
'(ecb-windows-width 0.2)
'(global-font-lock-mode t nil (font-core))
'(hscroll-margin 0)
'(show-paren-mode t nil (paren))
'(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;禁用启动信息 
(setq inhibit-startup-message t) 

;;关闭烦人的出错时的提示声 
(setq visible-bell t) 

;;把title设置为“文件名@LC's Emacs" 
(setq frame-title-format
        '("GNU Emacs[ " (buffer-file-name "%f \]"
                (dired-directory dired-directory "%b \]"))))

;;光标靠近鼠标的时候，让鼠标自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;;下面的这个设置可以让光标指到某个括号的时候显示与它匹配的括号 
(show-paren-mode t) 
(setq show-paren-style 'parentheses) 

;;设置缺省模式是text，而不是基本模式 
;(setq default-major-mode 'text-mode) 
;(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;;打开文本的默认格式为gb2312-dos
;(setq inhibit-eol-conversion 'gb2312-dos)

;;设置tab为4个空格的宽度，而不是原来的2 
;(setq default-tab-width 4) 

;;防止页面滚动时跳动 
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 所有的备份文件转移到~/backups目录下 
(setq backup-directory-alist (quote (("." . "~/backups")))) 
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的两个版本和最新的
;; 五个版本。并且备份的时候，备份文件是复本，而不是原件。

;;不产生备份文件 
;(setq make-backup-files nil) 

;;设置kill-ring-max(我不知道怎么翻译这个词：)为200，以防不测：） 
(setq kill-ring-max 200)

;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的
;; foobar<?> 形式。
(setq uniquify-buffer-name-style 'forward)

;;显示日期 
(setq display-time-day-and-date t) 
(display-time) 

;;显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;; 默认的日记文件
;(setq diary-file "~/diary/rj")

;; 设置所在地的经纬度和地名，calendar 可以根据这些信息告知你每天的日出和日落
;; 的时间。
(setq calendar-latitude +45.75)
(setq calendar-longitude +126.63)
(setq calendar-location-name "Harbin")

;;保存上次的操作记录到SESSION 
(add-to-list 'load-path "~/tmp") 
(require 'session) 
(add-hook 'after-init-hook 'session-initialize) 

(load "desktop") 
(desktop-load-default) 
(desktop-read) 

;;设置默认工作目录 
(setq default-directory "D:/") 

;;显示列号
(setq column-number-mode t)

;设置默认的列数是110
(setq default-fill-column 168)

;;设置行号,开启命令:M-x setnu-mode 
;(require 'setnu) 

;;'y' for 'yes', 'n' for 'no' 
(fset 'yes-or-no-p 'y-or-n-p) 

;; 代码折叠 
(load-library "hideshow") 
(add-hook 'java-mode-hook 'hs-minor-mode) 
(add-hook 'perl-mode-hook 'hs-minor-mode) 
(add-hook 'php-mode-hook 'hs-minor-mode) 
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;开启图片浏览 
(require 'thumbs) 
(auto-image-file-mode t) 

;; 如果设置为 t，光标在 TAB 字符上会显示为一个大方块 :)。
(setq x-stretch-cursor nil)

;;语法高亮，除 shell-mode 和 text-mode 之外的模式中使用语法高亮
;;可是打开后PHP不高亮了，-_-!
;(setq font-lock-maximum-decoration t)
;(setq font-lock-global-modes '(not shell-mode text-mode))
;(setq font-lock-verbose t)
;(setq font-lock-maximum-size 
;       '((t . 1048576) (vm-mode . 5250000)))

;;打开压缩文件时自动解压缩。
;(auto-compression-mode 1)                             

;;光标不要闪烁。
;(blink-cursor-mode -1)

;;高亮显示匹配的括号。
(show-paren-mode 1)

;;给出用 M-x foo-bar-COMMAND 输入命令的提示。
;(icomplete-mode 1)


;;SET KEY 
(global-set-key "\C-xk" 'kill-this-buffer) 
(global-set-key "\C-xr" 'replace-string) 
(global-set-key "\C-xt" 'insert-now-time);把插入当前时间绑定到 C-x t

;; 打开文件的时候过滤掉[^M] 键盘上输入为[C-q-m] 或者
;; C-x <RET> r gb2312-dos 或者
;; C-x <RET> r gb2312-unix 或者
;; 运行下面的函数
(defun remove-trailing-ctrl-m ()
        (interactive)
        (goto-char (point-min))
        (while (search-forward-regexp "
        " nil t)
        (replace-match "" nil t)))


;;导出成html高亮显示
;(require 'htmlize)

(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
