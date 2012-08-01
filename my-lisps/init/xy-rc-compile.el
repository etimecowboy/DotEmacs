;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:26 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun compile-settings ()
  "Settings for `compile'."
  (require 'compile-misc)
  (setq compile-command "make -k")
  (setq compilation-scroll-output t)
  (message "* ---[ compile configuration is complete ]---")
)

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
