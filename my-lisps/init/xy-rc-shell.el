;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:44 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `shell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun shell-postload ()
  "Settings for `term' after it's been loaded."
  ;; Remove ^M characters
  ;; (add-hook 'comint-output-filter-functions
  ;;          'comint-strip-ctrl-m)
  (require 'ansi-color) ;; Use ansi-color in shell and eshell mode
  ;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (require 'shell-completion) ;; Press tab for completions
  ;; Add command of `shell-command', `shell-command-on-region',
  ;; `compile', `grep', and `background' to shell history file
  (require 'shell-history)

  (message "* ---[ shell-mode post-load configuration is complete ]---"))

(provide 'xy-rc-shell)
