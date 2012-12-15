;; platfrom-dependent config: mac

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(require 'maxframe)

(defvar maxframe-maximized-p nil "maxframe is in fullscreen mode")

(defun toggle-maximize-frame ()
  "Toggle maximized frame"
  (interactive)
  (setq maxframe-maximized-p (not maxframe-maximized-p))
  (cond (maxframe-maximized-p (maximize-frame))
        (t (restore-frame))))

(defun ns-toggle-maximize-frame ()
  ;; ?
  )


