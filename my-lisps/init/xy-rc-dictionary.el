;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:29 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dictionary.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dictionary.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun dictionary-postload ()
  "Settings of `dictionary.el' after it's been loaded."

  ;; (setq dictionary-tooltip-dictionary "eng-chs")
  ;; choose on of the following lines
  ;; (global-dictionary-tooltip-mode 1)
  ;; (dictionary-tooltip-mode 1)

  (message "* ---[ dictionary post-load configuration is complete ]---"))

(provide 'xy-rc-dictionary)
