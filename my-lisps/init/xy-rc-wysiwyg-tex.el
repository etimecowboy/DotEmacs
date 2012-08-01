;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:38 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-wysiwyg-tex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `wysiwyg-tex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun wysiwyg-tex-settings ()
  "Settings of `wysiwyg-tex.el'."
  (setq wysiwyg-tex-tex2dvi-command "latex"
        wysiwyg-tex-dvi2ps-command "dvips"
        wysiwyg-tex-using-color-package t
        wysiwyg-tex-typeset-3-times t
        wysiwyg-tex-doc-view-fit-preview 1)
  (message "* ---[ wysiwyg-tex configuration is complete ]---"))

(provide 'xy-rc-wysiwyg-tex)
