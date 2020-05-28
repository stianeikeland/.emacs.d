;;; stian-nav.el - navigation and window management

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive "^")
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (Beginning-of-line))))

;; Transpose (rotate if multiple) windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "C-x C-o") 'rotate-windows)

;; Next and prev window
(global-set-key [C-tab] 'other-window)

(global-set-key [C-S-tab]
    (lambda ()
      (interactive)
      (other-window -1)))


;; scroll in place
(defun scroll-down-in-place (n)
  (interactive "p")
   (previous-line 5)
   (unless (eq (window-start) (point-min))
     (scroll-down 5)))

(defun scroll-up-in-place (n)
  (interactive "p")
  (next-line 5)
  (unless (eq (window-end) (point-max))
    (scroll-up 5)))

(global-set-key "\M-n" 'scroll-up-in-place)
(global-set-key "\M-p" 'scroll-down-in-place)


;; Kill buffer in other window
(global-set-key (kbd "C-x p")
                (lambda () (interactive)
                  (save-excursion
                    (other-window 1)
                    (quit-window))))


(windmove-default-keybindings)

;; Avy
;; (package-require 'avy)
;; (global-set-key (kbd "C-'") 'avy-goto-char-2)

;; Smartscan
(package-require 'smartscan)
(global-set-key "\C-H-n" 'smartscan-symbol-go-forward)

(package-require 'beacon)
(beacon-mode 1)
(setq beacon-color "MediumPurple")
(setq beacon-blink-duration 0.2)
(setq beacon-blink-delay 0.2)
(setq beacon-blink-when-point-moves-vertically 10)


(package-require 'imenu-anywhere)
(global-set-key (kbd "C-.") 'imenu-anywhere)

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(provide 'stian-nav)
