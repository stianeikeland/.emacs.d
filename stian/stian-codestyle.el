;;; stian-codestyle.el - Coding style

;; break lines on word boundry
(global-visual-line-mode 1)

(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)

(setq-default fill-column 80)
(setq fill-column 80)

(setq mode-require-final-newline nil)

(package-require 'ethan-wspace)
;; (global-ethan-wspace-mode 1) ;; Fucks with editorconfig

(defun makefile-tabs-are-less-evil ()
  (setq ethan-wspace-errors (remove 'tabs ethan-wspace-errors)))

(add-hook 'makefile-mode-hook 'makefile-tabs-are-less-evil)

;; (add-hook 'before-save-hook 'whitespace-cleanup)

;; FIXME move me..
(setq-default c-basic-offset 4)

(package-require 'editorconfig)
(editorconfig-mode 1)


(provide 'stian-codestyle)
