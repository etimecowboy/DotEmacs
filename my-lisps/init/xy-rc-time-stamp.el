;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:50 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-time-stamp.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `time-stamp.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun time-stamp-postload ()
   "Settings of `time-stamp.el' after it's been loaded."
   ;; Start of a time stamp
   (setq time-stamp-start "Time-stamp:")
   ;; End of a time stamp
   (setq time-stamp-end "\n")
   ;; format of the string inserted by `M-x time-stamp'
   (setq time-stamp-format " <%Y-%02m-%02d %3a %02H:%02M by %u on %s>")
   (message "* ---[ time-stamp post-load configuration is complete ]---"))

(provide 'xy-rc-time-stamp)
