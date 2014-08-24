;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun linum-postload ()
  "Settings for `linum' after it's been loaded."
  ;; (unless is-after-emacs-23
  ;;   (require 'linum "linum-for-22"))

  ;; linum+
  ;; REF: (@url :file-name "http://emacser.com/linum-plus.htm" :display "emacser")
  (try-require 'linum+)
  ;; hlinum
  (try-require 'hlinum)

  (custom-set-faces
   '(linum ((t (:height 0.7)))))

  (message "* ---[ linum post-load configuration is complete ]---"))

(provide 'xy-rc-linum)
