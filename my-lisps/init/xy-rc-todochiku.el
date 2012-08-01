;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:36 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-todochiku.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `todochiku.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun todochiku-settings ()
  "Settings of `todochiku'."
  (setq-default todochiku-command
        (case system-type
          (windows-nt "D:/Growl for Windows/growlnotify.exe")
          (darwin "/usr/local/bin/growlnotify")
          (t "notify-send")))
  ;; (setq todochiku-command "D:/Growl/growlnotify.exe")
  ;; (let ((non-exist (not (file-exists-p todochiku-command))))
  ;;   (setq todochiku-tooltip-too (and non-exist window-system))
  ;;   (setq todochiku-message-too
  ;;         (and (or non-exist (not window-system))
  ;; (not todochiku-tooltip-too))))
  (setq-default todochiku-icons-directory
        (concat my-local-image-path "/todochiku"))
  (setq todochiku-timeout 15)
  (message "* ---[ todochiku configuration is complete ]---")
)

(provide 'xy-rc-todochiku)
