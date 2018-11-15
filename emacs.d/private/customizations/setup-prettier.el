(setq prettier-js-width-mode 'fill)

(defun my-prettier-js-mode ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (local-prettier (expand-file-name "node_modules/.bin/prettier" root))
         (global-prettier (executable-find "prettier"))

         (prettier (seq-find 'file-executable-p (list local-prettier
                                                    global-prettier))))

    (setq-local prettier-js-command prettier)))

(add-hook 'css-mode-hook 'my-prettier-js-mode)
;; (add-hook 'css-mode-hook #'prettier-js-mode)
(add-hook 'scss-mode-hook 'my-prettier-js-mode)
;; (add-hook 'scss-mode-hook #'prettier-js-mode)

(provide 'setup-prettier)
