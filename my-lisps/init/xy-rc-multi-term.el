;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:44 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-multi-term.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `multi-term.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun multi-term-postload ()
  "Settings for `term' after it's been loaded."

  ;; (when use-cua (cua-selection-mode 1))
  (setq multi-term-switch-after-close nil)
  (GNULinux
   (setq multi-term-program "bash"))
  (Windows
   (setq multi-term-program "bash.exe"))

  (message "* ---[ multi-term post-load configuration is complete ]---"))

(provide 'xy-rc-multi-term)
