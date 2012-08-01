;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:11 by xin on p5q>
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
(defun info-settings ()
  "settings for `info'."
  ;; (apply-args-list-to-fun
   ;; 'def-command-max-window `("info"))
  ;; With `info+.el', you can merge an Info node with its subnodes into
  ;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
  ;; (require 'info+)
  (message "* ---[ info configuration is complete ]---"))

(provide 'xy-rc-info)
