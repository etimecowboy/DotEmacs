;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-20 Sun 16:24 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-dim-other-buffers.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-dim-other-buffers.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun auto-dim-other-buffers-postload ()
  "Settings of `auto-dim-other-buffers.el' after it's been loaded."

  (custom-set-faces
   '(auto-dim-other-buffers-face ((t (:background "gray15")))))
 
  (message "* ---[ auto-dim-other-buffers post-load configuration is complete ]---"))

(provide 'xy-rc-auto-dim-other-buffers)
