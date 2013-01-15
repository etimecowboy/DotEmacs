;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-12 Sat 14:32 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-projectile.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `projectile.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun projectile-postload ()
  "Settings of `projectile.el' after it's been loaded."

  (setq projectile-ack-function         'ack-and-a-half
        projectile-completion-system    'ido
        projectile-enable-caching       t
        projectile-global-mode          nil
        ;; projectile-keymap-prefix        "p"
        projectile-require-project-root t
        projectile-tags-command         "ctags -Re %s")

  (setq projectile-cache-file (expand-file-name  "projectile.cache" my-var-path))

  (message "* ---[ projectile post-load configuration is complete ]---"))

(provide 'xy-rc-projectile)
