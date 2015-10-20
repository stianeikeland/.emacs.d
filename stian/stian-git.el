;;; stian-git.el - magit setup

(package-require 'magit)
(package-require 'magit-gh-pulls)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls) ; Horribly slow!

(package-require 'git-gutter)
(global-git-gutter-mode t)
;(setq git-gutter:added-sign "+ ")
;(setq git-gutter:deleted-sign "- ")
;(setq git-gutter:modified-sign "= ")

;; Magit whitespace diffs
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

;;(add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

(provide 'stian-git)
