;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:47 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-appt.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `appt.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun appt-postload ()
  "Settings of `appt' after it's been loaded."
  ;; (add-hook 'diary-hook 'appt-make-list)
  ;; (setq appt-display-format 'window)
  ;; (setq appt-display-diary nil)

  (setq appt-time-msg-list nil)
  (setq appt-audible t)
  (setq appt-display-format 'echo)
  (setq appt-message-warning-time 15)
  (setq appt-display-interval 5)
  (setq appt-display-duration (* 365 24 60 60))
  (setq appt-display-mode-line t)

  ;; REF: (@url :file-name "http://lists.gnu.org/archive/html/emacs-orgmode/2009-11/msg00236.html" :display "Post@emacs-orgmode")
  ;; NOTE: May do the job twice with (@file :file-name "xy-rc-org.el" :to "org-show-notification-handler" :display "`org-show-notification-handler'")
  ;; (when window-system
  (when (try-require 'todochiku)
    (setq appt-display-format 'window)
    (defun xy/appt-display (min-to-app new-time msg)
      (todochiku-message "Emacs appointment" msg
                         (todochiku-icon 'alarm))
      ;; BUG: not working
      ;; (xy/emms-start)
      ;; (emms-play-file "~/emacs/mew/chimes.wav"))
      )
    (setq appt-disp-window-function (function xy/appt-display)))

  ;; turn appointment checking on
  (unless (daemonp) (appt-activate 1))

  (message "* ---[ appt post-load configuration is complete ]---"))

(provide 'xy-rc-appt)
