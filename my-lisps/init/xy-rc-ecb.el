;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:15 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ecb.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ecb.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/ecb-start ()
  "Start ECB."
  (interactive)
  (setq stack-trace-on-error t) ;; BUG: fix emacs24 ((@url :file-name "http://lists.gnu.org/archive/html/help-gnu-emacs/2011-09/msg00192.html" :display "REF"))
  (xy/cedet-start)
  (require 'ecb-autoloads)
  (ecb-activate)
  (ecb-layout-switch "left-analyse"))

;;;###autoload
(defun ecb-postload ()
  "Settings for `ecb' after it's been loaded."
  (setq-default ecb-auto-compatibility-check nil
                ecb-tip-of-the-day nil
                ecb-options-version "2.40")
  (setq ecb-compile-window-height 10
        ecb-compile-window-width  'edit-window
        ;; ecb-layout-name "leftright-analyse"
  )
  (Windows
   (setq ecb-source-path
         '("~/work" "~/Dropbox/phdwork")))
  (GNULinux
   (setq ecb-source-path
         '("~/work" "~/Dropbox/phdwork")))
  (message "* ---[ ecb post-load configuration is complete ]---"))

(provide 'xy-rc-ecb)
