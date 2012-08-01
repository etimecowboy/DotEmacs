;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:06 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-egg.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `egg.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun egg-settings ()
  "Settings for `egg'."
  (setq egg-enable-tooltip t)
  (setq egg-refresh-index-in-backround t)
  (setq egg-show-key-help-in-buffers
        '((:status :log :file-log :reflog :diff :commit)))
  (message "* ---[ egg configuration is complete ]---"))

(provide 'xy-rc-egg)
