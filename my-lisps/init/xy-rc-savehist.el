;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-savehist.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `savehist.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun savehist-preload ()
  "Settings of `savehist.el' before it's been loaded."
  (setq-default savehist-file
                (concat my-var-path "/savehist-"
                        user-login-name "-"
                        system-name "-"
                        system-configuration))
  ;; (unless (file-exists-p savehist-file)
  ;;   (shell-command (concat "touch " savehist-file))))

  (message "* ---[ savehist pre-load configuration is complete ]---"))


;;;###autoload
(defun savehist-postload ()
  "Settings of `savehist.el' after it's been loaded"

  (message "* ---[ savehist post-load configuration is complete ]---"))

(provide 'xy-rc-savehist)
