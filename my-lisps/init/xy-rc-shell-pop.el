;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:44 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell-pop.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `shell-pop.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun shell-pop-postload ()
  "Settings for `shell-pop.el' after it's been loaded."
  (shell-pop-set-internal-mode "eshell")
  ;; (shell-pop-set-internal-mode-shell "/bin/bash")
  ;; the number for the percentage of the selected window.
  ;; If 100, shell-pop use the whole of selected window, not spliting.
  (shell-pop-set-window-height 35)
  ;; shell-pop-up position. You can choose "top" or "bottom".
  (shell-pop-set-window-position "bottom")
  (message "* ---[ shell-pop post-load configuration is complete ]---"))

(provide 'xy-rc-shell-pop)
