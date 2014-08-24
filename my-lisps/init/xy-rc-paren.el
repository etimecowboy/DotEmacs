;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-paren.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `paren.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun paren-postload ()
  "Settings for `paren' after it's been loaded."
  (setq show-paren-style 'expression)
  (message "* ---[ paren post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun paren-face-settings ()
;;   "Face settings for `paren'."
;;   (unless is-before-emacs-21
;;     ;; 括号颜色设置
;;     (set-face-background 'show-paren-match "magenta")
;;     (set-face-foreground 'show-paren-match "yellow")
;;     (set-face-background 'show-paren-mismatch "red")))

(provide 'xy-rc-paren)
