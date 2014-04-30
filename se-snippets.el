;;; se-snippets -- yasnippets

(package-require 'yasnippet)
(yas-global-mode 1)

(setq yas-prompt-functions '(yas-ido-prompt))

(provide 'se-snippets)
