;;; stian-clojure -- configure clojure mode

;; clean me please!!!!! FIXME!!!

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

;; cider
;;(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(setq cider-repl-print-length 100)
(setq cider-repl-history-size 1000)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(package-require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

(package-require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)


(add-hook 'cider-mode-hook 'eldoc-mode)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-prefer-local-resources t)

(setq nrepl-hide-special-buffers t)


;; (add-hook 'cider-repl-mode-hook 'company-mode)
;; (add-hook 'cider-mode-hook 'company-mode)


;; (require 'auto-complete)
;; (add-hook 'clojure-mode-hook 'auto-complete-mode)
;; (add-hook 'cider-repl-mode-hook 'auto-complete-mode)

;; (define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
;; (define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)

;;(require 'ac-cider)
;;(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;;(add-hook 'cider-mode-hook 'ac-cider-setup)
;;(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-mode))


(package-require 'clj-refactor)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-m")))


(package-require 'align-cljlet)


(provide 'stian-clojure)
