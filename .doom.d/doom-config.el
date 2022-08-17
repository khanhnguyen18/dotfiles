(defun dk/org-mode-setup()
  (text-scale-set 2)
  ;(set-face-attribute 'default nil :font "Source Code Pro for Powerline" :weight 'medium :height 200);"Menlo"
  ;(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 200)
  ;(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  ;(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  )
(use-package! org
  :hook (org-mode . dk/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))

  (set-face-attribute 'org-level-1 nil :font "Cantarell" :weight 'regular :height 1.2)
  (set-face-attribute 'org-level-2 nil :font "Cantarell" :weight 'regular :height 1.15)
  (set-face-attribute 'org-level-3 nil :font "Cantarell" :weight 'regular :height 1.1)
  ;; Agenda
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-agenda-files
        '("~/Dropbox/org/task.org"))
  (setq org-todo-keywords
      '((sequence "TODO(t)" "WORK(w)" "HEALTH(h)" "PROCESSING(p)" "|" "DONE(d)")))
        )

(setq org-todo-keyword-faces
  '(("TODO" . "red")
    ("WORK" . "orange")
    ("PROCESSING"."yellow")
    ("DONE"."green")
    ("HEALTH"."CYAN")
))

(use-package! org-tempo
  :config
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp")))

(map! "<f5>" (lambda() (interactive) (org-babel-execute-src-block)))
(map! "<f4>" (lambda() (interactive) (org-indent-block)))
(map! "<f3>" (lambda() (interactive) (switch-to-buffer nil)))

(use-package! org-roam
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

(map! "C-M-j" (lambda() (interactive) (+vertico/switch-workspace-buffer)))

(defun system-move-file-to-trash (file)
  (call-process (executable-find "trash") nil 0 nil file))

(setq org-clock-sound "~/SOFT/bell.wav")
(defun play-sound-internal (sound)
  (sound-wav-play (nth 2 sound))
  )
;; (let ((file (expand-file-name "~/Downloads/bell.wav")))
;;   (if (file-exists-p file)
;;       (play-sound-file file)
;;     ))

(after! org-agenda
  (org-babel-load-file
   (expand-file-name "dashboard.org" "~/.doom.d"))
)
