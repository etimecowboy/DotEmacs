;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-03 Thu 17:51 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org-bullets.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `org-bullets.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun org-bullets-postload ()
  "Settings of `org-bullets.el' after it's been loaded."

  (setq org-bullets-bullet-list '("◉" "○" "✸" "✿"))

  (message "* ---[ org-bullets post-load configuration is complete ]---"))

(provide 'xy-rc-org-bullets)
