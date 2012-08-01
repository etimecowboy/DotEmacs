;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:23 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-windmove.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `windmove.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun windmove-settings ()
  "Settings of `windmove.el'."
  (setq windmove-wrap-around t)
  (message "* ---[ windmove configuration is complete ]---"))

(provide 'xy-rc-windmove)
