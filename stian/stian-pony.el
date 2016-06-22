;;; stian-pony -- pony lang

(package-require 'ponylang-mode)
(package-require 'flycheck-pony)

;; (add-to-list 'flycheck-checkers 'flycheck-pony)

(add-hook
  'ponylang-mode-hook
  (lambda ()
    (flycheck-mode)
    (set-variable 'indent-tabs-mode nil)
    (set-variable 'tab-width 2)))

(provide 'stian-pony)
