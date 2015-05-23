;;; xy-edit-6.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2015-05-23 Sat 17:20 by xin on zbox.soton.ac.uk>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))

;;* From  (Steve Purcell)
;; REF: (@url :file-name "https://github.com/purcell/emacs.d" :display "Github Source")



;; From file: `init-utils.el'

;; Handier way to add modes to auto-mode-alist
;; ;;;###autoload
;; (defun add-auto-mode (mode &rest patterns)
;;   "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
;;   (dolist (pattern patterns)
;;     (add-to-list 'auto-mode-alist (cons pattern mode))))



;; String utilities missing from core emacs
;; ;;;###autoload
;; (defun string-all-matches (regex str &optional group)
;;   "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
;;   (let ((result nil)
;;         (pos 0)
;;         (group (or group 0)))
;;     (while (string-match regex str pos)
;;       (push (match-string group str) result)
;;       (setq pos (match-end group)))
;;     result))

;; ;;;###autoload
;; (defun string-rtrim (str)
;;   "Remove trailing whitespace from `STR'."
;;   (replace-regexp-in-string "[ \t\n]*$" "" str))



;; Find the directory containing a given library
;; (autoload 'find-library-name "find-func")
;; ;;;###autoload
;; (defun directory-of-library (library-name)
;;   "Return the directory in which the `LIBRARY-NAME' load file is found."
;;   (file-name-as-directory (file-name-directory (find-library-name library-name))))



;; Delete the current file
;;;###autoload
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))



;; Rename the current file
;; NOTE: `prelude' have a better version.
;;;###autoload
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))



;; Browse current HTML file
;;;###autoload
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (browse-url (concat "file://" (buffer-file-name))))

;;;###autoload
(defmacro with-selected-frame (frame &rest forms)
  (let ((prev-frame (gensym))
        (new-frame (gensym)))
    `(progn
       (let* ((,new-frame (or ,frame (selected-frame)))
              (,prev-frame (selected-frame)))
         (select-frame ,new-frame)
         (unwind-protect
             (progn ,@forms)
           (select-frame ,prev-frame))))))



;; From file: `init-fonts.el'

;; ;;;###autoload
;; (defun font-name-replace-size (font-name new-size)
;;   (let ((parts (split-string font-name "-")))
;;     (setcar (nthcdr 7 parts) (format "%d" new-size))
;;     (mapconcat 'identity parts "-")))


;; ;;;###autoload
;; (defun increment-default-font-height (delta)
;;   "Adjust the default font height by DELTA on every frame.
;; The pixel size of the frame is kept (approximately) the same.
;; DELTA should be a multiple of 10, in the units used by the
;; :height face attribute."
;;   (let* ((new-height (+ (face-attribute 'default :height) delta))
;;          (new-point-height (/ new-height 10)))
;;     (dolist (f (frame-list))
;;       (with-selected-frame f
;;         ;; Latest 'set-frame-font supports a "frames" arg, but
;;         ;; we cater to Emacs 23 by looping instead.
;;         (set-frame-font (font-name-replace-size (face-font 'default)
;;                                                 new-point-height)
;;                         t)))
;;     (set-face-attribute 'default nil :height new-height)
;;     (message "default font size is now %d" new-point-height)))

;; ;;;###autoload
;; (defun increase-default-font-height ()
;;   (interactive)
;;   (increment-default-font-height 10))


;; ;;;###autoload
;; (defun decrease-default-font-height ()
;;   (interactive)
;;   (increment-default-font-height -10))



(provide 'xy-edit-6)
