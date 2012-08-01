;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:38 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-whizzytex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `whizzytex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun whizzytex-copy-sty ()
  "Copy the file `whizzytex.sty' file to the current directory."
  (interactive)
  (copy-file "~/.emacs.d/lisps/whizzytex/src/whizzytex.sty" "./" t)
  (message "whizzytex.sty copied."))

;;;###autoload
(defun xy/whizzytex-start ()
  "Start whizzytex."
  (interactive)
  (GNULinux
   (require 'whizzytex)
   (whizzytex-mode 1)
   (menu-bar-mode 1)
   (message "Writing your tex files in WYSIWYG environment!"))
  (Windows
   (message "Sorry, whizzytex cannot be used in Windows!")))

;;;###autoload
(defun whizzytex-settings ()
  "Settings of `whizzytex.el'."
  (message "* ---[ whizzytex configuration is complete ]---"))

(provide 'xy-rc-whizzytex)
