(defun dk/org-mode-setup()

  (setq evil-normal-state-cursor '(box "yellow")
        evil-visual-state-cursor '(hollow "orange"))
  (set-face-attribute 'default nil :font "Menlo" :weight 'regular :height 230)
  (set-face-attribute 'fixed-pitch nil :font "Fira code" :height 180)
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))

  (set-face-attribute 'org-level-1 nil :foreground "deeppink" :font "Cantarell"
                      :weight 'regular :height 1.2)
  (set-face-attribute 'org-level-2 nil :foreground "turquoise1" :font "Cantarell"
                      :weight 'regular :height 1.15)
  (set-face-attribute 'org-level-3 nil :foreground "goldenrod1" :font "Cantarell"
                      :weight 'regular :height 1.1)
  (set-face-attribute 'org-level-4 nil :foreground "#b6e63e" :font "Cantarell"
                      :weight 'regular :height 1.05)
  (set-face-attribute 'mode-line nil :background "pale goldenrod"
                      :foreground "black")
  (set-face-foreground 'mode-line-emphasis "red")
  (set-face-foreground 'doom-modeline-buffer-modified "red")
  (set-face-foreground 'doom-modeline-project-dir "blue")

  ;; (text-scale-set 2)
                                        ;(set-face-attribute 'default nil :font "Source Code Pro for Powerline" :weight 'medium :height 200);"Menlo"
                                        ;(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 200)
                                        ;(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
                                        ;(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  )
(use-package! org
  :hook (org-mode . dk/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-superstar-headline-bullets-list '("⛳" "○" "○" "⚽" "●" "○" "●"))
  ;; Agenda
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-agenda-files
        '("~/Dropbox/org/task.org"))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WORK(w)" "HEALTH(h)" "HABIT" "PROCESSING(p)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
      '(("TODO" . "red")
        ("WORK" . "orange")
        ("PROCESSING"."yellow")
        ("DONE"."green")
        ("HEALTH"."CYAN")
        ("HABIT"."MAGENTA")
        ))

  )

(use-package! org-tempo
  :config
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp")))

(map! "<f1>" (lambda() (interactive) (ibuffer)))
(map! "<f4>" (lambda() (interactive) (org-indent-block)))
(map! "<f3>" (lambda() (interactive) (switch-to-buffer nil)))
(map! "<f5>" (lambda() (interactive) (org-babel-execute-src-block nil)))

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

(setq org-habit-show-all-today t)

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

;  (org-babel-load-file
;   (expand-file-name "~/.doom.d/ndk-tools.org"))
