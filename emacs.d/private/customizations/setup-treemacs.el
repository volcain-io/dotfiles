(require 'treemacs)
(require 'doom-themes)

;; set icon size
(treemacs-resize-icons 16)
;; don't use generic icons
;; (setq doom-treemacs-use-generic-icons nil)
(custom-set-variables '(doom-treemacs-use-generic-icons nil))
;; set doom themes config
(doom-themes-treemacs-config)
;; corrects (and improves) org-mode's native fontification
(doom-themes-org-config)
;; position treemacs buffer on the right
(setq treemacs-position 'right)
;; automatically focus current selected file
(setq treemacs-follow-mode t)
