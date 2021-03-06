;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:27 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-install.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-install.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun auto-install-postload ()
  "Settings of `auto-install.el' after it's been loaded."

  (setq auto-install-save-confirm nil)
  (setq auto-install-directory my-emacswiki-lisp-path)
  ;; (auto-install-update-emacswiki-package-name t)

  (message "* ---[ auto-install post-load configuration is complete ]---"))

(provide 'xy-rc-auto-install)
