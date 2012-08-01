;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:27 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-doc-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `doc-view' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun doc-view-settings ()
  "settings for `doc-view'."
  (setq doc-view-conversion-refresh-interval 3)
  (setq doc-view-continuous t)
  (message "* ---[ doc-view configuration is complete ]---")
)

(provide 'xy-rc-doc-view)
