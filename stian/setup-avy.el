;;; stian-avy.el - Avy jump to word/char

(package-require 'ace-window)
(package-require 'avy)

(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "H-.") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "H-,") 'ace-window)

(provide 'setup-avy)
