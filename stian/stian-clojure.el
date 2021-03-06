;;; stian-clojure -- configure clojure mode

;; clean me please!!!!! FIXME!!!

(package-require 'clojure-mode)

(package-require 'cider-eval-sexp-fu)

(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs?$" . clojure-mode))

;; cider
(package-require 'cider)

(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(setq cider-repl-print-length 100)
(setq cider-repl-history-size 1000)

(setq cider-ovelays-use-font-lock t)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(add-hook 'cider-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'subword-mode)

;; (package-require 'midje-mode)
;; (add-hook 'clojure-mode-hook 'midje-mode)

(package-require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)


(add-hook 'cider-mode-hook 'eldoc-mode)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-prefer-local-resources t)

(setq nrepl-hide-special-buffers t)


;; Flycheck:
(package-require 'flycheck-clojure)
(eval-after-load 'flycheck '(flycheck-clojure-setup))
;; Remember linters in ~/.lein/profile.clj

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

(package-require 'yesql-ghosts)
(require 'yesql-ghosts)
(set-face-background 'yesql-ghosts-defn-face (face-attribute 'default :background))

(provide 'stian-clojure)
