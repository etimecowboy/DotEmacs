;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-saveplace.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `saveplace.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun saveplace-settings ()
  "Settings of `saveplace.el'."
  (setq-default save-place-file (concat my-var-path "/saveplace-"
                                        user-login-name "@"
                                        system-name "@"
                                        system-configuration))
  (unless (file-exists-p save-place-file)
    (shell-command (concat "touch " save-place-file)))
  (message "* ---[ saveplace configuration is complete ]---"))

(provide 'xy-rc-saveplace)
