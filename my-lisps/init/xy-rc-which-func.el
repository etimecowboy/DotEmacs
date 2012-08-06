;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:54 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-which-func.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `which-func.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun which-func-postload ()
  "Settings for `which-func' after it's been loaded."
  (setq which-func-unknown "unknown")
  (setq which-func-modes
        '(emacs-lisp-mode cc-mode c-mode c++-mode perl-mode cperl-mode
          python-mode makefile-mode sh-mode fortran-mode f90-mode
          ada-mode diff-mode vhdl-mode verilog-mode))
  (message "* ---[ which-func post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun which-func-face-settings ()
;;   "Face settings for `which-func'."
;;   (if window-system
;;       (progn
;;         (unless is-before-emacs-21
;;           (set-face-foreground 'which-func "yellow2")
;;           (set-face-background 'which-func "dark magenta")))
;;     (unless is-before-emacs-21
;;       (set-face-foreground 'which-func "yellow")
;;       (set-face-background 'which-func "black"))))

(provide 'xy-rc-which-func)
