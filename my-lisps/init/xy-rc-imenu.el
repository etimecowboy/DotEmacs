;;   -*- Mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:27 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-imenu.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `imenu.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))

;; REF: (@url :file-name "http://www.emacswiki.org/emacs/ImenuMode" :display "emacswiki")
;;;###autoload
(defun imenu-postload ()
  "Settings for `imenu' after it's been loaded."
  (try-require 'imenu+)

  (defvar text-imenu-generic-expression
    `((nil ,"^ \\{0,4\\}\\([一二三四五六七八九十]+[、. )]\\)+ *[^,。，]+?$" 0)
      (nil ,"^ \\{0,4\\}\\([0-9]+[、. )]\\)+ *[^,。，]+?$" 0)))
  (add-hook 'text-mode-hook
            (lambda ()
              ;; (make-local-variable imenu-generic-expression)
              (setq imenu-generic-expression
                    text-imenu-generic-expression)))
              ;; (imenu-add-menubar-index)))

  (defvar mail-imenu-generic-expression
        '(("Subject"  "^Subject: *\\(.*\\)" 1)
          ("Cc"     "^C[Cc]: *\\(.*\\)" 1)
          ("To"     "^To: *\\(.*\\)" 1)
          ("From"  "^From: *\\(.*\\)" 1)))
  (add-hook 'mail-mode-hook
            (lambda ()
              ;; (make-local-variable imenu-generic-expression)
              (setq imenu-generic-expression
                    mail-imenu-generic-expression)))

  (defvar sql-imenu-generic-expression
        '(("Comments" "^-- \\(.+\\)" 1)
          ("Function Definitions" "^\\s-*\\(function\\|procedure\\)[ \n\t]+\\([a-z0-9_]+\\)\
 [ \n\t]*([a-z0-9 _,\n\t]*)[ \n\t]*\\(return[ \n\t]+[a-z0-9_]+[ \n\t]+\\)?[ai]s\\b" 2)
          ("Function Prototypes" "^\\s-*\\(function\\|procedure\\)[ \n\t]+\\([a-z0-9_]+\\)\
 [ \n\t]*([a-z0-9 _,\n\t]*)[ \n\t]*\\(return[ \n\t]+[a-z0-9_]+[ \n\t]*\\)?;" 2)
          ("Indexes" "^\\s-*create\\s-+index\\s-+\\(\\w+\\)" 1)
          ("Tables" "^\\s-*create\\s-+table\\s-+\\(\\w+\\)" 1)))
  (add-hook 'sql-mode-hook
            (lambda ()
              ;; (make-local-variable imenu-generic-expression)
              (setq imenu-generic-expression
                    sql-imenu-generic-expression)))

  (message "* ---[ imenu post-load configuration is complete ]---"))

(provide 'xy-rc-imenu)
