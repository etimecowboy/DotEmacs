;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:54 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-template.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `template.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun template-postload ()
  "Settings for `template' after it's been loaded."
  (setq template-default-directories
        (list (concat my-emacs-path "/template/templates")))

  (defvar last-template nil "Last used template file")
  (defun my-template-expand-template (template)
    "Expand template file"
    (interactive
     (list
      (read-file-name
       (if last-template
           (format "Please select template file (default is %s): "
                   last-template) "Please select template file: ")
       (concat my-emacs-path "/template/templates") last-template t)))
    (template-expand-template template)
    (setq last-template template))

  (message "* ---[ template post-load configuration is complete ]---"))

(provide 'xy-rc-template)
