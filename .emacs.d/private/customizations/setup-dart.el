;; set Dart SDK Path
(setq dart-sdk-path "/opt/dart-sdk/"
  ;; enable analyzer support
  dart-enable-analysis-server t
  ;; auto format before save
  dart-format-on-save t)
;; use Flycheck for error checking
(add-hook 'dart-mode-hook #'flycheck-mode)
