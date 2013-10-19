;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-10-19 Sat 21:06 by xin on S13>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun session-preload ()
  "Settings for `session' before it's been loaded."

  (setq session-save-file (concat my-var-path "/session-"
                                  user-login-name "@"
                                  system-name "@"
                                  system-configuration))
  (unless (file-exists-p session-save-file)
    (shell-command (concat "touch " session-save-file)))

  (message "* ---[ session pre-load configuration is complete ]---"))

;;;###autoload
(defun session-postload ()
  "Settings for `session' after it's been loaded."

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

  (setq session-globals-max-size 100
        session-globals-max-string 40960
        session-registers-max-string 2048)

  ;; org-mode
  ;; Don't recursively display gtd files in session list
  (add-to-list 'session-globals-exclude 'org-mark-ring)
  ;; Don't display org agenda files
  (add-to-list 'session-globals-exclude 'org-agenda-files)

  (message "* ---[ session post-load configuration is complete ]---"))

(provide 'xy-rc-session)
