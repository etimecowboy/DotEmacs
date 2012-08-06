;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:15 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-doremi.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `doremi.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun doremi-postload ()
  "Settings of `doremi' after it's been loaded."
  (setq doremi-up-keys   '(?\M-p ?p ?k))
  (setq doremi-down-keys '(?\M-n ?n ?j ?\ ))
  (setq doremi-RGB-increment-factor 256)
  (message "* ---[ doremi post-load configuration is complete ]---"))

(provide 'xy-rc-doremi)
