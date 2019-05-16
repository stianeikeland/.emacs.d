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


;; Emacs mac port

;; Keys
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)] 'kill-this-buffer)
(global-set-key [(hyper z)] 'undo)
(global-unset-key [(hyper b)])
(global-set-key [(hyper b)] 'ido-switch-buffer)
(global-set-key [(hyper t)] 'ido-switch-buffer)
(global-unset-key [(hyper p)])
(global-set-key [(hyper p)] 'projectile-find-file)

(global-set-key [(hyper h)] 'ns-do-hide-emacs)

;; mac switch meta key
(defun mac-switch-meta nil
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
        (setq mac-option-modifier 'meta)
        (setq mac-command-modifier 'hyper))
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta))))

;; I want my old settings back!
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter nil 'fullscreen (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;; there's also toggle-frame-fullscreen ..
(global-set-key [f12] 'toggle-fullscreen)

;; Show me help for partial commands
(package-require 'which-key)
(which-key-mode)

(provide 'stian-keyboard)
