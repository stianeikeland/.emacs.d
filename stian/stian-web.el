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


(provide 'stian-web)
