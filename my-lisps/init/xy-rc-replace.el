;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:17 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-replace.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `replace' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun replace-face-settings ()
;;   "Face settings for `replace'."
;;   (custom-set-faces
;;    '(match
;;      ((((class color) (min-colors 88) (background light))
;;        :background "yellow1")
;;       (((class color) (min-colors 88) (background dark))
;;        :background "RoyalBlue3" :foreground "cyan")
;;       (((class color) (min-colors 8) (background light))
;;        :background "yellow" :foreground "black")
;;       (((class color) (min-colors 8) (background dark))
;;        :background "blue" :foreground "white")
;;       (((type tty) (class mono))
;;        :inverse-video t)
;;       (t :background "gray")))))

(provide 'xy-rc-replace)
