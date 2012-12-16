;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-11-19 Mon 09:31 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ffap.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ffap.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun ffap-postload ()
  "Settings of `ffap.el' after it's been loaded."
  (setq ffap-require-prefix t
        dired-at-point-require-prefix t)
  (setq ffap-c-path (append
                     ffap-c-path
                     ;;system-head-file-dir
                     ;;user-head-file-dir)))
                     user-include-dirs))
  (message "* ---[ ffap post-load configuration is complete ]---"))

(provide 'xy-rc-ffap)
