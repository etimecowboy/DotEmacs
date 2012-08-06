;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-06 Mon 11:00 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-winring.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `winring.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun winring-postload ()
  "Settings of `winring.el' after it's been loaded."

  (setq winring-prompt-on-create t
        winring-ring-size 10
        winring-show-names t)

  (message "* ---[ winring post-load configuration is complete ]---"))

(provide 'xy-rc-winring)
