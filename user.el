;;; Stian's emacs setup

;; Based on starter kit
;; Lots of stuff stolen from @bodil and @magnars

;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(global-visual-line-mode 1) ;; break lines on word boundry

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 20) (height . 20)))

;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
;;(load-theme 'tomorrow-night-bright t)
(load-theme 'tomorrow-night t)

;; Default tomorrow-night line numbers are unreadable...
(custom-set-faces
 '(linum ((t (:foreground "gray53" :inherit
                          (shadow default))))))

;(set-cursor-color "yellow")

;(set-face-attribute 'default nil :height 120)

(defun presentation-mode ()
  "Bigger fonts and stuff for presentations"
  (interactive)
  (set-face-attribute 'default nil :height 200)
  (load-theme 'tomorrow-night-bright t))

(defun standard-editing-mode ()
  "Normal editing mode.."
  (interactive)
  (set-face-attribute 'default nil :height 140)
  (load-theme 'tomorrow-night t))

(standard-editing-mode)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

(load "~/.emacs.d/vendor/clojure")
(load "~/.emacs.d/vendor/javascript")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(global-set-key "\M- " 'hippie-expand)

(setq ido-use-filename-at-point nil)

;; Save here instead of littering current directory with emacs backup files
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))

(add-hook 'before-save-hook 'whitespace-cleanup)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))


(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)
(setq-default fill-column 80) ; oh come on, 80 width has been standard since forever..

; Always newline and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

; Review this...
;(setq projectile-completion-system 'grizzl)
(setq projectile-completion-system 'ido)

(add-to-list 'load-path "~/.emacs.d/")
(require 'se-project)
(require 'se-edit)
(require 'se-git)
(require 'se-nav)
(require 'se-style)
(require 'se-snippets)
(require 'se-deft)
(require 'se-lisp-highlight)

; Nyan position
(package-require 'nyan-mode)
(nyan-mode 1)
(setq nyan-bar-length 16
      nyan-wavy-trail t)

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

; Flx ido mode
(package-require 'flx-ido)
(package-require 'ido-vertical-mode)

(flx-ido-mode 1)
(setq ido-use-faces nil)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

; Smart parens
(package-require 'smartparens)
(require 'smartparens-config)

(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          groovy-mode
          js2-mode-hook)
  (add-hook it 'turn-on-smartparens-mode))

(setq sp-highlight-pair-overlay nil)
(setq sp-autoescape-string-quote nil)

; Lines are 80 characters wide
(setq fill-column 80)

; Guess indentation for html, default 2
(add-hook 'sgml-mode-hook
          (lambda ()
            ;; Default indentation to 2, but let sgml mode guess, too.
            (set (make-local-variable 'sgml-basic-offset) 2)
            (sgml-guess-indent)))

;; use undo-tree
;(package-require 'undo-tree)
;(global-undo-tree-mode)

;; Don't open in new window when doing 'open -a Emacs filename.txt'
(setq ns-pop-up-frames nil)

;; Open the current file as root.
(defun current-as-root ()
  "Reopen current file as root"
  (interactive)
  (set-visited-file-name (concat "/sudo::" (buffer-file-name)))
  (setq buffer-read-only nil))


(add-hook 'clojure-mode-hook 'hl-comment-block-enable)
(add-hook 'emacs-lisp-mode-hook 'hl-comment-block-enable)

(setq mode-require-final-newline nil)

;; Shell indentation
(defun se-shell-mode ()
  (interactive)
  (setq sh-basic-offset 4
        sh-indentation 4
        sh-indent-for-case-label 0
        sh-indent-for-case-alt '+))

(add-hook 'sh-mode-hook 'se-shell-mode)

;; Close current buffer using cmd-w
(global-set-key (kbd "s-w") 'kill-this-buffer)

(setq-default c-basic-offset 4)

;; Dired (less verbose):
(package-require 'dired-details+)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; Magit whitespace diffs
(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

;;(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

;; Prevent f*(#$ annoying popup windows..
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

;; Use mdfind for locate on mac
(setq locate-command "mdfind")

;; Switch buffer with cmd-t.
(global-unset-key (kbd "s-b"))
(global-set-key (kbd "s-b") 'ido-switch-buffer)

;; Projectile switch file with cmd-p
(global-unset-key (kbd "s-p"))
(global-set-key (kbd "s-p") 'projectile-find-file)

(provide 'user)

;;; user.el ends here
