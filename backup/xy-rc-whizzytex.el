;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:55 by xin on p5q>
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

(eval-when-compile (require 'cl))
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
(defun whizzytex-postload ()
  "Settings of `whizzytex.el' after it's been loaded."
  (message "* ---[ whizzytex post-load configuration is complete ]---"))

(provide 'xy-rc-whizzytex)
