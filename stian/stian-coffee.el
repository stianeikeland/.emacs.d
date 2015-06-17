;;; stian-coffee.el -- configure coffeescript modes

(package-require 'coffee-mode)

(eval-after-load 'coffee-mode
  '(progn
     ;; CoffeeScript uses two spaces.
     (setq coffee-tab-width 2)
     ;; remove the "Generated by CoffeeScript" header
     (add-to-list 'coffee-args-compile "--no-header")))

(provide 'stian-coffee)