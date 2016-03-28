;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:34 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-filecache.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `filecache.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun filecache-postload ()
  "Settings of `filecache.el' after it's been loaded."

  (file-cache-add-directory-list load-path)
  (file-cache-add-directory-list user-include-dirs)
  ;; (file-cache-add-directory "/usr/include")
  ;; (file-cache-add-directory-recursively "/usr/include/c++")
  ;; (file-cache-add-directory-recursively "/usr/local/include")
  (file-cache-add-directory-recursively my-emacs-path)

  (message "* ---[ filecache post-load configuration is complete ]---"))

(provide 'xy-rc-filecache)
