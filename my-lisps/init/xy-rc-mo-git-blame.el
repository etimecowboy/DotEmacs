;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-08 Wed 21:53 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mo-git-blame.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mo-git-blame.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun mo-git-blame-postload ()
  "Settings of `mo-git-blame.el' after it's been loaded."

  (setq mo-git-blame-blame-window-width 40
        mo-git-blame-incremental t
        mo-git-blame-use-ido 'always)

  (message "* ---[ mo-git-blame post-load configuration is complete ]---"))

(provide 'xy-rc-mo-git-blame)
