;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-git.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `git.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/git-start ()
  "Start `git.el' -- git Emacs gui."
  (interactive)
  (require 'git)
  (require 'git-blame)
  (call-interactively 'git-status))

;;;###autoload
(defun git-postload ()
  "Settings of `git.el' after it's been loaded."
  (message "* ---[ git post-load configuration is complete ]---"))

(provide 'xy-rc-git)
