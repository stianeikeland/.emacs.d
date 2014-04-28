;;; se-git.el - magit setup

(package-require 'magit)
;(global-set-key (kbd "C-x g") 'magit-status)

(package-require 'git-gutter)
(global-git-gutter-mode t)
;(setq git-gutter:added-sign "+ ")
;(setq git-gutter:deleted-sign "- ")
;(setq git-gutter:modified-sign "= ")

(provide 'se-git)
