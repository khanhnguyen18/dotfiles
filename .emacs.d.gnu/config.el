(global-set-key (kbd "<f5>") (lambda() (interactive) (org-babel-load-file (expand-file-name "config.org" user-emacs-directory))))

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
