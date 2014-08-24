;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun windows-preload ()
  "Settings of `windows' before it's been loaded."

  ;; set configuration file location.
  (setq win:configuration-file
        (concat my-var-path "/windows-"
                user-login-name "-"
                system-name "-"
                system-configuration))
  ;; (unless (file-exists-p win:configuration-file)
  ;;   (shell-command (concat "touch " win:configuration-file)))

  (setq win:switch-prefix "\C-cw")
  (define-key global-map win:switch-prefix nil)
  (define-key global-map "\C-cw1" 'win-switch-to-window)
  ;; (setq win:quick-selection nil)

  (message "* ---[ windows pre-load configuration is complete ]---"))

;;;###autoload
(defun windows-postload ()
  "Settings of `windows' after it's been loaded."

  ;; Remove frame number in `global-mode-string'
  (delete 'win:mode-string global-mode-string)
  ;; set configuration file location.
  (setq win:configuration-file
        (concat my-var-path "/windows-"
                user-login-name "-"
                system-name "-"
                system-configuration))
  ;; (unless (file-exists-p win:configuration-file)
  ;;   (shell-command (concat "touch " win:configuration-file)))

  (setq win:switch-prefix "\C-cw")
  (define-key global-map win:switch-prefix nil)
  (define-key global-map "\C-cw1" 'win-switch-to-window)
  ;; (setq win:quick-selection nil)
  (setq win:no-raise-at-save t)

  (message "* ---[ windows post-load configuration is complete ]---"))

(provide 'xy-rc-windows)
