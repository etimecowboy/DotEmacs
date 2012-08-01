;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:35 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun template-settings ()
  "settings for `template'."
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

  (message "* ---[ template configuration is complete ]---")
)

(provide 'xy-rc-template)
