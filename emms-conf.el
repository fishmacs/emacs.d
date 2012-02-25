;; Emms
(require 'emms-setup)
(require 'emms-info-libtag)
(emms-standard)
(emms-default-players)
(require 'emms-player-mpg321-remote)
;; (require 'emms-player-simple)
;; (require 'emms-source-file)
;; (require 'emms-source-playlist)
;; (setq emms-player-mplayer-parameters '("-slave")
;;       emms-player-list '(emms-player-mplayer
;;                          emms-player-mplayer-playlist
;;                          emms-player-mpg321))
(setq emms-player-list '(emms-player-mpg321-remote
                         emms-player-ogg123
                         emms-player-mplayer))
;; (add-hook 'emms-player-started-hook 'emms-show)
;;         (setq emms-show-format "NP: %s")
(setq
 emms-info-asynchronously t
 later-do-interval 0.0001
 emms-info-functions '(emms-info-libtag)
; emms-source-file-default-directory "~/Media/finished/"
 emms-mode-line-format " %s "
 emms-show-format "NP: %s")
