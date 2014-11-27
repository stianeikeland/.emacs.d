;;; stian-keyboard.el -- keyboard shortcuts / remappings

; Always newline and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Close current buffer using cmd-w
(global-set-key (kbd "s-w") 'kill-this-buffer)

;; Rename current buffer file
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; Switch buffer with cmd-t.
(global-unset-key (kbd "s-b"))
(global-set-key (kbd "s-b") 'ido-switch-buffer)

;; Projectile switch file with cmd-p
(global-unset-key (kbd "s-p"))
(global-set-key (kbd "s-p") 'projectile-find-file)

(global-set-key (kbd "C-c C-f") 'projectile-find-file)

;; Complete using company
(global-set-key [M-tab] 'company-complete)

;; Narrow-widen-dwim
(global-unset-key (kbd "C-x n"))
(global-set-key (kbd "C-x n") 'narrow-or-widen-dwim)

(provide 'stian-keyboard)
