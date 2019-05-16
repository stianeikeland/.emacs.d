;;; stian-company -- company mode completions

(package-require 'company)
(package-require 'company-quickhelp)

(setq company-idle-delay 0.5
      company-show-numbers t
      company-tooltip-limit 10
      company-minimum-prefix-length 2
      pos-tip-border-width 0)

;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
;; (setq company-tooltip-flip-when-above t)

;; (package-require 'company-tern)

(package-require 'company-tabnine)
;; (add-to-list 'company-backends #'company-tabnine)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))


(add-hook 'after-init-hook
          (lambda ()
            (global-company-mode)
            (company-quickhelp-mode 1)
            (add-to-list 'company-backends ;;'company-tern
                         ;; 'company-elm
                         'company-tabnine
                         )))

;(package-require 'company-yasnippet)
(global-set-key (kbd "C-c y") 'company-yasnippet)


;; (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

;; Remove tabnine
;; (setq company-backends (delete 'company-tabnine company-backends))

(provide 'stian-company)