;;; stian-html -- html config

;; Guess indentation for html, default 2
(add-hook 'sgml-mode-hook
          (lambda ()
            ;; Default indentation to 2, but let sgml mode guess, too.
            (set (make-local-variable 'sgml-basic-offset) 2)
            (sgml-guess-indent)))


(provide 'stian-html)
