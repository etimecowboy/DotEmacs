;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:47 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pcache.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pcache.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun pcache-preload ()
  "Settings of `pcache' before it's been loaded."
  (setq-default pcache-directory
                ;; (let ((dir (concat my-var-path "/pcache")))
                ;;   (make-directory dir t)
                ;;   dir))
                (concat my-var-path "/pcache"))
  (message "* ---[ pcache post-load configuration is complete ]---"))

;;;###autoload
(defun pcache-postload ()
  "Settings of `pcache.el' after it's been loaded."
  (message "* ---[ pcache post-load configuration is complete ]---"))

(provide 'xy-rc-pcache)
