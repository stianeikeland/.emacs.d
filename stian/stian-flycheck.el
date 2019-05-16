;;; stian-flycheck.el - configure flycheck

(package-require 'flycheck)
(package-require 'flycheck-color-mode-line)
(package-require 'flycheck-pos-tip)

(add-hook 'flycheck-mode-hook 'flycheck-pos-tip-mode)

(require 'flycheck)
(require 'flycheck-color-mode-line)

(set-face-background 'flycheck-error "#660000")
(set-face-foreground 'flycheck-error nil)
(set-face-background 'flycheck-warning "#775500")
(set-face-foreground 'flycheck-warning nil)
(set-face-background 'flycheck-color-mode-line-error-face "#660000")
(set-face-background 'flycheck-color-mode-line-warning-face "#553300")
(set-face-background 'flycheck-color-mode-line-info-face nil)
(set-face-foreground 'flycheck-color-mode-line-error-face nil)
(set-face-foreground 'flycheck-color-mode-line-warning-face nil)
(set-face-foreground 'flycheck-color-mode-line-info-face nil)

(eval-after-load "flycheck"
  '(progn
     (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode 'flycheck-pos-tip-mode #'flycheck-elm-setup)
     (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(provide 'stian-flycheck)
