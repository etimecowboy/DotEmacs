;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-29 Tue 17:42 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-popwin.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `popwin.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun popwin-postload ()
  "Settings of `popwin.el' after it's been loaded."

  (setq display-buffer-function 'popwin:display-buffer)
  ;; NOTE:
  ;; `display-buffer-function' should be replaced by
  ;; `display-buffer-alist' after Emacs 24.3
  
  (message "* ---[ popwin post-load configuration is complete ]---"))

(provide 'xy-rc-popwin)
