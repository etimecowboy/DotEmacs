;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:29 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-o-blog.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `o-blog.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/browse-my-emacs-blog ()
  "Open the my Emacs blog using `browse-url'."
  (interactive)
  (browse-url
   (concat "file://"
           (expand-file-name
            "~/emacs/org/html/myblogs/oblog-emacs/index.html"))))

;;;###autoload
(defun o-blog-postload ()
  "Settings of `o-blog.el' after it's been loaded."
  (message "* ---[ o-blog post-load configuration is complete ]---"))

(provide 'xy-rc-o-blog)
