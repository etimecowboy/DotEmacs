;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:20 by xin on p5q>
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
(defun thumbs-settings ()
  "Settings of `thumbs.el'."
  (setq-default thumbs-thumbsdir
                (concat my-var-path "/thumbs"))
  ;; (setq thumbs-conversion-program "convert") ;; use imagemagick
  (setq thumbs-geometry "196x196")
  (setq thumbs-per-line 5)
  (setq thumbs-margin 3)
  (setq thumbs-thumbsdir-max-size 10000000) ;; 10M limit
  (setq thumbs-relief 0)
  (setq thumbs-thumbsdir-auto-clean t)
  (setq thumbs-temp-dir (concat my-var-path "/thumbs"))
  (message "* ---[ thumbs configuration is complete ]---"))

(provide 'xy-rc-thumbs)
