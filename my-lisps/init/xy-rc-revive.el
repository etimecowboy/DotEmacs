;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-06 Mon 11:31 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-revive.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `revive.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun revive-preload ()
  "Settings of `revive' before it's been loaded."

  (setq revive:configuration-file (concat my-var-path "/revive-"
                                          user-login-name "@"
                                          system-name "@"
                                          system-configuration))
  (unless (file-exists-p revive:configuration-file)
    (shell-command (concat "touch " revive:configuration-file)))

  (message "* ---[ revive pre-load configuration is complete ]---"))

;;;###autoload
(defun revive-postload ()
  "Settings of `revive.el' after it's been loaded."

  (setq revive:configuration-file (concat my-var-path "/revive-"
                                          user-login-name "@"
                                          system-name "@"
                                          system-configuration))
  (unless (file-exists-p revive:configuration-file)
    (shell-command (concat "touch " revive:configuration-file)))

  (add-hook 'delete-frame-hook 'save-current-configuration)
  (add-hook 'kill-emacs-hook 'save-current-configuration)

  (message "* ---[ revive post-load configuration is complete ]---"))

(provide 'xy-rc-revive)
