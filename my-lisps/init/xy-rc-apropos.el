;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:23 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun apropos-face-settings ()
  "Face settings for `apropos'."
  (setq apropos-match-face 'red-face)
  (setq apropos-symbol-face 'magenta-face)
  (setq apropos-keybinding-face 'cyan-face)
  (setq apropos-label-face 'underline-green-face)
  (setq apropos-property-face 'font-yellow-face)
  (message "* ---[ apropos configuration is complete ]---"))

(provide 'xy-rc-apropos)
