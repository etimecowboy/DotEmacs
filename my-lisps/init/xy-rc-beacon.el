;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-07-31 Sun 15:31 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-beacon.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `beacon.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun beacon-postload ()
  "Settings of `beacon.el' after it's been loaded."

  (setq beacon-blink-delay                         0.3
        beacon-blink-duration                      0.3
        beacon-blink-when-buffer-changes           t
        beacon-blink-when-focused                  t
        beacon-blink-when-point-moves-horizontally nil
        beacon-blink-when-point-moves-vertically   nil
        beacon-blink-when-window-changes           t
        beacon-blink-when-window-scrolls           t
        beacon-color                               0.4
        beacon-push-mark                           35
        beacon-size                                35)

  (message "* ---[ beacon post-load configuration is complete ]---"))

(provide 'xy-rc-beacon)
