;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:27 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-doremi.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `doremi.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun doremi-settings ()
  "Settings of `doremi'."
  (setq doremi-up-keys   '(?\M-p ?p ?k))
  (setq doremi-down-keys '(?\M-n ?n ?j ?\ ))
  (setq doremi-RGB-increment-factor 256)
  (message "* ---[ doremi configuration is complete ]---")
)

(provide 'xy-rc-doremi)
