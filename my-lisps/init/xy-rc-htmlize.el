;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:21 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-htmlize.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `htmlize.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun htmlize-postload ()
  "Settings of `htmlize.el' after it's been loaded."
  ; make htmlize generate unicode directly instead of html entities
  (setq htmlize-convert-nonascii-to-entities nil)
  (setq htmlize-html-charset "utf-8") ; make the output html use utf-8 charset
  (message "* ---[ htmlize post-load configuration is complete ]---"))

(provide 'xy-rc-htmlize)
