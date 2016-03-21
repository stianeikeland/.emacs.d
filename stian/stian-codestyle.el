;;; stian-codestyle.el - Coding style

;; break lines on word boundry
(global-visual-line-mode 1)

(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)

(setq-default fill-column 80)
(setq fill-column 80)

(package-require 'ethan-wspace)
(global-ethan-wspace-mode 1)

(setq mode-require-final-newline nil)

(add-hook 'before-save-hook 'whitespace-cleanup)

;; FIXME move me..
(setq-default c-basic-offset 4)

(package-require 'editorconfig)
(editorconfig-mode 1)


(provide 'stian-codestyle)
