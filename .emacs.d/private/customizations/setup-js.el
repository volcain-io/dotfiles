;; support project local installations
(setq node-add-modules-path t)

;; choose tern as backend
(setq javascript-backend 'tern)
;; enable prettier as formatter
(setq javascript-fmt-tool 'prettier)
;; format buffer before save
(setq javascript-fmt-on-save t)
;; enable import layer
(setq javascript-import-tool 'import-js)
;; enable server based REPL
(setq javascript-repl 'nodejs)
;; indent JSON files
(setq js-indent-level 2)
;; indent JS files
(setq js2-basic-offset 2)
;; presume node variables
(setq js2-include-node-externs t)
;; turn off js2 warnings
(setq js2-mode-show-strict-warnings nil)

(provide 'setup-js)
