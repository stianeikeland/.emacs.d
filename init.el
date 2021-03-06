
;; Autocompile
(setq load-prefer-newer t)
(package-initialize)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(require 'package)

;; (dolist (source '(("melpa" . "https://melpa.org/packages/")
;;                   ("marmalade" . "https://marmalade-repo.org/packages/")
;;                   ("elpa" . "https://elpa.gnu.org/packages/")))
;;   (add-to-list 'package-archives source t))


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add .emacs.d/stian to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "stian"))

;; Set up environment vars
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Install if not present on require
(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Save here instead of littering current directory with emacs backup files
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

;; Prevent f*(#$ annoying popup windows..
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

;; My config

(setq my-configs
      '(stian-theme
        stian-fun
        stian-nav
        stian-nyan
        stian-diminish
        stian-goldenratio
        stian-hippie
        ;; stian-ido
        stian-ivy
        stian-shell
        stian-edit
        stian-flycheck
        stian-ruby
        stian-web
        stian-codestyle
        stian-git
        stian-project
        stian-javascript
        stian-smartparens
        stian-snippets
        stian-deft
        stian-lisp-highlight
        stian-clojure
        stian-company
        stian-dired
        stian-html
        stian-keyboard
        stian-coffee
        stian-purescript
        stian-avy
        stian-pony
        stian-volatile-highlights
        stian-neotree
        ))

(dolist (file my-configs)
  (require file))

(if (eq system-type 'darwin)
    (require 'stian-mac))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("deaf0dad46995bc682dd0acf1f0327cab82f1cf0025755ebb1bab714d0a6e8d3" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "77d704908bf206929237af1089f020781963dcc671489005fb8153c1745f689a" "5b3bd478f014d1ff16e1f8ee6e13329c274dd33721f14459d0d2d8f6d93f629d" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" default)))
 '(package-selected-packages
   (quote
    (rainbow-blocks rainmode auto-compile ruby-test-mode rust-mode phi-search use-package irony-eldoc flycheck-irony company-irony platformio-mode smart-jump nodejs-repl ahg magithub wgrep-ag rg go-mode rjsx-mode counsel councel lsp-mode github-browse-file clj-refactor flycheck-clojure cider clojure-mode csharp-mode flycheck git-commit js2-mode magit magit-popup multiple-cursors forth-mode all-the-icons neotree nord-theme hledger-mode flycheck-ledger ledger-mode ripgrep projectile-ripgrep csv-mode csv dumb-jump python-mode lua-mode reveal-in-osx-finder which-key projectile-rails sql-mssql flycheck-elm elm-mode ag projectile vagrant-tramp yaml-mode web-mode wc-mode volatile-highlights visible-mark tsql tide tern-auto-complete starter-kit-lisp smartscan smartparens slack ruby-refactor robe restclient rainbow-mode rainbow-delimiters purescript-mode pretty-symbols popup-imenu ponylang-mode pony-snippets paradox omnisharp nyan-mode nginx-mode move-text markdown-mode magit-gh-pulls less-css-mode json-mode js2-refactor imenu-anywhere ido-vertical-mode http highlight-indentation helm golden-ratio git-timemachine git-gutter fsharp-mode fold-dwim flyspell-popup flycheck-pos-tip flycheck-pony flycheck-color-mode-line expand-region ethan-wspace enh-ruby-mode editorconfig dired-details+ diminish deft company-web company-tern company-quickhelp coffee-mode cider-eval-sexp-fu beacon ace-window)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((encoding . utf-8)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby")
     (whitespace-line-column . 80)
     (lexical-binding . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#350f38b83c61"))))
 '(company-scrollbar-fg ((t (:background "#29162beb2ec1"))))
 '(company-tooltip ((t (:inherit default :background "#21e7243d2694"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
 '(highlight ((t (:background "dark green"))))
 '(linum ((t (:foreground "gray53" :inherit (shadow default)))))
 '(show-paren-match ((t (:background "gray38" :foreground "DarkOliveGreen3" :weight extra-bold)))))
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
