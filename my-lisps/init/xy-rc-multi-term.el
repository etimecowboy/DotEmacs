;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:14 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-multi-term.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `multi-term.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun multi-term-settings ()
  "Settings for `term'."
  ;; (when use-cua
  ;;   (cua-selection-mode 1))
  (setq multi-term-switch-after-close nil)
  (setq multi-term-program "bash")
  (message "* ---[ multi-term configuration is complete ]---"))

(provide 'xy-rc-multi-term)
