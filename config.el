;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(global-subword-mode 1)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-d" 'subword-kill)
(global-set-key "\M-h" 'subword-backward-kill)
(global-set-key "\M-z" 'zap-up-to-char)
(global-set-key "\M-n" 'highlight-symbol-next)
(global-set-key "\M-p" 'highlight-symbol-prev)
(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key "\C-ch" 'help-command)
(global-set-key "\M-0" 'treemacs-select-window)
(setq confirm-kill-emacs nil)

(setq-default flycheck-indication-mode 'left-margin)
(add-hook! 'flycheck-mode-hook #'flycheck-set-indication-mode)

(setq doom-theme 'doom-zenburn)
(custom-set-faces!
  '(hl-line :background "#2B2B2B")
  '(vertico-current :background "#4A4A4A"))
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

(set-popup-rule! "^\\*eldoc" :select t :side 'bottom :size 0.3)

(after! eglot
  (setq eglot-events-buffer-size 0)
  (setq eglot-autoshutdown t)
  (setq eglot-connect-timeout 10)
  (setq eglot-sync-connect nil)
  (fset #'eglot--message #'ignore))

(after! autorevert
  (doom-auto-revert-mode -1)
  (global-auto-revert-mode 1)
  (setq auto-revert-use-notify t
        auto-revert-interval 5
        auto-revert-check-vc-info nil))

(use-package! treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
