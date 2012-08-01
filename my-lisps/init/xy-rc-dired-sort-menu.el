;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:05 by xin on p5q>
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
(defun dired-sort-menu-settings ()
  "Settings of `dired-sort-menu.el'."
  (setq dired-sort-dialogue-own-frame t
        dired-sort-menu-saved-config nil)
  (message "* ---[ dired-sort-menu configuration is complete ]---"))

(provide 'xy-rc-dired-sort-menu)
