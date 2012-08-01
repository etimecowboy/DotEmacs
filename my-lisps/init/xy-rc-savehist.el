;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:19 by xin on p5q>
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
(defun savehist-settings ()
  "Settings of `savehist.el'."
  (setq-default savehist-file (concat my-var-path "/savehist-"
                                      user-login-name "@"
                                      system-name "@"
                                      system-configuration))
  (unless (file-exists-p savehist-file)
    (shell-command (concat "touch " savehist-file)))
  (message "* ---[ savehist configuration is complete ]---"))

(provide 'xy-rc-savehist)
