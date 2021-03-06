;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-10 Fri 22:23 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-color-theme.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `color-theme.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/load-themes ()
  "Load all themes."

  (interactive)
  (xy/install-lisps (concat my-own-lisp-path "/themes"))
  (setq color-theme-initialized t))

;;;###autoload
(defun color-theme-postload ()
  "Settings of `color-theme.el' after it's been loaded."

  (setq color-theme-is-global t)
  ;; (setq color-theme-is-cumulative t)
  (setq color-theme-directory (concat my-own-lisp-path "/themes"))
  ;; (color-theme-initialize) ;; NOTE: This function has been removed
  (setq color-theme-initialized t)
  ;; create some frames with different color themes
  ;; BUG: will create three frames when Emacs startup
  ;; (let ((color-theme-is-global nil))
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard)
  ;;     (select-frame (make-frame))
  ;;     (color-theme-standard))

  (message "* ---[ color-theme post-load configuration is complete ]---"))

(provide 'xy-rc-color-theme)

;; ahei's settings : cycle
