;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:43 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-linkd.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `linkd.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun linkd-postload ()
  "Settings for `linkd' after it's been loaded."
  (setq linkd-use-icons t)
  (setq linkd-icons-directory
    (concat my-local-image-path "/linkd"))
  (message "* ---[ linkd post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun linkd-face-settings ()
;;   "face settings for `linkd'."
;;   (set-face-foreground 'linkd-generic-link "yellow"))

(provide 'xy-rc-linkd)
