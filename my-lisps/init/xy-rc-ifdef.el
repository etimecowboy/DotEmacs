;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:22 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ifdef.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My `ifdef.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun ifdef-postload ()
  "Settings of `ifdef.el' after it's been loaded."
  (eal-define-keys
   'c-mode-base-map
   `(("C-c I" mark-ifdef)))
  (message "* ---[ ifdef post-load configuration is complete ]---"))

(provide 'xy-rc-ifdef)
