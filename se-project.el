;;; se-project.el -- projectile for project management

(package-require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(package-require 'project-explorer)
(global-set-key (kbd "C-x p") 'project-explorer-open)

(provide 'se-project)
