;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:11 by xin on p5q>
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
(defun c-includes-postload ()
  "Settings of `c-includes.el' after it's been loaded."
    (setq c-includes-binding t)
    (setq c-includes-path user-include-dirs)
    (message "* ---[ c-includes post-load configuration is complete ]---"))

(provide 'xy-rc-c-includes)
