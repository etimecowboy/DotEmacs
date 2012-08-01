;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:04 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-diff-git.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `diff-git.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun diff-git-settings ()
  "Settings of `diff-git.el'."

  (require 'diff-git)
  (require 'diff-mode)
  (require 'vc)
  (require 'vc-hooks)
  (require 'vc-dispatcher)
  (require 'magit)
  (diff-git-default-bindings)

  (message "* ---[ diff-git configuration is complete ]---"))

(provide 'xy-rc-diff-git)
