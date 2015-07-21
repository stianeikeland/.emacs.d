;;; stian-purescript.el

(package-require 'purescript-mode)
(add-to-list 'auto-mode-alist (cons "\\.purs\\'" 'purescript-mode))

(defun font-lock-replace-symbol (mode reg sym)
  (font-lock-add-keywords
   mode `((,reg
           (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                     ,sym 'decompose-region)))))))

(defun setup-haskell-arrows (mode mode-map)
  (font-lock-replace-symbol mode "\\(->\\)" "→")
  (font-lock-replace-symbol mode "\\(<-\\)" "←")
  (font-lock-replace-symbol mode "\\(=>\\)" "⇒")

  (define-key mode-map (kbd "→") (lambda () (interactive) (insert "->")))
  (define-key mode-map (kbd "←") (lambda () (interactive) (insert "<-")))
  (define-key mode-map (kbd "⇒") (lambda () (interactive) (insert "=>"))))

(setup-haskell-arrows 'purescript-mode purescript-mode-map)


(add-hook 'purescript-mode-hook 'turn-on-purescript-indentation)

(eval-after-load 'flycheck
  '(progn
     (flycheck-define-checker pulp
       "Use Pulp to flycheck PureScript code."
       :command ("pulp" "build" "--monochrome")
       :error-patterns
       ((error line-start
               (or (and "Error at " (file-name)    " line " line ", column " column ":"
                        (zero-or-more " "))
                   (and "\"" (file-name) "\" (line " line ", column " column "):"))
               (message (one-or-more (not (in "*"))))
               line-end))
       :modes purescript-mode)
     (add-to-list 'flycheck-checkers 'pulp)))

(provide 'stian-purescript)
