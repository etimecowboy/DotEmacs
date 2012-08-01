;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:24 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun auto-install-settings ()
  "Settings of `auto-install.el'."
  (setq auto-install-save-confirm nil)
  (setq auto-install-directory my-emacswiki-lisp-path)
  ;; (auto-install-update-emacswiki-package-name t)
  (message "* ---[ auto-install configuration is complete ]---"))

(provide 'xy-rc-auto-install)
