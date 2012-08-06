;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:03 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-apropos.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `apropos.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun apropos-postload ()
  "Settings for `apropos' after it's been loaded."
  (setq apropos-match-face 'red-face)
  (setq apropos-symbol-face 'magenta-face)
  (setq apropos-keybinding-face 'cyan-face)
  (setq apropos-label-face 'underline-green-face)
  (setq apropos-property-face 'font-yellow-face)
  (message "* ---[ apropos post-load configuration is complete ]---"))

(provide 'xy-rc-apropos)
