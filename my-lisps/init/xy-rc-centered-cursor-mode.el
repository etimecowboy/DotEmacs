;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:47 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-centered-cursor-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `centered-cursor-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun centered-cursor-mode-postload ()
  "Settings of `centered-cursor-mode.el' after it's been loaded."

  (setq ccm-ignored-commands
        '(mouse-drag-region mouse-set-point widget-button-click
                            scroll-bar-toolkit-scroll))
  (setq-default ccm-recenter-at-end-of-file nil
                ccm-step-delay              0.01
                ccm-step-size               2
                ccm-vpos-inverted           -1)
  (setq-default ccm-vpos-init '(round (* 21 (window-text-height)) 34))

  (message "* ---[ centered-cursor-mode post-load configuration is complete ]---"))

(provide 'xy-rc-centered-cursor-mode)
