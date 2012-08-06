;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:28 by xin on p5q>
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

(eval-when-compile (require 'cl))
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
