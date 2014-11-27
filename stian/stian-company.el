;;; stian-company -- company mode completions

(package-require 'company)

(setq company-idle-delay 0.5)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)

;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)

(package-require 'company-tern)

(add-hook 'after-init-hook
          (lambda ()
            (global-company-mode)
            (add-to-list 'company-backends 'company-tern)))

(provide 'stian-company)
