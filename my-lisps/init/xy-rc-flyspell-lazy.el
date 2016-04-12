;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-11 Mon 21:55 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-flyspell-lazy.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `flyspell-lazy.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun flyspell-lazy-postload ()
  "Settings for `flyspell-lazy' after it's been loaded."

  (setq flyspell-lazy-extra-lazy t
    flyspell-lazy-idle-seconds 3
    flyspell-lazy-less-feedback nil
    flyspell-lazy-use-flyspell-word t
    flyspell-lazy-window-idle-seconds 15)

  (message "* ---[ flyspell-lazy post-load configuration is complete ]---"))

(provide 'xy-rc-flyspell-lazy)
