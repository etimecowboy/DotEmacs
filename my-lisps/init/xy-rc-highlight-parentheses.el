;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:41 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-highlight-parentheses.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `highlight-parentheses.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun highlight-parentheses-postload ()
  "Settings for `highlight-parentheses' after it's been loaded."
  ;;Test: (((((((((((((())))))))))))))
  (setq hl-paren-colors '("red" "magenta" "orange" "yellow" "green"
                          "cyan" "blue"))
  (message "* ---[ highlight-parentheses post-load configuration is complete ]---"))

(provide 'xy-rc-highlight-parentheses)
