;;; stian-ivy.el -- ivy configuration

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "H-b") 'ivy-switch-buffer)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "C-r") 'swiper-isearch-backward)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (define-key counsel-find-file-map (kbd "<right>") 'counsel-down-directory)
  (define-key counsel-find-file-map (kbd "<left>") 'counsel-up-directory))

(use-package ivy-rich
  :after ivy
  :ensure t
  :config
  (progn
    (ivy-rich-mode)))

(use-package ivy-hydra
  :after ivy
  :ensure t)

(provide 'stian-ivy)