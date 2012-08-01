;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:28 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun filecache-settings ()
  "Settings of `filecache.el'."
  (file-cache-add-directory-list load-path)
  (file-cache-add-directory-list user-include-dirs)
  ;; (file-cache-add-directory "/usr/include")
  ;; (file-cache-add-directory-recursively "/usr/include/c++")
  ;; (file-cache-add-directory-recursively "/usr/local/include")
  (file-cache-add-directory-recursively my-emacs-path)
  (message "* ---[ filecache configuration is complete ]---"))

(provide 'xy-rc-filecache)
