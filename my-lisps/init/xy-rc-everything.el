;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:33 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-everything.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `everything.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun everything-postload ()
  "Settings of `everything.el' after it's been loaded."

  (Windows
    (setq everything-matchpath t);; 这个我感觉加上了好一些
    (setq everything-ffap-integration t
          everything-host "127.0.0.1"
          everything-pass nil
          everything-port 21
          everything-query-limit 100
          everything-user "anonymous"))

  (message "* ---[ everything post-load configuration is complete ]---"))

(provide 'xy-rc-everything)
