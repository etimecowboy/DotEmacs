;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:12 by xin on p5q>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun linkd-settings ()
  "settings for `linkd'."
  (setq linkd-use-icons t)
  (setq linkd-icons-directory
    (concat my-local-image-path "/linkd"))
  (message "* ---[ linkd configuration is complete ]---"))

;; ;;;###autoload
;; (defun linkd-face-settings ()
;;   "face settings for `linkd'."
;;   (set-face-foreground 'linkd-generic-link "yellow"))

(provide 'xy-rc-linkd)
