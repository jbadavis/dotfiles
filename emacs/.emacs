(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(setq make-backup-files nil)
;; no backup files
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq Buffer-menu-sort-column 4)
(setq inhibit-startup-screen t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(ivy-mode t)
 '(package-selected-packages
   (quote
    (swiper evil-magit abgaben projectile ivy use-package magit general spacemacs-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'spacemacs-dark)

(set-face-attribute 'default nil
    :family "Fira code"
    :weight 'Regular
    :width 'normal
    :height 140)

(setq use-package-always-ensure t)

(use-package evil
  :config
  (evil-mode 1))

(use-package evil-magit)

(use-package ivy
  :config
  (ivy-mode 1))

(use-package swiper)

(use-package magit)

(use-package general)

(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(general-create-definer my-leader-def
  :prefix "SPC")

;; ** Global Keybindings
(my-leader-def
  :keymaps 'normal
  "g" 'magit-status
  "p" `projectile-find-file
  "TAB" `projectile-switch-to-buffer
  "'" 'swiper)
