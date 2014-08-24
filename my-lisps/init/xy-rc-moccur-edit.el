;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-moccur-edit.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `moccur-edit.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun moccur-edit-postload ()
  "Settings for `moccur' before it's been loaded."

  ;; NOTE: dangerous!
  ;; Modified buffers are saved automatically.
  ;; Thanks request!
  ;; (defadvice moccur-edit-change-file
  ;;  (after save-after-moccur-edit-buffer activate)
  ;;  (save-buffer))

  (message "* ---[ moccur-edit post-load configuration is complete ]---"))

(provide 'xy-rc-moccur-edit)
