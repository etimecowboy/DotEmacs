;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-03 Sun 12:47 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-firefox.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-firefox.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun helm-firefox-postload ()
  "Settings of `helm-firefox.el' after it's been loaded."

  (GNULinux
   (setq helm-firefox-default-directory "~/.mozilla/firefox/"))
  (setq helm-firefox-show-structure t)
  
  (message "* ---[ helm-firefox post-load configuration is complete ]---"))

(provide 'xy-rc-helm-firefox)
