;;; se-deft -- deft setup

(package-require 'deft)

(setq deft-directory "~/Dropbox/Notes")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)

(global-set-key [f8] 'deft)

(provide 'se-deft)
