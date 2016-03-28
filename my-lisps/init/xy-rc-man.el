;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:43 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-man.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `man' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun man-current-word ()
  "Check the word at the point in `man'"
  (interactive)
  (manual-entry (current-word)))

;;;###autoload
(defun man-postload ()
  "Settings for `man' after it's been loaded."
  (setq Man-notify-method 'newframe)
  (setq Man-fontify-manpage-flag t)
  ;; (setq Man-overstrike-face 'bold)
  (setq Man-width 67)
  (message "* ---[ Man post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun man-face-settings ()
;;   "Face settings for `man'."
;;   (setq Man-overstrike-face 'yellow-face)
;;   (setq Man-underline-face 'underline-green-face)
;;   (setq Man-reverse-face 'red-face))

(provide 'xy-rc-man)
