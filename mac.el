;; platfrom-dependent config: mac

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; chinese font(only english font in menlo or monaco)
(set-fontset-font
    (frame-parameter nil 'font)
    'han '("STHeiti" . "unicode-bmp"))

(require 'maxframe)

(defvar maxframe-maximized-p nil "maxframe is in fullscreen mode")

(defun toggle-maximize-frame (&optional f)
  "Toggle maximized frame"
  (interactive)
  (setq maxframe-maximized-p (not maxframe-maximized-p))
  (cond (maxframe-maximized-p (maximize-frame))
        (t (restore-frame))))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (ns-toggle-fullscreen))

;defun(defun maximize-frame () 
;  (interactive)
;  (set-frame-position (selected-frame) 0 0)
;  (set-frame-size (selected-frame) 1000 1000))
