;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-10 Sun 21:41 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emamux.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emamux.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun emamux-postload ()
  "Settings of `emamux.el' after it's been loaded."

  (setq emamux:completing-read-type (quote helm)
    emamux:default-orientation (quote vertical)
    emamux:runner-pane-height 15
    emamux:use-nearest-pane nil)  
  (message "* ---[ emamux post-load configuration is complete ]---"))

(provide 'xy-rc-emamux)
