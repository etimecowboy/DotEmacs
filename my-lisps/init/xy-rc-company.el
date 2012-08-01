;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:03 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-company.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `company.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun company-settings ()
  "Settings of `company'."

  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-begin-commands '(self-insert-command))
  (define-key company-mode-map
    (kbd "M-RET") 'company-expand-top)
  (message "* ---[ company configuration is complete ]---"))

(provide 'xy-rc-company)
