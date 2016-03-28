;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:29 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-compile.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `compile.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun compile-postload ()
  "Settings for `compile' after it's been loaded."
  (require 'compile-misc)
  (setq compile-command "make -k")
  (setq compilation-scroll-output t)
  (message "* ---[ compile post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun compile-face-settings ()
;;   "Face settings for `compile'."
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (setq compilation-message-face nil)
;;   (custom-set-faces '(compilation-warning
;;                       ((((class color)) :foreground "red" :bold nil))))
;;   (custom-set-faces '(compilation-info
;;                       ((((type tty pc)) :foreground "magenta") (t (:foreground "magenta")))))
;;   (setq compilation-enter-directory-face 'beautiful-blue-face)
;;   (setq compilation-leave-directory-face 'magenta-face))

(provide 'xy-rc-compile)
