;;; stian-ido.el -- IDO configuration

;; Flx ido mode
(package-require 'flx-ido)

;; Use vertical ido
(package-require 'ido-vertical-mode)
(ido-vertical-mode)

;; Make sure ido is really everywhere
(package-require 'ido-ubiquitous)
(ido-ubiquitous-mode)

(flx-ido-mode 1)

(setq ido-use-faces nil)

(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(setq ido-use-filename-at-point nil)

(provide 'stian-ido)
