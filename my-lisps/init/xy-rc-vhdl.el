;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:22 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-vhdl.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `vhdl.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;;###autoload
(defun vhdl-mode-settings ()
  "settings for `vhdl-mode'."
  (setq vhdl-include-direction-comments t
        vhdl-include-group-comments 'decl
        vhdl-include-port-comments t
        vhdl-include-type-comments t
        vhdl-standard '((93 nil))
        vhdl-underscore-is-part-of-word t
        vhdl-upper-case-attributes t
        vhdl-upper-case-constants nil
        vhdl-upper-case-enum-values t
        vhdl-upper-case-keywords t
        vhdl-upper-case-types t)
  (autopair-mode -1)
  (message "* ---[ vhdl-mode configuration is complete ]---"))

(provide 'xy-rc-vhdl)
