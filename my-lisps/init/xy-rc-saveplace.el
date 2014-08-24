;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun saveplace-preload ()
  "Settings of `saveplace.el' before it's been loaded."
  (setq-default save-place t)
  (setq-default save-place-file
                (concat my-var-path "/saveplace-"
                        user-login-name "-"
                        system-name "-"
                        system-configuration))
  ;; (unless (file-exists-p save-place-file)
  ;;   (shell-command (concat "touch " save-place-file)))
  (message "* ---[ saveplace pre-load configuration is complete ]---"))

;;;###autoload
(defun saveplace-postload ()
  "Settings of `saveplace.el'."
  (setq-default save-place-file
                (concat my-var-path "/saveplace-"
                        user-login-name "-"
                        system-name "-"
                        system-configuration))
  ;; (unless (file-exists-p save-place-file)
  ;;   (shell-command (concat "touch " save-place-file)))
  (message "* ---[ saveplace post-load configuration is complete ]---"))

(provide 'xy-rc-saveplace)
