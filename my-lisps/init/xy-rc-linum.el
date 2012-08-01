;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:31 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-linum.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `linum.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun linum-settings ()
  "settings for `linum'."
  (unless is-after-emacs-23
    (require 'linum "linum-for-22"))
  ;; linum+
  ;; REF: (@url :file-name "http://emacser.com/linum-plus.htm" :display "emacser")
  (require 'linum+)
  (message "* ---[ linum configuration is complete ]---"))

;; ;;;###autoload
;; (defun linum-face-settings ()
;;   "Face settings for `linum'."
;;   (custom-set-faces
;;    '(linum
;;      ((((background dark))
;;        :foreground "cyan")
;;       (t :foreground "gray")))))

(provide 'xy-rc-linum)
