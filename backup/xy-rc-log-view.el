;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:43 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-log-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `log-view.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun log-view-face-settings ()
;;   "Face settings for `log-view'."
;;   (if is-before-emacs-21
;;       (progn
;;         (set-face-foreground 'log-view-file-face "green")
;;         (set-face-foreground 'log-view-message-face "yellow"))
;;     (setq log-view-file-face 'darkgreen-face)
;;     (setq log-view-message-face 'darkyellow-face))
;; )

(provide 'xy-rc-log-view)
