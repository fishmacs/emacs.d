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


;; ��sentence-end����ʶ��ȫ�ǵı�����
(setq sentence-end "\\([������]\\|����\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(load "desktop") 
(desktop-load-default) 
(desktop-read)

;;���ļ���ת�� buffer �ķ���ģʽ��
;;��Win�����������ˬ�������л��̷�
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
;;����������Ϣ 
(setq inhibit-startup-message t) 

;;�رշ��˵ĳ���ʱ����ʾ�� 
(setq visible-bell t) 

;;��title����Ϊ���ļ���@LC's Emacs" 
(setq frame-title-format
        '("GNU Emacs[ " (buffer-file-name "%f \]"
                (dired-directory dired-directory "%b \]"))))

;;��꿿������ʱ��������Զ��ÿ�����ס����
(mouse-avoidance-mode 'animate)

;;�����������ÿ����ù��ָ��ĳ�����ŵ�ʱ����ʾ����ƥ������� 
(show-paren-mode t) 
(setq show-paren-style 'parentheses) 

;;����ȱʡģʽ��text�������ǻ���ģʽ 
;(setq default-major-mode 'text-mode) 
;(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;;���ı���Ĭ�ϸ�ʽΪgb2312-dos
;(setq inhibit-eol-conversion 'gb2312-dos)

;;����tabΪ4���ո�Ŀ�ȣ�������ԭ����2 
;(setq default-tab-width 4) 

;;��ֹҳ�����ʱ���� 
(setq scroll-margin 3
      scroll-conservatively 10000)

;; ���еı����ļ�ת�Ƶ�~/backupsĿ¼�� 
(setq backup-directory-alist (quote (("." . "~/backups")))) 
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/backups")))
(setq backup-by-copying t)
;; Emacs �У��ı��ļ�ʱ��Ĭ�϶�����������ļ�(�� ~ ��β���ļ�)��������ȫȥ��
;; (������ȡ)��Ҳ�����ƶ����ݵķ�ʽ��������õ��ǣ������е��ļ����ݶ�����һ
;; ���̶��ĵط�("~/var/tmp")������ÿ�������ļ���������ԭʼ�������汾�����µ�
;; ����汾�����ұ��ݵ�ʱ�򣬱����ļ��Ǹ�����������ԭ����

;;�����������ļ� 
;(setq make-backup-files nil) 

;;����kill-ring-max(�Ҳ�֪����ô��������ʣ�)Ϊ200���Է����⣺�� 
(setq kill-ring-max 200)

;; ���������ļ�����ͬ�Ļ���ʱ��ʹ��ǰ׺��Ŀ¼���� buffer ���֣�����ԭ����
;; foobar<?> ��ʽ��
(setq uniquify-buffer-name-style 'forward)

;;��ʾ���� 
(setq display-time-day-and-date t) 
(display-time) 

;;��ʾʱ��
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;; ����ʱ�������ʶ�����һ�α����ļ���ʱ�䡣
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S K.T")

;; Ĭ�ϵ��ռ��ļ�
;(setq diary-file "~/diary/rj")

;; �������ڵصľ�γ�Ⱥ͵�����calendar ���Ը�����Щ��Ϣ��֪��ÿ����ճ�������
;; ��ʱ�䡣
(setq calendar-latitude +45.75)
(setq calendar-longitude +126.63)
(setq calendar-location-name "Harbin")

;;�����ϴεĲ�����¼��SESSION 
(add-to-list 'load-path "~/tmp") 
(require 'session) 
(add-hook 'after-init-hook 'session-initialize) 

(load "desktop") 
(desktop-load-default) 
(desktop-read) 

;;����Ĭ�Ϲ���Ŀ¼ 
(setq default-directory "D:/") 

;;��ʾ�к�
(setq column-number-mode t)

;����Ĭ�ϵ�������110
(setq default-fill-column 168)

;;�����к�,��������:M-x setnu-mode 
;(require 'setnu) 

;;'y' for 'yes', 'n' for 'no' 
(fset 'yes-or-no-p 'y-or-n-p) 

;; �����۵� 
(load-library "hideshow") 
(add-hook 'java-mode-hook 'hs-minor-mode) 
(add-hook 'perl-mode-hook 'hs-minor-mode) 
(add-hook 'php-mode-hook 'hs-minor-mode) 
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;;����ͼƬ��� 
(require 'thumbs) 
(auto-image-file-mode t) 

;; �������Ϊ t������� TAB �ַ��ϻ���ʾΪһ���󷽿� :)��
(setq x-stretch-cursor nil)

;;�﷨�������� shell-mode �� text-mode ֮���ģʽ��ʹ���﷨����
;;���Ǵ򿪺�PHP�������ˣ�-_-!
;(setq font-lock-maximum-decoration t)
;(setq font-lock-global-modes '(not shell-mode text-mode))
;(setq font-lock-verbose t)
;(setq font-lock-maximum-size 
;       '((t . 1048576) (vm-mode . 5250000)))

;;��ѹ���ļ�ʱ�Զ���ѹ����
;(auto-compression-mode 1)                             

;;��겻Ҫ��˸��
;(blink-cursor-mode -1)

;;������ʾƥ������š�
(show-paren-mode 1)

;;������ M-x foo-bar-COMMAND �����������ʾ��
;(icomplete-mode 1)


;;SET KEY 
(global-set-key "\C-xk" 'kill-this-buffer) 
(global-set-key "\C-xr" 'replace-string) 
(global-set-key "\C-xt" 'insert-now-time);�Ѳ��뵱ǰʱ��󶨵� C-x t

;; ���ļ���ʱ����˵�[^M] ����������Ϊ[C-q-m] ����
;; C-x <RET> r gb2312-dos ����
;; C-x <RET> r gb2312-unix ����
;; ��������ĺ���
(defun remove-trailing-ctrl-m ()
        (interactive)
        (goto-char (point-min))
        (while (search-forward-regexp "
        " nil t)
        (replace-match "" nil t)))


;;������html������ʾ
;(require 'htmlize)

(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
