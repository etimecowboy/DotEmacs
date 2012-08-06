;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:27 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-imenu-tree.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `imenu-tree.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun imenu-tree-expand (tree)
  (or (widget-get tree :args)
      (let ((buf (widget-get tree :buffer))
            index)
        (setq index
              (with-current-buffer buf
                (setq imenu--index-alist nil)
                (let ((imenu-create-index-function 'imenu-default-create-index-function))
                  (imenu--make-index-alist t))
                (delq nil imenu--index-alist)))
        (mapcar
         (lambda (item)
           (imenu-tree-item item buf "function"))
         index))))


;;;###autoload
(defun imenu-tree-postload ()
  "Settings for `imenu-tree' after it's been loaded."
  ;; (add-hook 'imenu-tree 'imenu-tree-expand)
  (setq imenu-tree-auto-update t)
  (message "* ---[ imenu-tree post-load configuration is complete ]---"))

(provide 'xy-rc-imenu-tree)
