;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-02-22 Wed 07:46 by xin on zboxum>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-simple.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `simple.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun simple-postload ()
  "Settings of `simple.el' after it's been loaded."
  (setq-default fill-column 70)
  (message "* ---[ simple post-load configuration is complete ]---"))

(provide 'xy-rc-simple)
