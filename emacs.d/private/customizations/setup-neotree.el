;; Neotree
;; https://github.com/jaypei/emacs-neotree

(require 'neotree)
(require 'all-the-icons)

;; every time when the neotree window is  opened, it will try to find current
;; file and jump to node.
(setq-default neo-smart-open t)

(setq neo-theme (if window-system 'icons 'nerd)) ; 'classic, 'nerd, 'ascii, 'arrow

(setq neo-vc-integration '(face char))

(setq neo-show-hidden-files t)

(setq neo-toggle-window-keep-p t)

(setq neo-force-change-root t)

(setq all-the-icons-color-icons t)

(setq all-the-icons-for-buffer t)

(setq all-the-icons-for-mode t)

(provide 'setup-neotree)
