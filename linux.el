(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(defun toggle-maximize-frame (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(defadvice raise-frame (after make-it-work (&optional frame) activate)
  "Work around some bug? in raise-frame/Emacs/GTK/Metacity/something.
     Katsumi Yamaoka <yamaoka@jpl.org> posted this in 
     http://article.gmane.org/gmane.emacs.devel:39702"
  (call-process
   "wmctrl" nil nil nil "-i" "-R"
   (frame-parameter (or frame (selected-frame)) 'outer-window-id)))

(menu-bar-mode -1)
