;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Literal search, rather than regex, in spacemacs search - helm-ag
(setq-default helm-grep-ag-command-option "-Q")

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)
