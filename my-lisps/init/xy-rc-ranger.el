;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-09-01 Thu 11:26 by xin on zboxum>
;;--------------------------------------------------------------------
;; File name:    `xy-ranger.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ranger.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun ranger-postload ()
  "Settings of `ranger.el' after it's been loaded."

 (setq ranger-cleanup-eagerly     t
       ranger-copy-ring-length    20
       ranger-deer-show-details   nil
       ranger-dont-show-binary    t
       ranger-history-length      50
       ranger-listing-dir-first   t
       ranger-override-dired      nil
       ranger-override-dired-mode nil
       ranger-show-dotfiles       t
       ranger-show-literal        t)
 (setq ranger-excluded-extensions
       '("avi" "wmv" "mkv" "rm" "rmvb" "iso" "mp4" "bin" "exe" "msi"))
  
  (message "* ---[ ranger post-load configuration is complete ]---"))

(provide 'xy-ranger)
