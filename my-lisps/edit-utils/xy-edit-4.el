;;; xy-edit-4.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2013-01-14 Mon 01:15 by xin on S13>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))



;;* From Meteor Liu (刘欣)
;; REF: (@url :file-name "https://github.com/meteor1113/dotemacs/blob/master/init-basic.el" :display "Source")

;; ;;;###autoload
;; (defadvice find-tag (before tags-file-name-advice activate)
;;   "Find TAGS file in ./ or ../ or ../../ dirs"
;;   (let ((list (mapcar 'expand-file-name
;;                       '("./TAGS" "../TAGS" "../../TAGS"))))
;;     (while list
;;       (if (file-exists-p (car list))
;;           (progn
;;             (setq tags-file-name (car list))
;;             (setq list nil))
;;         (setq list (cdr list))))))



;; ;;;###autoload
;; (defun find-dotemacs-file ()
;;   "Open .emacs file"
;;   (interactive)
;;   (let* ((paths '("~/.emacs" "~/.emacs.el"
;;                   "~/.emacs.d/init.el"
;;                   "~/_emacs"))
;;          (dotemacs-path))
;;     (dolist (path paths)
;;       (and (not dotemacs-path)
;;            (file-exists-p path)
;;            (setq dotemacs-path path)))
;;     (find-file (or dotemacs-path
;;                    (locate-file "site-start.el" load-path)
;;                    "~/.emacs"))))



;;;###autoload
(defun move-line-up (p)
  "Move current line up, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (previous-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))



;;;###autoload
(defun move-line-down (p)
  "Move current line down, copy from crazycool@smth"
  (interactive "*p")
  (let ((c (current-column)))
    (beginning-of-line)
    (kill-line 1)
    (next-line p)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))



;;;###autoload
(defun format-region ()
  "Format region, if no region actived, format current buffer.
Like eclipse's Ctrl+Alt+F."
  (interactive)
  (let ((start (point-min))
        (end (point-max)))
    (if (and (fboundp 'region-active-p) (region-active-p))
        (progn (setq start (region-beginning))
               (setq end (region-end)))
      (progn (when (fboundp 'whitespace-cleanup)
               (whitespace-cleanup))
             (setq end (point-max))))
    (save-excursion
      (save-restriction
        (narrow-to-region (point-min) end)
        (push-mark (point))
        (push-mark (point-max) nil t)
        (goto-char start)
        (when (fboundp 'whitespace-cleanup)
          (whitespace-cleanup))
        (untabify start (point-max))
        (indent-region start (point-max) nil)))))



;;;###autoload
(defun cxx-file-p (file)
  (let ((file-extension (file-name-extension file)))
    (and file-extension
         (string= file (file-name-sans-versions file))
         (find file-extension
               '("h" "hpp" "hxx" "c" "cpp" "cxx")
               :test 'string=))))



;;;###autoload
(defun format-cxx-file (file)
  "Format a c/c++ file."
  (interactive "F")
  (if (cxx-file-p file)
      (let ((buffer (find-file-noselect file))) ;; open buffer
        (save-excursion
          (set-buffer buffer)
          ;; (mark-whole-buffer)
          (when (fboundp 'whitespace-cleanup)
            (whitespace-cleanup))
          (untabify (point-min) (point-max))
          (indent-region (point-min) (point-max))
          (save-buffer)
          (kill-buffer)
          (message "Formated c++ file:%s" file)))
    (progn
      (format-region)
      (message "%s isn't a c++ file" file))))



;; NOTE: dangerous!
;; ;;;###autoload
;; (defun format-cxx-directory (dirname)
;;   "Format all c/c++ file in a directory."
;;   (interactive "D")
;;   ;; (message "directory:%s" dirname)
;;   (let ((files (directory-files dirname t)))
;;     (dolist (x files)
;;       (if (not (string= "." (substring (file-name-nondirectory x) 0 1)))
;;           (if (file-directory-p x)
;;               (format-cxx-directory x)
;;             (if (and (file-regular-p x)
;;                      (not (file-symlink-p x))
;;                      (cxx-file-p x))
;;                 (format-cxx-file x)))))))


;; ;;;###autoload
;; (defun grep-current-dir (&optional prompt wd)
;;   "Run `grep' to find current word in current directory."
;;   (interactive "P")
;;   (let* ((word (or wd
;;                    (and (fboundp 'region-active-p)
;;                         (region-active-p)
;;                         (buffer-substring-no-properties (region-beginning)
;;                                                         (region-end)))
;;                    (grep-tag-default)))
;;          (cmd (format grep-dir-format word)))
;;     (grep-apply-setting 'grep-use-null-device nil)
;;     (if (or prompt (= (length word) 0))
;;         (grep (read-shell-command
;;                "Run grep (like this): " cmd 'grep-history))
;;       (if (= 0 (length word))
;;           (message "Word is blank.")
;;         (grep cmd)))))



;; NOTE: use `color-moccur.el', `anything.el', or `helm.el' is better
;; ;;;###autoload
;; (defun grep-todo-current-dir ()
;;   "Run `grep' to find 'TODO' in current directory."
;;   (interactive)
;;   (grep-current-dir nil "TODO|BUG|FIXME"))



;; ;;;###autoload
;; (defun moccur-word-all-buffers (regexp)
;;   "Run `multi-occur' to find regexp in all buffers."
;;   (if (= 0 (length regexp))
;;       (message "Regexp is blank.")
;;     (let ((buffers (buffer-list)))
;;       (dolist (buffer buffers)
;;         (let ((pos (string-match " *\\*" (buffer-name buffer))))
;;           (when (and pos (= 0 pos))
;;             (setq buffers (remq buffer buffers)))))
;;       (multi-occur buffers regexp))))



;; ;;;###autoload
;; (defun moccur-all-buffers (&optional prompt)
;;   "Run `multi-occur' to find current word in all buffers."
;;   (interactive "P")
;;   (let ((word (grep-tag-default)))
;;     (when (or prompt (= (length word) 0))
;;       (setq word (read-regexp "List lines matching regexp" word)))
;;     (moccur-word-all-buffers word)))



;; NOTE: use `color-moccur.el', `anything.el', or `helm.el' is better
;; ;;;###autoload
;; (defun moccur-todo-all-buffers ()
;;   "Run `multi-occur' to find 'TODO' in all buffers."
;;   (interactive)
;;   (moccur-word-all-buffers
;;    "\\<\\([Tt][Oo][Dd][Oo]\\|[Bb][Uu][Gg]\\|[Ff][Ii][Xx][Mm][Ee]\\)\\>"))



;; ;;;###autoload
;; (defun switch-to-other-buffer ()
;;   "Switch to (other-buffer)."
;;   (interactive)
;;   (switch-to-buffer (other-buffer)))
;; (defadvice switch-to-other-buffer (after pulse-advice activate)
;;   "After switch-to-other-buffer, pulse the line the cursor lands on."
;;   (when (and (boundp 'pulse-command-advice-flag)
;;              pulse-command-advice-flag
;;              (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))



;; ;;;###autoload
;; (defun mark-current-line ()
;;   "Put point at beginning of this line, mark at end."
;;   (interactive)x
;;   (move-beginning-of-line 1)
;;   (set-mark (point))
;;   (move-end-of-line 1))



;; ;;;###autoload
;; (defun mark-current-line-mouse (ev)
;;   "Mark current line with a mouse click. EV is the mouse event."
;;   (interactive "e")
;;   (mouse-set-point ev)
;;   (mark-current-line))



;; ;;;###autoload
;; (defun goto-match-paren (arg)
;; "Go to the matching parenthesis if on parenthesis, otherwise insert %.
;; vi style of % jumping to matching brace."
;; (interactive "p")
;; (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;; ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;; (t (self-insert-command (or arg 1)))))



;;;###autoload
;; (defun goto-match-paren (arg)
(defun goto-paren (arg)
  "Go to the matching if on (){}[]<>, similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by
  ;; forward-sexp, etc.
  (cond ((looking-at "[\[\(\{\<]") (forward-sexp))
        ((looking-back "[\]\)\}\>]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}\>]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{\<]" 1) (backward-char) (forward-sexp))
        (t nil)))



(provide 'xy-edit-4)
