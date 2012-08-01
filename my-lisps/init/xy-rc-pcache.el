;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:16 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pcache.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pcache.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun pcache-settings ()
  "Settings of `pcache.el'."
  (setq pcache-directory
    (let ((dir (concat my-var-path "/pcache")))
      (make-directory dir t)
      dir))
  (message "* ---[ pcache configuration is complete ]---"))

(provide 'xy-rc-pcache)
