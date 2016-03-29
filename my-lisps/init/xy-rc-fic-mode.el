;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 19:53 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-fic-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `fic-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun xy/turn-on-fic-mode ()
  "Turn on fic-mode to highlight extra keywords."

  (interactive)
  (when (try-require 'fic-mode)
    (fic-mode 1)))

;;;###autoload
(defun fic-mode-postload ()
  "Settings of `fic-mode.el' after it's been loaded."

  (setq fic-highlighted-words
  '("BUG" "DEBUG" "FIXME" "HACK" "TODO" "NOTE" "REF"))

  ;; (custom-set-faces
  ;;  '(font-lock-fic-author-face ((t (:foreground "orangered" :underline t :weight bold))))
  ;;  '(font-lock-fic-face ((t (:foreground "red" :slant italic :weight bold)))))

  (message "* ---[ fic-mode post-load configuration is complete ]---"))

(provide 'xy-rc-fic-mode)
