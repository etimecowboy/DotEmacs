;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:40 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-c-yasnippet.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-c-yasnippet.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun helm-c-yasnippet-postload ()
  "Settings of `helm-c-yasnippet.el' after it's been loaded."

  (setq helm-yas-display-key-on-candidate   t
        helm-yas-display-msg-after-complete t
        helm-yas-not-display-dups           t
        helm-yas-space-match-any-greedy     nil)

  (message "* ---[ helm-c-yasnippet post-load configuration is complete ]---"))

(provide 'xy-rc-helm-c-yasnippet)
