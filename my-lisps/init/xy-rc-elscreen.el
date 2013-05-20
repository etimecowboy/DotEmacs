;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-05-18 Sat 14:45 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-elscreen.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `elscreen.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun elscreen-postload ()
  "Settings of `elscreen.el' after it's been loaded."

 (setq elscreen-display-screen-number t
       elscreen-display-tab t
       elscreen-prefix-key (kbd "<f5>")
       elscreen-tab-display-control nil
       elscreen-tab-display-kill-screen t)

  (message "* ---[ elscreen post-load configuration is complete ]---"))

(provide 'xy-rc-elscreen)
