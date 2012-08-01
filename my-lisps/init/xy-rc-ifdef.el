;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:30 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ifdef.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My `ifdef.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ifdef-settings ()
  "Settings of `ifdef.el'."
  (eal-define-keys
   'c-mode-base-map
   `(("C-c I" mark-ifdef)))
  (message "* ---[ ifdef configuration is complete ]---")
)

(provide 'xy-rc-ifdef)
