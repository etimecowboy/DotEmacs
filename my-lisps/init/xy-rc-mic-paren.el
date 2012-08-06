;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:29 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mic-paren.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mic-paren.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun mic-paren-postload ()
  "Settings for `mic-paren' after it's been loaded."
  ;; (paren-activate)
  (setq paren-message-show-linenumber 'absolute)
  (message "* ---[ mic-paren post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun mic-paren-face-settings ()
;;   "Face settings for `mic-paren'."
;;   (set-face-background 'paren-face-match "magenta")
;;   (set-face-foreground 'paren-face-match "yellow")
;;   (set-face-background 'paren-face-mismatch "red"))

(provide 'xy-rc-mic-paren)
