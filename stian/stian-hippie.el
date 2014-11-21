;;; stian-hippie.el -- hippie expansion config

(package-require 'hippie-exp)

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list
      (delete 'try-complete-file-name
              hippie-expand-try-functions-list))

(setq hippie-expand-try-functions-list
      (delete 'try-complete-file-name-partially
              hippie-expand-try-functions-list))

(global-set-key "\M- " 'hippie-expand)

(provide 'stian-hippie)
