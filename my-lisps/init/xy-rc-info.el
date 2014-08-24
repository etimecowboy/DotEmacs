;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-info.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `info' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun info-postload ()
  "Settings for `info' after it's been loaded."
  ;; (apply-args-list-to-fun
   ;; 'def-command-max-window `("info"))
  ;; With `info+.el', you can merge an Info node with its subnodes into
  ;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
  ;; (require 'info+)
  (message "* ---[ info post-load configuration is complete ]---"))

(provide 'xy-rc-info)
