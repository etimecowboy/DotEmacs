;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-predictive.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `predictive.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun predictive-settings ()
  "Settings of `predictive.el'."

  (setq predictive-auto-learn t
        predictive-auxiliary-file-location "~/emacs/predictive/")

  (message "* ---[ predictive configuration is complete ]---"))

(provide 'xy-rc-predictive)
