;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:21 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hideshow-org.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hideshow-org.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun hideshow-org-postload ()
  "Settings of `hideshow-org.el' after it's been loaded."

  (setq hs-org/trigger-keys-block '(kbd "TAB"))
  (setq tab-always-indent t)
  ;; (indent-tabs-mode -1)
  (message "* ---[ hideshow-org post-load configuration is complete ]---"))

(provide 'xy-rc-hideshow-org)
