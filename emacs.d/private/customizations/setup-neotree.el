(require 'neotree)
(require 'all-the-icons)

;; every time when the neotree window is opened, it will try to find current
;; file and jump to node.
(setq-default neo-smart-open t)
;; set theme
(setq neo-theme (if window-system 'icons 'nerd)) ; 'classic, 'nerd, 'ascii, 'arrow
;; show version control status
(setq neo-vc-integration '(face char))
;; show hidden files
(setq neo-show-hidden-files t)
;; toggle neotree
(setq neo-toggle-window-keep-p t)
;; switch to root
(setq neo-force-change-root t)
;; setup icons
(setq all-the-icons-color-icons t)
(setq all-the-icons-for-buffer t)
(setq all-the-icons-for-mode t)

(provide 'setup-neotree)
