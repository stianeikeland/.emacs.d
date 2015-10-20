;;; stian-project.el -- projectile for project management

(package-require 'projectile)
(projectile-global-mode)

(add-to-list 'projectile-globally-ignored-directories "node_modules")

;; Disable for now, as it's realllllly slooooow on laaaarge proooojects...
;; (package-require 'project-explorer)
;; (global-set-key (kbd "C-x p") 'project-explorer-open)
;; (require 'project-explorer)
;; (setq pe/omit-regex (concat pe/omit-regex "\\|^node_modules$"))

(setq projectile-completion-system 'ido)

;; Silver searcher
(package-require 'ag)
(setq ag-highlight-search t)

(provide 'stian-project)
