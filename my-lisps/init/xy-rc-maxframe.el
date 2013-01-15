;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-14 Mon 23:34 by xin on S13>
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
  ;; (Laptop
  ;;  (setq mf-max-width 1366
  ;;        mf-max-height 768))

  (message "* ---[ maxframe post-load configuration is complete ]---"))

(provide 'xy-rc-maxframe)
