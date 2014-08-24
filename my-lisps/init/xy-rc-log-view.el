;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

(eval-when-compile (require 'cl))
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
