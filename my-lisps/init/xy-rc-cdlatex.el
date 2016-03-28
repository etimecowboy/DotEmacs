;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:28 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cdlatex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `cdlatex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun cdlatex-postload ()
  "Settings of `cdlatex.el' after it's been loaded."
  ;; (setq cdlatex-math-symbol-prefix "`"
        ;; cdlatex-math-modify-prefix "'")
  (message "* ---[ cdlatex post-load configuration is complete ]---"))

(provide 'xy-rc-cdlatex)
