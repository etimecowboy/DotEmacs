;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:32 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun mic-paren-settings ()
  "Settings for `mic-paren'."
  ;; (paren-activate)
  (setq paren-message-show-linenumber 'absolute)
  (message "* ---[ mic-paren configuration is complete ]---"))

;; ;;;###autoload
;; (defun mic-paren-face-settings ()
;;   "Face settings for `mic-paren'."
;;   (set-face-background 'paren-face-match "magenta")
;;   (set-face-foreground 'paren-face-match "yellow")
;;   (set-face-background 'paren-face-mismatch "red"))

(provide 'xy-rc-mic-paren)
