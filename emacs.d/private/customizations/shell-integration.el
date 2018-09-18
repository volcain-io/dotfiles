;; Use zsh for default multi-term shell
(setq multi-term-program "/usr/bin/zsh")

;; Sets up exec-path-from shell
(setq exec-path-from-shell-variables
      (append exec-path-from-shell-variables
              (list "TERM"
                    ;; "RUST_SRC_PATH"
;;                     "..."
                    )))
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
