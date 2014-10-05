;; clojure
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

(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(require 'auto-complete)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'cider-repl-mode-hook 'auto-complete-mode)

(define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
(define-key cider-repl-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
