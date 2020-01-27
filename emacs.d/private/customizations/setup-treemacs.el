(use-package treemacs
  :ensure t
  :defer t
  :init

  :config
  (progn
    (setq treemacs-position     'right)  ;; position treemacs buffer on the right
    ;; set icon size
    (treemacs-resize-icons 16)
    ;; automatically focus current selected file
    (treemacs-follow-mode t)
  )
)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom treemacs theme
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

;; don't use generic icons
;; (setq doom-treemacs-use-generic-icons nil)
; (custom-set-variables '(doom-treemacs-use-generic-icons nil))
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
)

