;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:29 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-maxframe.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `maxframe.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun maxframe-postload ()
  "Settings of `maxframe.el' after it's been loaded."
  (UKDesktop
   (setq mf-max-width 1280))  ;; Pixel width of main monitor
  (message "* ---[ maxframe post-load configuration is complete ]---"))

(provide 'xy-rc-maxframe)
