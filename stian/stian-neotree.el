;;; stian-neotree.el - neotree

(package-require 'neotree)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(global-set-key [f8] 'neotree-project-dir)

(setq neo-smart-open t) ; jump to active file on open

(setq neo-window-width 40)

;; Better word wrap
(add-hook 'neo-after-create-hook
   #'(lambda (_)
       (with-current-buffer (get-buffer neo-buffer-name)
         (setq truncate-lines t)
         (setq word-wrap nil)
         (make-local-variable 'auto-hscroll-mode)
         (setq auto-hscroll-mode nil))))

(package-require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; remember to: M-x all-the-icons-install-fonts

(global-set-key (kbd "H-n") 'neotree-toggle)

(provide 'stian-neotree)