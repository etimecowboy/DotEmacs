;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-session.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `session.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun session-settings ()
  "Settings for `session'."
  ;; BUG: this setq seems to cause problem when recovering last point
  ;;      position.
  ;; (setq session-initialize '(session menus))
  (setq-default session-save-file (concat my-var-path "/session-"
                                          user-login-name "@"
                                          system-name "@"
                                          system-configuration))
  (unless (file-exists-p session-save-file)
    (shell-command (concat "touch " session-save-file)))
  ;; OrgMode org-mark-ring is a circular object.
  ;; Don't recursively display gtd files in session list
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; Don't display org agenda files
  (add-to-list 'session-globals-exclude 'org-agenda-files)

  (setq session-globals-max-size 100)
  (setq session-globals-max-string 40960)
  (setq session-registers-max-string 2048)

  (message "* ---[ session configuration is complete ]---"))

(provide 'xy-rc-session)
