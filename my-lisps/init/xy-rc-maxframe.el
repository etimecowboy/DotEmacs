;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:13 by xin on p5q>
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
(defun maxframe-settings ()
  "Settings of `maxframe.el'."
  (UKDesktop
   (setq mf-max-width 1280))  ;; Pixel width of main monitor
  (message "* ---[ maxframe configuration is complete ]---"))

(provide 'xy-rc-maxframe)
