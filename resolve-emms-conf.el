(require 'emms-setup)
(require 'emms-info-libtag)
(require 'emms-player-mpg321-remote)

(emms-devel)
(emms-default-players)
(push 'emms-player-mpg321-remote emms-player-list)
(push 'emms-player-mplayer emms-player-list)
(push 'emms-player-mplayer-playlist emms-player-list)

(setq
 emms-info-asynchronously t
 later-do-interval 0.0001
 emms-info-functions '(emms-info-libtag)
; emms-source-file-default-directory "~/Media/finished/"
 emms-mode-line-format " %s "
 emms-show-format "NP: %s")

(global-set-key (kbd "<kp-subtract>") 'emms-previous)
(global-set-key (kbd "<kp-add>") 'emms-next)
(global-set-key (kbd "<insert>") 'de-add-dir)
(global-set-key (kbd "<kp-insert>") 'de-toggle-playing)
(global-set-key (kbd "<f2>") 'emms-smart-browse)
(global-set-key (kbd "<kp-right>") 'emms-seek-forward)
(global-set-key (kbd "<kp-left>") 'emms-seek-backward)

(define-key emms-playlist-mode-map (kbd "/") 'de-search)
(define-key emms-browser-mode-map (kbd "W W") 'emms-browser-lookup-multi)

(add-hook 'emms-playlist-selection-changed-hook 'de-focus-on-track)
(add-hook 'emms-player-started-hook 'emms-show)

;; set up a default cover
;; (setq emms-browser-default-covers
;;       (list "/home/resolve/misc/cover_small.jpg" nil nil))

;; let compilation tracks be displayed together
(setq emms-browser-get-track-field-function
      'emms-browser-get-track-field-use-directory-name)

;; filters
(emms-browser-make-filter "2005" (emms-browser-filter-only-dir "~/Mp3s/2005"))
(emms-browser-make-filter "2000-2004" (emms-browser-filter-only-dir "~/Mp3s/2000-2004"))
(emms-browser-make-filter "90s" (emms-browser-filter-only-dir "~/Mp3s/90s"))
(emms-browser-make-filter "80s" (emms-browser-filter-only-dir "~/Mp3s/80s"))
(emms-browser-make-filter "70s" (emms-browser-filter-only-dir "~/Mp3s/70s"))
(emms-browser-make-filter "classical" (emms-browser-filter-only-dir "~/Mp3s/classical"))
(emms-browser-make-filter "mp3s" (emms-browser-filter-only-dir "~/Media/mp3s"))
(emms-browser-make-filter "pending" (emms-browser-filter-only-dir "~/Media/pending"))
(emms-browser-make-filter "not-played"
 (lambda (track) (not (funcall (emms-browser-filter-only-recent 365) track))))
(emms-browser-make-filter "last-3months" (emms-browser-filter-only-recent 90))
(emms-browser-make-filter "last-month" (emms-browser-filter-only-recent 30))
(emms-browser-make-filter "last-week" (emms-browser-filter-only-recent 7))
(emms-browser-make-filter
 "all"
 (lambda (track)
   (or
    (funcall (emms-browser-filter-only-type 'file) track)
    ;; ignore the pending directory
    (not (funcall
          (emms-browser-filter-only-dir "~/Media/pending") track)))))

(emms-browser-set-filter (assoc "all" emms-browser-filters))

(add-hook 'emms-browser-filter-changed-hook 'de-filter-changed)
(defun de-filter-changed ()
  (interactive)
  (if (string= emms-browser-current-filter-name "pending")
      (setq emms-browser-get-track-field-function
            'emms-browser-get-track-field-simple)
    (setq emms-browser-get-track-field-function
          'emms-browser-get-track-field-use-directory-name)))

;; recenter based on the current track
(defun de-focus-on-track ()
  (let ((w (get-buffer-window emms-playlist-buffer t)))
    (when w
      (with-selected-window w
        (emms-playlist-mode-center-current)
        (recenter '(4))))))

(defun de-toggle-playing ()
  (interactive)
  (if emms-player-playing-p
      (emms-pause)
    (emms-start)))

(defun de-add-dir ()
  (interactive)
  (call-interactively 'emms-add-directory-tree)
  (emms-playlist-mode-go))

(defun de-search ()
  (interactive)
  (goto-char (point-min))
  (call-interactively 'isearch-forward))

(defun emms-browser-lookup-multi ()
  (interactive)
  (emms-browser-lookup-wikipedia 'info-artist)
  (emms-browser-lookup-wikipedia 'info-album)
  (emms-browser-lookup-pitchfork 'info-artist))

;; for lukhas - remove album display in a filter
;; (defadvice emms-browser-next-mapping-type (after no-album (current-mapping))
;;   (when (eq ad-return-value 'info-album)
;;     (setq ad-return-value 'info-title)))
;; (defun toggle-album-display ()
;;   (if (string= emms-browser-current-filter-name "80s")
;;       (ad-activate 'emms-browser-next-mapping-type)
;;     (ad-deactivate 'emms-browser-next-mapping-type)))
;; (add-hook 'emms-browser-filter-changed-hook 'toggle-album-display)
