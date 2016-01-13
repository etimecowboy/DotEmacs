;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-11-28 Sat 10:52 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-runner.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `runner.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun runner-preload ()
;;   "Settings of `recentf.el' before it's been loaded."
;;   (setq runner-init-file (concat my-var-path "/runner-conf-"
;;                                  user-login-name "-"
;;                                  system-name "-"
;;                                  system-configuration ".el"))
;;   (message "* ---[ runner pre-load configuration is complete ]---"))

;;;###autoload
(defun runner-postload ()
  "Settings for `runner' after it's been loaded."

  (setq runner-init-file (concat my-var-path "/runner-conf-"
                                 user-login-name "-"
                                 system-name "-"
                                 system-configuration ".el"))

  (setq runner-run-in-background t
        runner-show-label        nil
        runner-shell-function   'runner-shell-function-eshell)

  ;; fix the problem of loading runner-init-file
  (runner-settings-load)
  (runner-reset)

  (message "* ---[ runner post-load configuration is complete ]---"))

(provide 'xy-rc-runner)
