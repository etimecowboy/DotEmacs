;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-23 Sun 02:05 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-outshine.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `outshine.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun outshine-postload ()
  "Settings of `outshine.el' after it's been loaded."

  (add-hook 'outline-minor-mode-hook 'outshine-hook-function)

  (message "* ---[ outshine post-load configuration is complete ]---"))

(provide 'xy-rc-outshine)
