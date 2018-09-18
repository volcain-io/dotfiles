  ;; I should write a toggle function to show descriptive or literate links in Org-mode
  ;;(setq org-descriptive-links nil)

  ;; Org-reveal - define were reveal.js files can be found
  ;; (I place reveal.js files in same directory as I write the org files)
  (setq org-reveal-root "")

  ;; Avoid conflict when loading `org` functions
  (with-eval-after-load 'org
    ;; Define the location of the file to hold tasks
    (setq org-agenda-files '("~/Dropbox/Orgzly/")
          org-default-notes-file "~/Dropbox/Orgzly/TODOs.org"
          ;; Define a kanban style set of stages for todo tasks
          org-todo-keywords '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "CANCELED" "ARCHIVED"))
          ;; Setting Colours (faces) for todo states to give clearer view of work
          org-todo-keyword-faces '(
                                   ("TODO" . (:foreground "white" :weight bold :background "teal"))
                                   ("DOING" . (:foreground "yellow" :weight bold))
                                   ("BLOCKED" . (:foreground "white" :weight bold :background "darkred"))
                                   ("REVIEW" . (:foreground "orange" :weight bold))
                                   ("DONE" . (:foreground "green" :weight bold))
                                   ("CANCELED" . (:foreground "white" :weight bold :background "gray"))
                                   ("ARCHIVED" .  (:foreground "white" :weight bold :background "blue")))
          ;; Progress Logging
          ;; When a TODO item enters DONE, add a CLOSED: property with current date-time stamp
          org-log-done 'time)
          ;; org-table--fedit-source
    )

  ;; Markdown mode hook for orgtbl-mode minor mode
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)

  ;; Turn on visual-line-mode for Org-mode only
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)

  ;; End of Org-mode Configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Searching Configuration

  ;; Literal search, rather than regex, in spacemacs search - helm-ag
  (setq-default helm-grep-ag-command-option "-Q")

