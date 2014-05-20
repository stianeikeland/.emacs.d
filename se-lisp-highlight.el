;;; se-lisp-highlight -- highlight top level comments in lisps
;;;
;; stolen from: https://github.com/aroemers/.emacs.d/blob/master/init.el

(require 'cl)

(defun overlays-with-property-in (begin end property &optional value)
  "Return the overlays that overlap with the region begin to end, having a the
  specified property. A fourth, optional, argument is the expected value of that
  property. Note that an overlay from 1 to 3 is only found when the range
  begin-end covers 2 (the behaviour of the standard overlays-in function)."
  (let ((overlays (overlays-in begin end)))
    (cl-remove-if-not (lambda (overlay)
                        (let ((propvalue (overlay-get overlay property)))
                          (and propvalue
                               (or (not value) (equal value propvalue)))))
                      overlays)))

(defface hl-comment-block-face
  '((((background light)) (:background "burlywood2" :foreground "burlywood4"))
    (((background dark)) (:background "#222628" :foreground "#cccc77")))
  "Face for comment overlay blocks.")

(defun hl-comment-block (end)
  "Searches for the first occurrence of a toplevel ;;; comment, starting from
  point. If no occurrence is found, nil is returned. Otherwise, a highlighting
  overlay is added to the comment line if it does not have one already. A non-nil
  value is returned in this case."
  (when (re-search-forward "^;;;" end t)
    (if (not (overlays-with-property-in (point) (point) 'for-comments))
        (let ((start (- (point) 3)))
          (end-of-line)
          (let* ((end (+ 1 (point)))
                 (overlay (make-overlay start end)))
            (overlay-put overlay 'face 'hl-comment-block-face)
            (overlay-put overlay 'evaporate t)
            (overlay-put overlay 'priority 999)
            (overlay-put overlay 'for-comments t))
          (goto-char (+ start 3)))
      t)))

(defun hl-comment-block-before-change (begin end)
  "Removes comment highlighting overlays in the region that is about to change."
  (mapc 'delete-overlay (overlays-with-property-in begin end 'for-comments)))

(defun hl-comment-block-after-change (begin end length)
  "Executes hl-comment-block, starting from the beginning of the line of
  the beginning of the changed region."
  (save-excursion
    (goto-char begin)
    (beginning-of-line)
    (while (hl-comment-block (+ end 3)))))

(defun hl-comment-block-enable ()
  "Enable highlighting top-level comment blocks."
  (add-hook 'before-change-functions 'hl-comment-block-before-change nil t)
  (add-hook 'after-change-functions 'hl-comment-block-after-change nil t)
  (save-excursion
    (goto-char (point-min))
    (while (hl-comment-block (point-max)))))

(provide 'se-lisp-highlight)
