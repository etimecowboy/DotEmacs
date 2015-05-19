;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-17 Sun 01:53 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-projectile.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-projectile.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun helm-projectile-postload ()
  "Settings of `helm-projectile.el' after it's been loaded."

  (setq helm-projectile-fuzzy-match t)
  (setq helm-projectile-sources-list
    (quote
     (helm-source-projectile-buffers-list
      helm-source-projectile-files-list
      helm-source-projectile-projects)))
  (setq projectile-switch-project-action 'helm-projectile-find-file)

  (helm-projectile-on)
  
  (message "* ---[ helm-projectile post-load configuration is complete ]---"))

(provide 'xy-rc-helm-projectile)
