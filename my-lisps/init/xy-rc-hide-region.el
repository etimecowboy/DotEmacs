;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:20 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hide-region.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hide-region.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun hide-region-postload ()
  "Settings for `hide-region' after it's been loaded."
  (setq hide-region-before-string "[==========Region has been")
  (setq hide-region-after-string  "hidden by Emacs==========]\n")
  (message "* ---[ hide-region post-load configuration is complete ]---"))

(provide 'xy-rc-hide-region)
