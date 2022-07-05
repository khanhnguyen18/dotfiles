
(setq user-emacs-directory "~/.emacs.d.gnu/")
(setq default-directory "~/.emacs.d.gnu")
(setq package-user-dir "~/.emacs.d.gnu/elpa")

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives `(("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq vc-follow-symlinks "t") ; prevent prompt when loading org file
(use-package diminish :ensure t)
(use-package org :pin gnu)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
