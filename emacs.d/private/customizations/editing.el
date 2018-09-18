;; Customizations relating to editing a buffer.

(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)

(add-hook 'after-init-hook (lambda ()
                             (global-company-mode)
                             (company-quickhelp-mode 1)))

(setq company-idle-delay 0.3
      company-tooltip-idle-delay 0.3)

;; Don't try to ping things that look like domain names
(setq ffap-machine-p-known 'reject)

;; Highlights matching parenthesis
;; (show-paren-mode 1)

;; Highlight current line
;; (global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; yay rainbows!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Whitespace

(add-hook 'prog-mode-hook
          (lambda ()
            (setq c-basic-offset 2
                  tab-width 2
                  indent-tabs-mode nil)))

(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2
                  tab-width 2
                  indent-tabs-mode nil)))

(add-hook 'makefile-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq-default indent-tabs-mode t)
            (setq tab-width 2)))

(add-hook 'makefile-gmake-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq-default indent-tabs-mode t)
            (setq tab-width 2)))

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; highlight-symbol

(add-hook 'prog-mode-hook 'auto-highlight-symbol-mode)

(setq ahs-idle-interval 0.4)

;; truncate lines by default
(setq-default truncate-lines t)

;; display a vertical rule at column 80
(setq-default fill-column 120)

(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(add-hook 'text-mode-hook 'turn-on-fci-mode)

;; diff-hl setup

;; diff-hl - diff hightlights in right gutter as you type
(diff-hl-flydiff-mode)

;; Load in magithub features after magit package has loaded
(use-package magithub
   :after magit
   :config (magithub-feature-autoinject t))

;; Use Spacemacs as the $EDITOR (or $GIT_EDITOR) for git commits messages
;; when using git commit on the command line
(global-git-commit-mode t)


;; smooth-scrolling

(setq smooth-scroll-margin 5)

;; Flycheck

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Turn on command-log-mode when opening a source code or text file
(add-hook 'prog-mode-hook 'command-log-mode)
(add-hook 'text-mode-hook 'command-log-mode)
