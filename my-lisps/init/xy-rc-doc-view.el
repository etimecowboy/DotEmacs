;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-07-10 Fri 12:00 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-doc-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `doc-view' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun doc-view-postload ()
  "Settings for `doc-view' after it's been loaded."

  (setq doc-view-conversion-refresh-interval 3
        doc-view-continuous t
        doc-view-image-width 680
        doc-view-resolution 100)

  ;; REF: (@url :file-name "http://www.idryman.org/blog/2013/05/20/emacs-and-pdf/" :display "Blog post: \"Emacs and PDF\"")
  ;; Navigate the pages while your cursor is in another window
  (fset 'doc-prev "\C-xo\C-x[\C-xo")
  (fset 'doc-next "\C-xo\C-x]\C-xo")
  ;; (global-set-key (kbd "M-[") 'doc-prev)
  ;; (global-set-key (kbd "M-]") 'doc-next)
  
  (message "* ---[ doc-view post-load configuration is complete ]---"))

(provide 'xy-rc-doc-view)
