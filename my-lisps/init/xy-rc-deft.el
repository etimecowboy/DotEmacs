;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-03-29 Fri 10:55 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-deft.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `deft.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun deft-postload ()
  "Settings of `deft.el' after it's been loaded."

  (setq deft-extension "org")
  (setq deft-directory (concat my-emacs-path "/org/source"))
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title nil)

  (message "* ---[ deft post-load configuration is complete ]---"))

(provide 'xy-rc-deft)
