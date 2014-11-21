;;; stian-theme.el -- theming and colors

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

;;(load-theme 'tomorrow-night-bright t)
(load-theme 'tomorrow-night t)

;; Default tomorrow-night line numbers are unreadable...
(custom-set-faces
 '(linum ((t (:foreground "gray53" :inherit
                          (shadow default))))))

;(set-cursor-color "yellow")
;(set-face-attribute 'default nil :height 120)


(package-require 'color)
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


(defun presentation-mode ()
  "Bigger fonts and stuff for presentations"
  (interactive)
  (set-face-attribute 'default nil :height 200)
  (load-theme 'tomorrow-night-bright t))

(defun standard-editing-mode ()
  "Normal editing mode.."
  (interactive)
  (set-face-attribute 'default nil :height 140)
  (load-theme 'tomorrow-night t))

(standard-editing-mode)

(provide 'stian-theme)
