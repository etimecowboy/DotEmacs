;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:30 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hippie-expand.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hippie-expand.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; ywb-hippie-expand-filename,
;; 补全文件名。由于 hippie-expand 主要用于补全单词，补全文件名是很困难
;; 的，所以单独写了一个命令用于补全文件名。
;;;###autoload
(defun ywb-hippie-expand-filename ()
  "自动补全文件名."
  (interactive)
  (let ((hippie-expand-try-functions-list
         '(try-complete-file-name
           try-complete-file-name-partially)))
    (call-interactively 'hippie-expand)))

;;;###autoload
(defun hippie-expand-settings ()
  "Settings for `hippie-expand'."
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
          try-expand-dabbrev-visible
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-file-name-partially
          try-complete-file-name
          try-expand-all-abbrevs
          try-expand-list
          try-expand-line
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol
          try-expand-whole-kill))

  (am-add-hooks
   `(emacs-lisp-mode-hook lisp-interaction-mode-hook)
   '(lambda ()
      (make-local-variable 'hippie-expand-try-functions-list)
      (setq hippie-expand-try-functions-list
            '(try-expand-dabbrev
              try-expand-dabbrev-visible
              try-expand-dabbrev-all-buffers
              try-expand-dabbrev-from-kill
              try-complete-file-name-partially
              try-complete-file-name
              try-expand-all-abbrevs
              try-expand-list
              try-expand-line
              try-expand-whole-kill))))

  (message "* ---[ hippie-expand configuration is complete ]---")
)

(provide 'xy-rc-hippie-expand)
