;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-08 Wed 17:13 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pp-c-l.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pp-c-l.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun pp-c-l-postload ()
  "Settings of `pp-c-l.el' after it's been loaded."

  (setq pp^L-^L-string-function
        (lambda (win)
          (make-string
           (1- (window-width win)) ? )))

  (message "* ---[ pp-c-l post-load configuration is complete ]---"))

(provide 'xy-rc-pp-c-l)
