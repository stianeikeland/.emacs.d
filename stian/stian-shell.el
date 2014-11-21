;;; stian-shell.el -- shell mode config

;; Shell indentation
(defun se-shell-mode ()
  (interactive)
  (setq sh-basic-offset 4
        sh-indentation 4
        sh-indent-for-case-label 0
        sh-indent-for-case-alt '+))

(add-hook 'sh-mode-hook 'se-shell-mode)

(provide 'stian-shell)
