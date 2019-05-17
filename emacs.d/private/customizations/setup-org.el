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
  (setq org-agenda-files (list "~/Dropbox/Orgzly" "~/Dropbox/Orgzly/ktb")
        org-default-notes-file '("~/Dropbox/Orgzly/todo.org")
        ;; define a kanban style set of stages for todo tasks
        org-todo-keywords '((sequence "IDEA(i)" "TODO(t)" "IN-PROGRESS(p)" "NEXT(n)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)")
                            (sequence "|" "BLOCKED(b)" "CANCELED(c)" "ARCHIVED(a)"))
        ;; setting Colours (faces) for todo states to give clearer view of work
        org-todo-keyword-faces '(("IDEA" . (:foreground "#f1fa8c" :weight bold))
                                 ("TODO" . (:foreground "#f8f8f2" :weight bold))
                                 ("IN-PROGRESS" . (:foreground "#8be9fd" :weight bold))
                                 ("NEXT" . (:foreground "#ffb86c" :weight bold))
                                 ("WAITING" . (:foreground "#bd93f9" :weight bold))
                                 ("REVIEW" . (:foreground "#61bfff" :weight bold))
                                 ("DONE" . (:foreground "#50fa7b" :weight bold))
                                 ("BLOCKED" . (:foreground "#ff5555" :weight bold))
                                 ("CANCELED" . (:foreground "#ff79c6" :weight bold))
                                 ("ARCHIVED" .  (:foreground "#999999" :weight bold)))
        ;; define important tags
        org-tag-persistent-alist '((:startgroup . nil)
                                   ("easy" . ?e)
                                   ("medium" . ?m)
                                   ("hard" . ?h)
                                   (:endgroup . nil)
                                   (:startgroup . nil)
                                   ("home" . ?h)
                                   ("work" . ?w)
                                   ("research" . ?s)
                                   (:endgroup . nil)
                                   (:startgroup . nil)
                                   ("abholung" . ?a)
                                   ("auslieferung" . ?l)
                                   ("selbstabholung" . ?A)
                                   ("rücklieferung" . ?L)
                                   (:endgroup . nil))
        ;; progress logging
        ;; when a TODO item enters DONE, add a CLOSED: property with current date-time stamp
        org-log-done 'time)
  )

;; markdown mode hook for orgtbl-mode minor mode
(add-hook 'markdown-mode-hook #'orgtbl-mode)

;; turn on visual-line-mode for org-mode only
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'visual-line-mode)

;; Corrects (and improves) org-mode's native fontification
(doom-themes-org-config)
