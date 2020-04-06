;; disable fullscreen
(setq git-magit-status-fullscreen nil)
(setq git-enable-git-support t)
(setq git-gutter-use-fringe t)

;; Load in magithub features after magit package has loaded
;; (use-package magithub
;;    :after magit
;;    :config (magithub-feature-autoinject t))

;; Use Spacemacs as the $EDITOR (or $GIT_EDITOR) for git commits messages
;; when using git commit on the command line
;; (global-git-commit-mode t)
