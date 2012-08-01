;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:07 by xin on p5q>
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
(defun ffap-settings ()
  "Settings of `ffap.el'."
  (setq ffap-require-prefix t)
  (setq ffap-c-path (append
                     ffap-c-path
                     ;;system-head-file-dir
                     ;;user-head-file-dir)))
                     user-include-dirs))
  (message "* ---[ ffap configuration is complete ]---"))

(provide 'xy-rc-ffap)
