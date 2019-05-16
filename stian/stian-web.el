;;; stian-web -- configure web stuff

(package-require 'less-css-mode)


;; Color color codes:
(package-require 'rainbow-mode)
(dolist (mode '(css-mode less-css-mode html-mode nxhtml-mode nxhtml-mumamo-mode))
  (add-hook (intern (concat (symbol-name mode) "-hook"))
            (lambda () (rainbow-mode))))


;; Web mode:
(package-require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))

;; Highlight columns plz
(setq web-mode-enable-current-column-highlight t)

;; Highlight matching element plz
(setq web-mode-enable-current-element-highlight t)

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2)))

(add-hook 'web-mode-hook 'smartparens-mode)

(package-require 'company-web)

;; (defun my-web-mode-hook ()
;;   "Hook for `web-mode'."
;;     (set (make-local-variable 'company-backends)
;;          '(company-tern company-web-html company-yasnippet company-files)))

;; (add-hook 'web-mode-hook 'my-web-mode-hook)

;; ;; Enable JavaScript completion between <script>...</script> etc.
;; (defadvice company-tern (before web-mode-set-up-ac-sources activate)
;;   "Set `tern-mode' based on current language before running company-tern."
;;   (message "advice")
;;   (if (equal major-mode 'web-mode)
;;       (let ((web-mode-cur-language
;;              (web-mode-language-at-pos)))
;;         (if (or (string= web-mode-cur-language "javascript")
;;                 (string= web-mode-cur-language "jsx")
;;                 )
;;             (unless tern-mode (tern-mode))
;;           (if tern-mode (tern-mode -1))))))


;; (add-hook 'web-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-web-html))
;;                           (company-mode t)))


(provide 'stian-web)
