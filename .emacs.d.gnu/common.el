;(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 200)
 ; (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
;  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
 ; (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  ;(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  ;(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  ;(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
 ; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

 ; (dolist (face '((org-level-1 . 1.2)
  ;                (org-level-2 . 1.15)
   ;               (org-level-3 . 1.1)
   ;               (org-level-4 . 1.05)
   ;               (org-level-5 . 1.1)
   ;               (org-level-6 . 1.1)
   ;               (org-level-7 . 1.1)
   ;               (org-level-8 . 1.1)))
   ; (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))


  ;; (set-face-attribute 'default nil
  ;;   :font "SauceCodePro Nerd Font Mono"
  ;;   :height 110
  ;;   :weight 'medium)
  ;; (set-face-attribute 'fixed-pitch nil
  ;;   :font "SauceCodePro Nerd Font Mono"
  ;;   :height 110
  ;;   :weight 'medium)
  ;; Makes commented text and keywords italics.
  ;; This is working in emacsclient but not emacs.
  ;; Your font must have an italic face available.
  ;; (set-face-attribute 'font-lock-comment-face nil
  ;;   :slant 'italic)
  ;; (set-face-attribute 'font-lock-keyword-face nil
  ;;   :slant 'italic)

  ;; Uncomment the following line if line spacing needs adjusting.
  ;;(setq-default line-spacing 0.12)

  ;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
  ;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
  ;; changes certain keywords to symbols, such as lamda!
  ;; (setq global-prettify-symbols-mode t)

(setq mac-right-option-modifier 'meta)
