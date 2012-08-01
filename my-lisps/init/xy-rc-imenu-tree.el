;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:30 by xin on XIN-PC>
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

(require 'cl)
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
(defun imenu-tree-settings ()
  "Settings for `imenu-tree'."
  ;; (add-hook 'imenu-tree 'imenu-tree-expand)
  (setq imenu-tree-auto-update t)
  (message "* ---[ imenu-tree configuration is complete ]---")
)

(provide 'xy-rc-imenu-tree)
