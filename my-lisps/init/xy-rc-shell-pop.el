;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-16 Sat 23:07 by xin on zbox.soton.ac.uk>
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

  (setq shell-pop-shell-type
        '("eshell" "*eshell*" (lambda nil (eshell))))
  (setq shell-pop-window-height 35)
  (setq shell-pop-window-position "bottom")
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  
  (message "* ---[ shell-pop post-load configuration is complete ]---"))

(provide 'xy-rc-shell-pop)
