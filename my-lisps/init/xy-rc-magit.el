;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:28 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun magit-postload ()
  "Settings of `magit' after it's been loaded."
  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))
  (message "* ---[ magit post-load configuration is complete ]---"))

(provide 'xy-rc-magit)
