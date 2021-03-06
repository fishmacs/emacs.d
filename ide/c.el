(setq compile-command "make")

;; (setq c-default-style "linux"
;;       c-basic-offset 4)

;; the following elisp code is use to
;; construct the compile command automatically.
;; so you don't need to write or choose the compile
;; command in the minibuffer.
;;
;; the rule is as following:
;; first, find GNUmakefile" "makefile" "Makefile"
;; if found, compile command is "make -C ."
;; else try to find one of make file in ".."
;; if found, compile command is "make -C .."
;; continue until reach the root directory "/"
;; if the make file still isn't found, try the
;; trivial compile command , that is,
;; if in the c++ mode:
;;         g++ -o your_source your_source.cc
;; if in the c mode
;;         gcc -o your_source your_source.c
;; if all is failed, do nothing.
(defun make-is-root-dir(try-dir)
  (or
   ;; windows root dir for a driver or Unix root
   (string-match "\\`\\([a-zA-Z]:\\)?/$" try-dir)
   ;; tramp root-dir
   (and (featurep 'tramp)
        (string-match (concat tramp-file-name-regexp ".*:/$") try-dir))))

(defun make-throw-final-path(try-dir)
  (cond
   ;; tramp root-dir
   ((and (featurep 'tramp)
         (string-match tramp-file-name-regexp try-dir))
    (with-parsed-tramp-file-name try-dir foo
				 foo-localname))
   (t try-dir)))

(defun make-find-make-dir( try-dir)
  "return a directory contain makefile. try-dir is absolute path."
  (if (make-is-root-dir try-dir)
      nil ;; return nil if failed to find such directory.
    (let ((candidate-make-file-name `("GNUmakefile" "makefile" "Makefile")))
      (or (catch 'break
            (mapc (lambda (f)
                    (if (file-readable-p (concat (file-name-as-directory try-dir) f))
                        (throw 'break (make-throw-final-path try-dir))))
                  candidate-make-file-name)
            nil)
          (make-find-make-dir
           (expand-file-name (concat (file-name-as-directory try-dir) "..")))))))

(defun wcy-tramp-compile (arg-cmd)
  "reimplement the remote compile."
  (interactive "scompile:")
  (with-parsed-tramp-file-name default-directory foo
    (let* ((key (format "/plink:%s@%s:" foo-user foo-host))
           (passwd (password-read "PASS:" key))
           (cmd (format "plink %s -l %s -pw %s \"(cd %s ; %s)\""
                        foo-host foo-user
                        passwd
                        (file-name-directory foo-localname)
                        arg-cmd)))
      (password-cache-add key passwd)
      (save-some-buffers nil nil)
      (compile-internal cmd "No more errors")
      ;; Set comint-file-name-prefix in the compilation buffer so
      ;; compilation-parse-errors will find referenced files by ange-ftp.
      (with-current-buffer compilation-last-buffer
        (set (make-local-variable 'comint-file-name-prefix)
             (format "/plink:%s@%s:" foo-user foo-host))))))

(defun make-test-tramp-compile()
  (or (and (featurep 'tramp)
           (string-match tramp-file-name-regexp (buffer-file-name))
           (progn
             (if (not (featurep 'tramp-util)) (require 'tramp-util))
             'wcy-tramp-compile))
      'compile))

(defun make-get-local-file-name(file-name)
  (if (and
       (featurep 'tramp)
       (string-match tramp-file-name-regexp file-name))
      (with-parsed-tramp-file-name file-name foo
				   foo-localname)
    file-name))

(defun make ()
  (interactive)
  (let* ((compile-func (make-test-tramp-compile))
         (dir (make-find-make-dir (expand-file-name "."))))
    (funcall compile-func
             (if dir
                 (progn
                   ;; this cd change current dir of compilation buffer to where Makefile is,
                   ;; so we can location source file from compilation buffer directly.
                   (cd dir)
                   (concat "make -C " dir (if (eq compile-func 'tramp-compile) "&" "")))
               (concat
                (cond
                 ((eq major-mode 'c++-mode) "g++ -g -o ")
                 ((eq major-mode 'c-mode) "gcc -g -o "))
                (make-get-local-file-name (file-name-sans-extension (buffer-file-name)))
                " "
                (make-get-local-file-name (buffer-file-name)))))))

(defun compile-single-file ()
  (interactive)
  (let* ((compile-func (make-test-tramp-compile))
         (dir (make-find-make-dir (expand-file-name "."))))
    (funcall compile-func
	     (concat
	      (cond
	       ((eq major-mode 'c++-mode) "g++ -g -o ")
	       ((eq major-mode 'c-mode) "gcc -g -o "))
	      (make-get-local-file-name (file-name-sans-extension (buffer-file-name)))
	      " "
	      (make-get-local-file-name (buffer-file-name))))))

(defun my-c-mode-common-hook()
  ;; (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map [(f7)] 'make)
  (define-key c-mode-base-map [(control f7)] 'compile-single-file)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;; (define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  (setq c-default-style "linux"
        c-basic-offset 2
        tab-width 2))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; (add-hook 'c++-mode-hook
;; 	  '(lambda()
;; 	     (c-set-style "stroustrup")))