;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:33 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun paren-settings ()
  "Settings for `paren'."
  (setq show-paren-style 'expression)
  (message "* ---[ paren configuration is complete ]---"))

;; ;;;###autoload
;; (defun paren-face-settings ()
;;   "Face settings for `paren'."
;;   (unless is-before-emacs-21
;;     ;; 括号颜色设置
;;     (set-face-background 'show-paren-match "magenta")
;;     (set-face-foreground 'show-paren-match "yellow")
;;     (set-face-background 'show-paren-mismatch "red")))

(provide 'xy-rc-paren)
