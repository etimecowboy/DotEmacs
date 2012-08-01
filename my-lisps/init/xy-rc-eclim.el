;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:06 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eclim.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eclim.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;;###autoload
(defun eclim-settings ()
  "Settings for `eclim'."
  (setq eclim-auto-save t)
  (message "* ---[ eclim configuration is complete ]---"))

(provide 'xy-rc-eclim)
