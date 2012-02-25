;;根据字典档补全英文单词，用来补全pluskid的yasnippet也不错，补全后再按tab，也可以提高一点效率

(setq ywb-dict-file "~/.dict")

(defun ywb-read-dict-file ()

  "Read dictionary file"

  (interactive)

  (if (file-exists-p ywb-dict-file)

      (save-excursion

        (let ((buffer (find-file-noselect ywb-dict-file))

              (done nil)

              mode beg end)

          (set-buffer buffer)

          (goto-char (point-min))

          (re-search-forward "^\\*\\s-*\\(.*-mode\\)" nil t)

          (setq mode (buffer-substring (match-beginning 1)

                                       (match-end 1)))

          (setq beg (1+ (match-end 0)))

          (while (progn

                   (if (re-search-forward "^\\*\\s-*\\(.*-mode\\)" nil t)

                       (setq end (match-beginning 0))

                     (setq end (point-max))

                     (setq done t))

                   ;; (message "mode: %s, beg: %d, end: %d" mode beg end)

                   (with-current-buffer  (get-buffer-create (format " %s-dic
t" mode))

                     (erase-buffer)

                     (setq major-mode (intern mode))

                     (insert-buffer-substring buffer beg end))

                   (setq mode (match-string 1))

                   (setq beg (1+ (match-end 0)))

                   (not done)))

          (kill-buffer buffer)))

    (message "file %s is not exits!" ywb-dict-file)))

(ywb-read-dict-file)
