;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:38 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-windows.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `windows.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun windows-settings ()
  "Settings of `windows.el'."
  ;; Remove frame number in `global-mode-string'
  (delete 'win:mode-string global-mode-string)
  ;; set configuration file location.
  (setq win:configuration-file (concat my-var-path "/windows-"
                                       user-login-name "@"
                                       system-name "@"
                                       system-configuration))
  (unless (file-exists-p win:configuration-file)
    (shell-command (concat "touch " win:configuration-file)))
  (setq win:switch-prefix "\C-cw")
  ;; (define-key global-map win:switch-prefix nil)
  (define-key global-map "\C-cw1" 'win-switch-to-window)
  (setq win:quick-selection nil)
  (setq win:no-raise-at-save t)
  (message "* ---[ windows configuration is complete ]---"))

(provide 'xy-rc-windows)
