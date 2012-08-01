;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun shell-pop-settings ()
  "Settings for `shell-pop.el'."
  (shell-pop-set-internal-mode "eshell")
  ;; (shell-pop-set-internal-mode-shell "/bin/bash")
  ;; the number for the percentage of the selected window.
  ;; If 100, shell-pop use the whole of selected window, not spliting.
  (shell-pop-set-window-height 35)
  ;; shell-pop-up position. You can choose "top" or "bottom".
  (shell-pop-set-window-position "bottom")
  (message "* ---[ shell-pop configuration is complete ]---")
)

(provide 'xy-rc-shell-pop)
