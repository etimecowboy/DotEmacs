;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:15 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-doc-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `doc-view' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun doc-view-postload ()
  "Settings for `doc-view' after it's been loaded."
  (setq doc-view-conversion-refresh-interval 3)
  (setq doc-view-continuous t)
  (message "* ---[ doc-view post-load configuration is complete ]---"))

(provide 'xy-rc-doc-view)
