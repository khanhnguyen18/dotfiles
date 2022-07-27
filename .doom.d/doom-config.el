(defun dk/org-mode-setup()
  (text-scale-set 3)
)

(use-package! org
  :hook (org-mode . dk/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))

  (set-face-attribute 'org-level-1 nil :font "Cantarell" :weight 'regular :height 1.3)
  (set-face-attribute 'org-level-2 nil :font "Cantarell" :weight 'regular :height 1.2)
  (set-face-attribute 'org-level-3 nil :font "Cantarell" :weight 'regular :height 1.1)
)
; màu vàng :foreground "#ffad29"

(use-package! org-tempo
  :config
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp")))

(map! "<f5>" (lambda() (interactive) (org-babel-execute-src-block)))

(use-package! org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Dropbox/RoamNotes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(setenv "PATH"
        (concat "/Library/TeX/texbin" ":"
                (getenv "PATH")))

(setq org-latex-compiler "xelatex")

(setq org-latex-to-pdf-process
  '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode %f"))

(setq mac-right-option-modifier 'meta)
