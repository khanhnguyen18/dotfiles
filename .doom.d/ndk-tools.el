(defun ndk-copy-to-clipboard (str)
  (with-temp-buffer
    (insert str)
    (clipboard-kill-region (point-min) (point-max)))
  )

(defun ndk-tools-generate-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d"))
  )
