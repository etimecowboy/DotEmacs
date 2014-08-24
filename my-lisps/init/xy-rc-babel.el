;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:47 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-babel.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `babel.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun babel-postload ()
  "Settings of `babel.el' after it's been loaded."
  (setq babel-preferred-from-language "English") ;首选的翻译语言
  (setq babel-preferred-to-language "Chinese") ;首选的目标语言
  (message "* ---[ babel post-load configuration is complete ]---"))

(provide 'xy-babel)
