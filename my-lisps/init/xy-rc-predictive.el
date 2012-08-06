;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:35 by xin on p5q>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun predictive-postload ()
  "Settings of `predictive.el' after it's been loaded."

  (setq predictive-auto-learn t
        predictive-auxiliary-file-location "~/emacs/predictive/")

  (message "* ---[ predictive post-load configuration is complete ]---"))

(provide 'xy-rc-predictive)
