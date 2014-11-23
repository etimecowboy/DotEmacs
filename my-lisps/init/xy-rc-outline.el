;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-23 Sun 02:06 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-outline.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `outline.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun outline-postload ()
  "Settings of `outline.el' after it's been loaded."

  (try-require 'outshine)
  
  (message "* ---[ outline post-load configuration is complete ]---"))

(provide 'xy-rc-outline)
