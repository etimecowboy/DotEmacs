;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:53 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sr-speedbar.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sr-speedbar.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun sr-speedbar-postload ()
  "Settings of `sr-speedbar.el' after it's been loaded."

  (setq sr-speedbar-auto-refresh t
        sr-speedbar-delete-windows nil
        sr-speedbar-max-width 50
        sr-speedbar-right-side t
        sr-speedbar-skip-other-window-p nil 
        sr-speedbar-width-console 40
        sr-speedbar-width-x 40)

  (message "* ---[ sr-speedbar post-load configuration is complete ]---"))

(provide 'xy-rc-sr-speedbar)
