;; choose tern as backend
(setq javascript-backend 'tern)
;; enable prettier as formatter
(setq javascript-fmt-tool 'prettier)
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
;; support project local installations
(setq node-add-modules-path t)

(provide 'setup-js)
