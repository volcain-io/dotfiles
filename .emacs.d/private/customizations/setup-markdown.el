(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(setq markdown-live-preview-engine 'vmd)
;; use github-pandoc.css file to convert to html5
(setq markdown-command "pandoc -c ~/.emacs.d/private/customizations/github-pandoc.css --from markdown_github -t html5 --mathjax --highlight-style pygments --standalone")

(add-hook 'markdown-mode-hook #'flyspell-mode)
(add-hook 'markdown-mode-hook #'smartparens-mode)
