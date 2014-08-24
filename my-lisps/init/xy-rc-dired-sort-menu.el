;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:47 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-sort-menu.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-sort-menu.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun dired-sort-menu-postload ()
  "Settings of `dired-sort-menu.el' after it's been loaded."
  (setq dired-sort-dialogue-own-frame t
        dired-sort-menu-saved-config nil)
  (message "* ---[ dired-sort-menu post-load configuration is complete ]---"))

(provide 'xy-rc-dired-sort-menu)
