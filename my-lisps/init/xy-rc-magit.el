;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:12 by xin on p5q>
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
(defun magit-settings ()
  "Settings of `magit'."
  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))
  (message "* ---[ magit configuration is complete ]---"))

(provide 'xy-rc-magit)
