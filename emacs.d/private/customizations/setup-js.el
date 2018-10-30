(require 'company)
(require 'company-tern)
(require 'setup-smartparens)
(require 'flycheck-flow)

;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc.*$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc$" . json-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-python-json javascript-jshint
                                          javascript-gjslint javascript-jscs)))

;; use eslint with rjsx-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; Flycheck + ESLint
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (local-eslint (expand-file-name "node_modules/.bin/eslint" root))
         (global-eslint (executable-find "eslint"))

         (eslint (seq-find 'file-executable-p (list local-eslint
                                                    global-eslint))))

    (setq-local flycheck-javascript-eslint-executable eslint)))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; Standard
(defun my/use-standardjs-or-prettier-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         ;; ESLint
         (local-eslint (expand-file-name "node_modules/.bin/eslint" root))
         ;; Prettier
         (local-prettier (expand-file-name "node_modules/.bin/prettier" root))
         ;; Standard
         (local-standard-js (expand-file-name "node_modules/.bin/standard" root))
         (global-standard-js (executable-find "standard"))

         (eslint-js (seq-find 'file-executable-p (list local-eslint)))
         (prettier-js (seq-find 'file-executable-p (list local-prettier)))
         (standard-js (seq-find 'file-executable-p (list local-standard-js global-standard-js))))

    (cond ((not (eq eslint-js nil))
           (set-variable 'js-formatter-executable eslint-js)
           (set-variable 'js-formatter-args "--fix"))
          ((and (eq eslint-js nil)
                (not (eq prettier-js nil)))
           (set-variable 'js-formatter-executable prettier-js)
           (set-variable 'js-formatter-args "--write --single-quote"))
          ((and (eq prettier-js nil)
                (not (eq standard-js nil)))
           (set-variable 'js-formatter-executable eslint-js)
           (set-variable 'js-formatter-args "--fix"))
          )
  ))

(add-hook 'js-mode-hook #'my/use-standardjs-or-prettier-from-node-modules)

(defun my/js-fix ()
  (interactive)
    (let ((initial-point (point)))
      (when (and (eq 'js-mode major-mode)
                 (not (eq js-formatter-executable nil)))
          (call-process js-formatter-executable nil nil nil js-formatter-args (buffer-file-name))
      (revert-buffer t t t)
      (goto-char initial-point))
    ))

(add-hook 'after-save-hook #'my/js-fix)

;; Flycheck + Flowtype
;; (defun my/use-flow-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (local-flow (expand-file-name "node_modules/flow-bin/vendor/flow" root))
;;          (global-flow (executable-find "flow" root))

;;          (flow (seq-find 'file-executable-p (list local-flow
;;                                                   global-flow))))

;;     (setq-local flycheck-javascript-flow-executable flow)))
;; (add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules)
;; (flycheck-add-next-checker 'javascript-flow)

(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'js-mode-hook 'smartparens-mode)
(add-hook 'js-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
(add-hook 'rjsx-mode-hook 'subword-mode)
(add-hook 'rjsx-mode-hook 'smartparens-mode)
(add-hook 'json-mode-hook 'smartparens-mode)
(add-hook 'html-mode-hook 'subword-mode)

(setq js-indent-level 2)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
