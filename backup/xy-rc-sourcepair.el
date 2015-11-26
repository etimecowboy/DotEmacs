;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sourcepair.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sourcepair.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun sourcepair-postload ()
  "Settings for `sourcepair' after it's been loaded."
  (setq sourcepair-source-path '( "." "../src" "../../src"))
  (setq sourcepair-header-path user-include-dirs)
  (setq sourcepair-recurse-ignore
        '("CVS" "bin" "lib" "Obj" "Debug" "Release" ".svn" ".git"))
  (message "* ---[ sourcepair post-load configuration is complete ]---"))

(provide 'xy-rc-sourcepair)
