;;; stian-mac.el -- mac specific config

;; Use mdfind for locate on mac
(setq locate-command "mdfind")

;; Don't open in new window when doing 'open -a Emacs filename.txt'
(setq ns-pop-up-frames nil)

(setq insert-directory-program "/usr/local/bin/gls") ; Remember to install gnu coreutils

(provide 'stian-mac)
