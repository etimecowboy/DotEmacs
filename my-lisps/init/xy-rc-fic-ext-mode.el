;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:33 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-fic-ext-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `fic-ext-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun xy/turn-on-fic-ext-mode ()
  "Turn on fic-ext-mode to highlight extra keywords."

  (interactive)
  (when (try-require 'fic-ext-mode)
    (fic-ext-mode 1)))

;;;###autoload
(defun fic-ext-mode-postload ()
  "Settings of `fic-ext-mode.el' after it's been loaded."

  (setq fic-highlighted-words
  '("BUG" "DEBUG" "FIXME" "HACK" "TODO" "NOTE" "REF"))

  (custom-set-faces
   '(font-lock-fic-author-face ((t (:foreground "orangered" :underline t :weight bold))))
   '(font-lock-fic-face ((t (:foreground "red" :slant italic :weight bold)))))

  (message "* ---[ fic-ext-mode post-load configuration is complete ]---"))

(provide 'xy-rc-fic-ext-mode)
