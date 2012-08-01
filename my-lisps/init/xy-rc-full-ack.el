;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:29 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-full-ack.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `full-ack.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ack-arguments-from-options (regexp)
  (let ((arguments (list "--color"
             (ack-option "smart-case" (eq ack-ignore-case 'smart))
             (ack-option "heading" ack-heading)
             (ack-option "env" ack-use-environment))))
    (unless ack-ignore-case
      (push "-i" arguments))
    (unless regexp
      (push "--literal" arguments))
    (if (> ack-context 0)
    (push (format "--context=%d" ack-context) arguments))
    arguments))

;;;###autoload
(defun full-ack-settings ()
  "settings for `full-ack'."
  (setq ack-context 0)
  (setq ack-executable (executable-find "ack-grep"))
  (setq ack-heading nil)
  (setq ack-prompt-for-directory t)
  (message "* ---[ full-ack configuration is complete ]---")
)

(provide 'xy-rc-full-ack)
