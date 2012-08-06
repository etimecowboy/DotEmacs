;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 21:26 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-thumbs.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `thumbs.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun thumbs-preload ()
  "Settings of `thumbs.el' after it's been loaded."

  (setq-default thumbs-thumbsdir (concat my-var-path "/thumbs")
                thumbs-temp-dir (concat my-var-path "/thumbs"))

  (message "* ---[ thumbs pre-load configuration is complete ]---"))

;;;###autoload
(defun thumbs-postload ()
  "Settings of `thumbs.el' after it's been loaded."

  ;; (setq thumbs-conversion-program "convert") ;; use imagemagick
  (setq thumbs-geometry "196x196"
        thumbs-per-line 5
        thumbs-margin 3
        thumbs-thumbsdir-max-size 10000000 ;; 10M limit
        thumbs-relief 0
        thumbs-thumbsdir-auto-clean t)

  (message "* ---[ thumbs post-load configuration is complete ]---"))

(provide 'xy-rc-thumbs)
