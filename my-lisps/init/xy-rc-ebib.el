;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-13 Thu 23:59 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ebib.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ebib.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun ebib-postload ()
  "Settings of `ebib.el' after it's been loaded."

  (setq ebib-autogenerate-keys t)
  (setq ebib-bib-search-dirs '("~" "."))
  (setq ebib-bibtex-extensions '(".bib" ".bibtex" ".BIB" ".BIBTEX"))
  (setq ebib-create-backups t)

  (message "* ---[ ebib post-load configuration is complete ]---"))

(provide 'xy-rc-ebib)
