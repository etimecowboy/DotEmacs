;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:09 by xin on p5q>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun highlight-parentheses-settings ()
  "Settings for `highlight-parentheses'."
  ;;Test: (((((((((((((())))))))))))))
  (setq hl-paren-colors '("red" "magenta" "orange" "yellow" "green"
                          "cyan" "blue"))
  (message "* ---[ highlight-parentheses configuration is complete ]---"))

(provide 'xy-rc-highlight-parentheses)
