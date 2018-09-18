;; Set Dart SDK Path
;; Enable analyzer support
;; Auto format before save
(setq dart-sdk-path "/opt/dart-sdk/"
  dart-enable-analysis-server t
  dart-format-on-save t)
;; Use Flycheck for error checking
(add-hook 'dart-mode-hook 'flycheck-mode)
