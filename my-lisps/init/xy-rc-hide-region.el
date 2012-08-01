;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:29 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hide-region.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hide-region.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun hide-region-settings ()
  "Settings for `hide-region'."
  (setq hide-region-before-string "[==========Region has been")
  (setq hide-region-after-string  "hidden by Emacs==========]\n")
  (message "* ---[ hide-region configuration is complete ]---")
)

(provide 'xy-rc-hide-region)
