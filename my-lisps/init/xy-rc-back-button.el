;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:28 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-back-button.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `back-button.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun back-button-postload ()
  "Settings of `back-button.el' after it's been loaded."

  (setq back-button-global-backward-keystrokes '((kbd "<f2> J"))
        back-button-global-forward-keystrokes  '((kbd "<f2> L"))
        back-button-global-keystrokes          '((kbd "<f2> K"))
        back-button-local-backward-keystrokes  '((kbd "<f2> j"))
        back-button-local-forward-keystrokes   '((kbd "<f2> l"))
        back-button-local-keystrokes           '((kbd "<f2> k")))

  (message "* ---[ back-button post-load configuration is complete 
]---"))

(provide 'xy-rc-back-button)
