;;; xy-edit-2.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2012-08-02 Thu 02:25 by xin on p5q>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))

;;====================================================================
;;* Rick Bielawski's function collection
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/Rick_Bielawski" :display "Source")

;;;###autoload
(defun rgb-window-horizontal-to-vertical ()
  "Switches from a horizontal split to a vertical split."
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
        (buf-point (point)))
    (other-window 1)
    (delete-other-windows)
    (split-window-horizontally)
    (switch-to-buffer one-buf)
    (goto-char buf-point)))

;;--------------------------------------------------------------------
;;;###autoload
(defun rgb-window-vertical-to-horizontal ()
  "Switches from a vertical split to a horizontal split."
  (interactive)
  (let ((one-buf (window-buffer (selected-window)))
        (buf-point (point)))
    (other-window 1)
    (delete-other-windows)
    (split-window-vertically)
    (switch-to-buffer one-buf)
    (goto-char buf-point)))

;;--------------------------------------------------------------------
;;;###autoload
(defun insert-prior-line-char ()
  "Insert the same character as in the prior line. Space if none."
  (interactive)
  (let* ((cur (current-column))
         (char (save-excursion
                 (if (or (not (eq 0 (forward-line -1)))
                         (not (eq cur (move-to-column cur)) ))
                     32
                   (char-after)))))
    (insert char)))

;;--------------------------------------------------------------------
;;;###autoload
(defun insert-sequence-symbol (key)
  "Insert the name of the function that key chord executes."
  (interactive "kInseret key description: ")
  (insert (symbol-name (key-binding key))))

;;--------------------------------------------------------------------
;;;###autoload
(defun insert-sequence-key (key)
  "Inserts a keystroke suitable for use in fcns like global-set-key"
  (interactive "kInseret key chord: ")
  (insert (format "(kbd \"%s\")" (key-description key))))

;;--------------------------------------------------------------------
;;;###autoload
(defun search-word-at-mouseclick (event)
  "Performs a nonincremental-search-forward starting from the
   beginning of the buffer or narrowed region. The word clicked on is
   the word to search for. If the click is in another window the
   search still occurs in the current window."
  (interactive "e")
  (let (searchword)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-end event))))
      (save-excursion
        (goto-char (posn-point (event-end event)))
        (setq searchword (current-word))))
    (if searchword
        (let ((cpt (point)))
          (goto-char (point-min))
          (setq menu-bar-last-search-type 'string)
          (isearch-update-ring searchword nil)
          (if (string= searchword
                       (car (symbol-value
                             minibuffer-history-variable))) ()
            (set minibuffer-history-variable
                 (cons searchword
                       (symbol-value minibuffer-history-variable))))
          (unless (search-forward searchword nil t)
            (goto-char cpt)
            (error "Search Failed: \"%s\"" searchword)))
      (ding))))

(provide 'xy-edit-2)
