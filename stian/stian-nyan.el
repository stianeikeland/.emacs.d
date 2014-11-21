;;; stian-nyan.el -- Nyan mode position indicator

(package-require 'nyan-mode)
(nyan-mode 1)
(setq nyan-bar-length 16
      nyan-wavy-trail nil)

(provide 'stian-nyan)
