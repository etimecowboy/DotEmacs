;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-01-13 Fri 16:12 by xin on zboxum>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-desktop.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `desktop.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun desktop-postload ()
  "Settings of `desktop' after it's been loaded."

  (setq desktop-path '("~/.emacs.d/var/")

        desktop-base-file-name (concat "desktop-"
                                       user-login-name "@"
                                       system-name "@"
                                       system-configuration)

        desktop-base-lock-name (concat "desktop.lock-"
                                       user-login-name "@"
                                       system-name "@"
                                       system-configuration))

  (setq desktop-buffers-not-to-save nil
        desktop-load-locked-desktop 'ask
        desktop-clear-preserve-buffers '("\\*scratch\\*"
                                         "\\*Messages\\*"
                                         "\\*server\\*"
                                         "\\*tramp/.+\\*"
                                         "\\*Warnings\\*"))

  (message "* ---[ desktop post-load configuration is complete ]---"))

(provide 'xy-rc-desktop)
