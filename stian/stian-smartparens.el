;;; stian-smartparens.el -- config smartparens

(package-require 'smartparens)
(require 'smartparens-config)

(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode
          js2-mode-hook)
  (add-hook it 'turn-on-smartparens-mode))

(setq sp-highlight-pair-overlay nil)
(setq sp-autoescape-string-quote nil)

(provide 'stian-smartparens)
