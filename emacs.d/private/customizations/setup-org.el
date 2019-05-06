(require 'doom-themes)

;; enable GitHub, Bootstrap & Reveal.Js support
(setq org-enable-github-support t)
(setq org-enable-bootstrap-support t)
(setq org-enable-reveal-js-support t)
;; enable priority commands
(setq org-enable-priority-commands t)

;; place reveal.js files in same directory as org files)
(setq org-reveal-root "")

;; avoid conflict when loading `org` functions
(with-eval-after-load 'org
  ;; define the location of the file to hold tasks
  (setq org-agenda-files '("~/Dropbox/Orgzly/")
        org-default-notes-file "~/Dropbox/Orgzly/TODOs.org"
        ;; define a kanban style set of stages for todo tasks
        org-todo-keywords '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "CANCELED" "ARCHIVED"))
        ;; setting Colours (faces) for todo states to give clearer view of work
        org-todo-keyword-faces '(
                                 ("TODO" . (:foreground "#f8f8f2" :weight bold :background "#979797"))
                                 ("DOING" . (:foreground "#ffcc00" :weight bold))
                                 ("BLOCKED" . (:foreground "#f8f8f2" :weight bold :background "#ff5555"))
                                 ("REVIEW" . (:foreground "#282a36" :weight bold))
                                 ("DONE" . (:foreground "#50fa7b" :weight bold))
                                 ("CANCELED" . (:foreground "#f8f8f2" :weight bold :background "#ff79c6"))
                                 ("ARCHIVED" .  (:foreground "#1e2029" :weight bold)))
        ;; progress logging
        ;; when a TODO item enters DONE, add a CLOSED: property with current date-time stamp
        org-log-done 'time)
  )

;; markdown mode hook for orgtbl-mode minor mode
(add-hook 'markdown-mode-hook #'orgtbl-mode)

;; turn on visual-line-mode for Org-mode only
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

;; Corrects (and improves) org-mode's native fontification
(doom-themes-org-config)
