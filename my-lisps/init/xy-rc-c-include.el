;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:03 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-c-includes.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My `c-includes.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun c-includes-settings ()
  "Settings of `c-includes.el'."
    (setq c-includes-binding t)
    (setq c-includes-path user-include-dirs)
    (message "* ---[ c-includes configuration is complete ]---"))

(provide 'xy-rc-c-includes)
