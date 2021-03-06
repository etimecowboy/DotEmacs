;;; xy-edit-5.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2015-05-23 Sat 17:18 by xin on zbox.soton.ac.uk>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))

;;* ErgoEmacs's functions

;; ;;;###autoload
;; (defun text-scale-normal-size ()
;;   "Set the height of the default face in the current buffer to its default value."
;;   (interactive)
;;   (text-scale-increase 0))



;; ;;;###autoload
;; (defun toggle-line-move-visual ()
;;   "Toggle behavior of up/down arrow key, by visual line vs logical line."
;;   (interactive)
;;   (if line-move-visual
;;       (setq line-move-visual nil)
;;     (setq line-move-visual t))
;;   )



;;;###autoload
(defun cmd-shell (&optional arg)
  "Run cmd.exe (WinNT) or command.com shell. A numeric prefix
arg switches to the specified session, creating it if necessary."
  (interactive "P")
  (let ((buf-name (cond ((numberp arg)
                         (format "*cmd<%s>*" arg))
                        (arg
                         (generate-new-buffer-name "*cmd*"))
                        (t
                         "*cmd*")))
        (explicit-shell-file-name (or (and (w32-using-nt) "cmd.exe")
                                      "command.com")))
    (shell buf-name)))



;;;###autoload
(defun msys-shell (&optional arg)
  "Run MSYS shell (sh.exe).  It's like a Unix Shell in Windows.
A numeric prefix arg switches to the specified session, creating
it if necessary."
  (interactive "P")
  (let ((buf-name (cond ((numberp arg)
                         (format "*msys<%d>*" arg))
                        (arg
                         (generate-new-buffer-name "*msys*"))
                        (t
                         "*msys*")))
        (explicit-shell-file-name "sh.exe"))
    (shell buf-name)))



;; ;;;###autoload
;; (defun soft-wrap-lines ()
;;   "Make lines wrap at window edge and on word boundary,
;; in current buffer."
;;   (interactive)
;;   (setq truncate-lines nil)
;;   (setq word-wrap t))



;; NOTE: use my own function `xy/done'
;; ;;;###autoload
;; (defun close-frame ()
;;   "Closes the current frame or kill emacs if there are just one
;; frame. It simulates the same functionality of the Close button in
;; the frame title bar."
;;   (interactive)
;;   (if multiple-frames
;;       (delete-frame)
;;     (save-buffers-kill-terminal)))



(provide 'xy-edit-5)
