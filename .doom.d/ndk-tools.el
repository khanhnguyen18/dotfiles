(defun ndk-copy-to-clipboard (str)
  (with-temp-buffer
    (insert str)
    (clipboard-kill-region (point-min) (point-max)))
  )

(defun ndk-tools-generate-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d"))
  )

(org-babel-load-file
 (expand-file-name "/Users/khanh/Dropbox/Code/collect-done-task.org"))
(defun collect-all-done-task ()
  (interactive)
  (collect-done-task " HEALTHS TODOS WORKS " "COMPLETE")
  )
