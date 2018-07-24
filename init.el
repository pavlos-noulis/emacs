
(require 'package)
(setq package-enable-set-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'use-package))

(defalias 'yes-or-no-p 'y-or-n-p)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))


(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  )
(setq-default pdf-view-display-size 'fit-page)



(use-package org-pdfview
  :ensure t)
(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)
(use-package spaces
  :ensure t
  :init
  )
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))
(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")
			    ))
(electric-pair-mode t)
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))
(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)
(line-number-mode 1)
(column-number-mode 1)
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
       (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line) ;; copy line from point
(setq display-time-24hr-format t)
(display-time-mode 1)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "Oh, it,s quite simple, if you are a friend, you speak the password, and the doors will open"))
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w ") 'kill-whole-word) ;;kill even when you are at the middle of a word
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "<s-return>") 'ansi-term)

(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(when window-system (global-hl-line-mode t))

(define-key key-translation-map "\C-t" "\C-x")
(define-key key-translation-map "\C-x" "\C-t")
(use-package sudo-edit
  :ensure t
  :bind ("s-e" . sudo-edit))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


;;org-mode open source code edit buffer in a new frame:
(setq org-src-window-setup 'other-frame)
;;org-mode enable babel languages execution

;;org-mode enable alphabetical bullets
(setq org-list-allow-alphabetical 't)
;;org-mode todo list
(setq org-todo-keywords
      '((sequence "NEXT" "TODO" "WAITING" "|" "DONE" )))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (sh . t)))

;;custom function to get the name of the current buffer in the kill ring

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key "")

;;source files directory

(setq find-function-C-source-directory "~/.emacs.d/src/")
;;setting erc

;;setq(setq erc-autojoin-channels-alist
      ;;'(("freenode.net" "##politics-uncensored" )
;;	("greekchat.eu" "#hellas" "music")
;;	("GRnet.gr" "##Hellas")))
;;(erc :server "irc.freenode.net" :port 6667 :nick "esperos")
;;(erc :server "atlantis.greekchat.eu" :port 6667 :nick "esperos")
;;(erc :server "srv.irc.gr" :port 6667 :nick "esperos")

;; setting org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq inhibit-startup-message t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("6dd2b995238b4943431af56c5c9c0c825258c2de87b6c936ee88d6bb1e577cb9" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files
   (quote
    ("~/Notes/c_language/c_main.org" "~/journal/prive.org" "~/Notes/practice.org" "~/Notes/org.org")))
 '(package-selected-packages
   (quote
    (org-pdfview pdf-tools expand-region spaces spaceline dashboard rainbow-delimiters sudo-edit -sudo-edit -sudo-eit smex ido-vertical-mode beacon atom-one-dark-theme atom-dark-theme spacemacs-theme which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))
(put 'upcase-region 'disabled nil)
