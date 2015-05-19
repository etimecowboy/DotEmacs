;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-17 Sun 01:54 by xin on zbox.soton.ac.uk>
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

  (setq ;; projectile-ack-function         'ack-and-a-half
        projectile-keymap-prefix        "p"
        projectile-enable-caching       t
        projectile-indexing-method      'alien
        projectile-require-project-root t
        projectile-tags-command         "ctags -Re %s")

  (setq projectile-cache-file
        (concat my-var-path "/projectile-"
                user-login-name "-"
                system-name "-"
                system-configuration ".cache"))

  ;; `helm-projectile'
  (setq projectile-completion-system     'helm
        projectile-switch-project-action 'helm-projectile)

  (message "* ---[ projectile post-load configuration is complete ]---"))

(provide 'xy-rc-projectile)
