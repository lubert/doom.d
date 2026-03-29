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
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

(after! eglot
  (setq eglot-events-buffer-size 0)  ; disable event logging for performance
  (setq eglot-autoshutdown t)        ; shut down server when last buffer is killed
  (setq eglot-connect-timeout 10)    ; don't block forever waiting for server
  (setq eglot-sync-connect nil)      ; connect asynchronously, don't block UI
  (fset #'eglot--message #'ignore))  ; suppress "connected" and other eglot messages

(add-hook 'find-file-hook #'diff-hl-margin-mode)
(add-hook 'find-file-hook #'diff-hl-mode)

(use-package! treesit-auto
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
