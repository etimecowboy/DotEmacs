;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-maxframe.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `maxframe.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/smart-maximize-frame ()
  "Improve the `maximize-frame' function of `maxframe.el'. \
If the current emacs frame is in full screen mode, then give up \
the `maximize-frame command."

  (interactive)
  (when (and window-system (try-require 'maxframe) (not xy:fullscreen-flag))
    (maximize-frame)))

;;;###autoload
(defun maxframe-postload ()
  "Settings of `maxframe.el' after it's been loaded."
  ;; (Laptop
  ;;  (setq mf-max-width 1366
  ;;        mf-max-height 768))

  (message "* ---[ maxframe post-load configuration is complete ]---"))

(provide 'xy-rc-maxframe)
