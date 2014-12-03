;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-12-03 Wed 16:42 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ox-s5.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ox-s5.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun ox-s5-postload ()
  "Settings of `ox-s5.el' after it's been loaded."

  (setq org-s5-control-visibility 'hidden)
  (setq org-s5-default-view 'slideshow)
  (setq org-s5-ui-url
    "https://dl.dropboxusercontent.com/u/7817597/stylesheets/s5ui/")
  (setq org-s5-theme-file nil)

  (message "* ---[ ox-s5 post-load configuration is complete ]---"))

(provide 'xy-rc-ox-s5)
