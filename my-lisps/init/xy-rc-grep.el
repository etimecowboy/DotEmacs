;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:29 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-grep.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `grep.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

(autoload 'grep-apply-setting "grep"
  "Set SYMBOL to VALUE, and update `grep-host-defaults-alist'.
SYMBOL should be one of `grep-command', `grep-template',
`grep-use-null-device', `grep-find-command',
`grep-find-template', `grep-find-use-xargs', or
`grep-highlight-matches'.")

;;;###autoload
(defun find-grep-in-dir (dir)
  "Run `find-grep' in directory DIR."
  (interactive (list (read-directory-name "Directory to find in: " default-directory "" t)))
  (let ((prompt (concat "find " dir " -type f ! -path \"*/.svn*\" ! -path \"*/.git\" ! -path \"*~\" -print0 | xargs -0 -e grep -nH -e ")))
    (set-grep-command prompt)
    (call-interactively 'find-grep)))

;;;###autoload
(defun find-grep-in-current-dir (dir)
  "Run `find-grep' in current directory."
  (find-grep-in-dir default-directory))

;;;###autoload
(defun find-grep-current-word (dir &optional is-prompt)
  "Run `grep' to find current word in directory DIR."
  (interactive
   (list
    (read-directory-name "Directory to grep in: " default-directory "" t)
    current-prefix-arg))
  (set-grep-command   (concat "find " dir " -type f ! -path \"*/.svn*\" ! -path \"*~\" -print0 | xargs -0 -e grep -nH -e "))
  (let* ((word (current-word)) command-args)
    (if (not word)
        (message "No word under cursor.")
      (setq command-args
            (if grep-find-command
                (concat grep-find-command word)
              (concat grep-command word " " dir "/*")))
      (if is-prompt
          (grep (read-shell-command "Run grep (like this): " command-args 'grep-history))
        (grep command-args)))))

;;;###autoload
(defun find-grep-current-word-in-current-dir (&optional is-prompt)
  "Run `grep' to find current word in directory DIR."
  (interactive "P")
  (find-grep-current-word default-directory is-prompt))

(defvar grep-find-prompt
  "find . -type f ! -path \"*/.svn*\" ! -path \"*~\" -print0 | xargs -0 -e grep -nH -e "
  "*Default prompt of `grep-find'.")

;;;###autoload
(defun set-grep-command (command)
  "Set `grep-command'."
  (if is-after-emacs-23
      (grep-apply-setting 'grep-find-command command)
    (setq grep-find-command command)))

;;;###autoload
(defun set-default-grep-command ()
  (set-grep-command grep-find-prompt))

;;;###autoload
(defun grep-settings ()
  "settings for `grep'."
  (set-default-grep-command)
  (defvar grep-ignore-case nil "When run `grep' ignore case or not.")
  (when grep-ignore-case
    (if is-after-emacs-23
        (grep-apply-setting 'grep-command "grep -inH -e ")
      (setq grep-command "grep -inH -e ")))
  (message "* ---[ grep configuration is complete ]---"))

(provide 'xy-rc-grep)
