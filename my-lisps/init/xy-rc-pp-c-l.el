;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:47 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;;;###autoload
(defun xy/turn-on-pretty-control-l-mode ()
  "Turn on pretty-control-l-mode."
  (interactive)
  (when (try-require 'pp-c-l)
    (pretty-control-l-mode 1)))

;;;###autoload
(defun pp-c-l-postload ()
  "Settings of `pp-c-l.el' after it's been loaded."

  (setq pp^L-^L-string-function (lambda (win)
                  (make-string
                   (1- (+ (window-width win) -10)) ? )))

  (if window-system
      (custom-set-faces
        '(pp^L-highlight ((t (:strike-through t)))))
    ;; (custom-set-faces '(pp^L-highlight ((t (:background "cyan")))))
    )

  (message "* ---[ pp-c-l post-load configuration is complete ]---"))

(provide 'xy-rc-pp-c-l)
