;;; se-project.el -- projectile for project management

(package-require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(provide 'se-project)
