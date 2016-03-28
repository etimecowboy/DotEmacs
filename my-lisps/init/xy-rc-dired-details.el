;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:30 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired-details.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired-details+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun dired-details-postload ()
  "Settings of `dired-details.el' after it's been loaded."
  ;; (dired-details-install) ;; called in `dired-details+'
  (setq dired-details-hide-link-targets nil
        dired-details-initially-hide t
        dired-details-hidden-string "")
  ;; (require 'dired-details+)
  ;; (setq dired-details-propagate-flag t) ;option added by
  ;;                                       ;`dired-details+'
  (message "* ---[ dired-details post-load configuration is complete ]---"))

(provide 'xy-rc-dired-details)
