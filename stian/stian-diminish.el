;;; stian-diminish.el -- clean the mode line

; Cleanup modeline
(package-require 'diminish)
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "magit-auto-revert-mode" '(diminish 'magit-auto-revert-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))


(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "clojure-mode" clojure-mode "Clj")


(provide 'stian-diminish)
