(add-hook 'org-mode-hook (lambda () (text-scale-set 3)))

(setq custom--inhibit-theme-enable nil)
(custom-theme-set-faces
 'doom-badger
 '(org-level-1 ((t (:foreground "yellow"))))
 '(org-level-2 ((t (:foreground "orange"))))
 '(org-level-3 ((t (:foreground "cyan"))))
)

(setq mac-right-option-modifier 'super)
