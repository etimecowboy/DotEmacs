;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-23 Sat 16:16 by xin on zbox.soton.ac.uk>
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

;; ;;;###autoload
;; (defun xy/smart-maximize-frame ()
;;   "Improve the `maximize-frame' function of `maxframe.el'. \
;; If the current emacs frame is in full screen mode, then give up \
;; the `maximize-frame command."

;;   (interactive)
;;   (when (and window-system (try-require 'maxframe) (not xy:fullscreen-flag))
;;     (maximize-frame)))

;;;###autoload
(defun maxframe-postload ()
  "Settings of `maxframe.el' after it's been loaded."

  ;; ;; default: stardard HD monitor
  ;; (setq mf-max-width 1920
  ;;       mf-max-height 1080)

  (Laptop ;; S13
   (setq mf-max-width 1366
         mf-max-height 768))

  (message "* ---[ maxframe post-load configuration is complete ]---"))

(provide 'xy-rc-maxframe)
