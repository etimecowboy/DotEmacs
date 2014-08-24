;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun todochiku-postload ()
  "Settings of `todochiku' after it's been loaded."
  (setq-default todochiku-command
                (case system-type
                  (windows-nt
                   "C:/Program Files (x86)/Growl for Windows/growlnotify.exe")
                  (darwin "/usr/local/bin/growlnotify")
                  (t "notify-send")))
  ;; (OfficePC
  ;;  (setq-default todochiku-command
  ;;                (case system-type
  ;;                  (windows-nt
  ;;                   "C:/Program Files (x86)/Growl for Windows/growlnotify.exe")
  ;;                  (darwin "/usr/local/bin/growlnotify")
  ;;                  (t "notify-send"))))
  ;; (setq-default todochiku-command
  ;;   (Windows
  ;;     (OfficePC
  ;;      "C:/Program Files (x86)/Growl for Windows/growlnotify.exe")
  ;;     (Laptop
  ;;      "D:/Growl for Windows/growlnotify.exe"))
  ;;   (GNULinux
  ;;    "/usr/local/bin/growlnotify")
  ;;   (t "notify-send"))
  ;; (setq todochiku-command "D:/Growl/growlnotify.exe")
  ;; (let ((non-exist (not (file-exists-p todochiku-command))))
  ;;   (setq todochiku-tooltip-too (and non-exist window-system))
  ;;   (setq todochiku-message-too
  ;;         (and (or non-exist (not window-system))
  ;; (not todochiku-tooltip-too))))
  (setq-default todochiku-icons-directory
        (concat my-local-image-path "/todochiku"))
  (setq todochiku-timeout 15)
  (message "* ---[ todochiku post-load configuration is complete ]---"))

(provide 'xy-rc-todochiku)
