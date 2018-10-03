(require 'prettier-js)

(setq prettier-js-width-mode 'fill)
;; (setq prettier-js-args '("--single-quote" "true" "--trailing-comma" "all"))

(defun my/use-prettier-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (local-prettier (expand-file-name "node_modules/.bin/prettier" root))
         (global-prettier (executable-find "prettier"))

         (prettier (seq-find 'file-executable-p (list local-prettier
                                                    global-prettier))))

    (setq-local prettier-js-command prettier)))

;; CSS
(add-hook 'css-mode-hook #'my/use-prettier-from-node-modules)
(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'scss-mode-hook #'my/use-prettier-from-node-modules)
(add-hook 'scss-mode-hook 'prettier-js-mode)

(provide 'setup-prettier)
;;; setup-prettier.el ends here
