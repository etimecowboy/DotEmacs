;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-07-10 Sun 16:00 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-smart-mode-line.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `smart-mode-line' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun xy/sml-setup ()
;;   "Set mode line face but not the default background face."
;;   (interactive)
;;   (sml/setup)
;;   ;; (setq sml/active-background-color "grey85")
;;   ;; (custom-set-faces
;;   ;;  '(default ((t (:background nil))))))
;;   )

;;;###autoload
(defun smart-mode-line-postload ()
  "Settings for `smart-mode-line-mode' after it's been loaded."

  (setq sml/mode-width 40
        sml/shorten-modes t
        sml/show-client t
        sml/show-eol t
        sml/show-frame-identification t
        sml/show-remote t
        sml/use-projectile-p (quote after-prefixes)
        sml/vc-mode-show-backend t
        sml/theme 'powerline)

  (message "* ---[ smart-mode-line post-load configuration is complete ]---"))

(provide 'xy-rc-smart-mode-line)
