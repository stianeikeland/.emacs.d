;;; stian-diminish.el -- clean the mode line

;; Helper
(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

; Cleanup modeline
(package-require 'diminish)
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "magit-auto-revert-mode" '(diminish 'magit-auto-revert-mode))

(eval-after-load "yasnippet" '(diminish 'yas-minor-mode " Ⓨ"))
(eval-after-load "golden-ratio-mode" '(diminish 'golden-ratio-mode " ⊞"))
(eval-after-load "golden" '(diminish 'golden-ratio-mode " ⊞"))
(eval-after-load "flycheck-mode" '(diminish 'flycheck-mode " Ⓕ"))
(eval-after-load "flyspell-mode" '(diminish 'flyspell-mode " Ⓢ"))
(eval-after-load "company-mode" '(diminish 'company-mode " Ⓒ"))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "clojure-mode" clojure-mode "Clj")

(after 'magit (diminish 'magit-auto-revert-mode))

(provide 'stian-diminish)
