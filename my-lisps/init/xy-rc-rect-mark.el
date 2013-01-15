;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-14 Mon 16:10 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-rect-mark.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `rect-mark.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;;###autoload
(defun rect-mark-postload ()
  "Settings of `rect-mark.el' after it's been loaded."

  (am-def-active-fun rm-mark-active rm-mark-active)

  (message "* ---[ rect-mark post-load configuration is complete ]---"))

(provide 'xy-rc-rect-mark)
