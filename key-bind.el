(global-set-key [(control \;)] 'backward-delete-char)
(global-set-key [(control \.)] 'backward-kill-word)
(global-set-key [(control \')] 'redo)
(global-set-key (kbd "C-c m c") 'comment-region)
(global-set-key (kbd "C-c n c") 'uncomment-region)
(global-set-key (kbd "C-c e r") 'eval-region)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [(meta g)] 'goto-line)
(global-set-key "\C-x\C-j" 'dired-jump)
(global-set-key "\C-xve" 'cvs-examine)
(global-set-key "\C-xvn" 'svn-status)
(global-set-key [(control tab)] 'my-indent-or-complete)
;(global-set-key [(control c)(control v)] 'compile)
(global-set-key [(control shift h)] 'hexl-mode)
;; show speedbar
(global-set-key [(control escape)] 'speedbar)
;; haskell
(global-set-key [(control meta down-mouse-3)] 'imenu)
;(global-set-key [(alt f)] 'iwb)

;; dictionary
(global-set-key (kbd "C-c d") 'sdcv-search)
;; ecb activate/deactivate
(global-set-key [(meta m)] 'mew)
(global-set-key [f12] 'ecb-minor-mode)

(global-set-key "\C-cmg" 'emms-playlist-mode-go)
(global-set-key "\C-cms" 'emms-start)
(global-set-key "\C-cml" 'emms-stop)
(global-set-key "\C-cm " 'emms-pause)
(global-set-key "\C-css" 'emms-seek)
(global-set-key "\C-cst" 'emms-seek-to)
(global-set-key "\C-c>" 'emms-seek-forward)
(global-set-key "\C-c<" 'emms-seek-backward)

(global-set-key "\C-xvf" 'vc-version-diff)

;(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-RET") 'toggle-fullscreen)
(global-set-key (kbd "C-<return>") 'toggle-maximize-frame)

(global-set-key [(meta kp-subtract)] 'sams-other-frame-backwards) 
(global-set-key [(meta kp-add)] 'other-frame) 

(global-set-key "\M-D" 'duplicate-thing)

(defalias 'qrr 'query-replace-regexp)
(defalias 'mg 'magit-status)
(defalias 'clj 'clojure-jack-in)
(defalias 'igf 'igrep-find)
(defalias 'ig 'igrep)
(defalias 'mt 'multi-term)
(defalias 'ms 'multi-eshell)


