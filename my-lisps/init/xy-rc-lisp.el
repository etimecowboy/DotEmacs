;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:28 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-lisp.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `lisp.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun lisp-mode-postload ()
  "Settings for `lisp-interaction-mode' after it's been loaded."
  ;; (am-add-hooks
  ;;  ;; `(lisp-mode-hook lisp-interaction-mode-hook)
  ;;  `(lisp-mode-hook)
  ;;  '(lambda ()
  ;;     ;; BUG: lisp-interaction-mode error
  ;;     ;; Debugger entered--Lisp error: (error "Invalid function:
  ;;     ;; (progn (turn-on-auto-fill) (turn-on-eldoc-mode))")
  ;;     ;; signal(error ("Invalid function: (progn (turn-on-auto-fill)
  ;;     ;; (turn-on-eldoc-mode))"))
  ;;     ;; error("%s" "Invalid function: (progn (turn-on-auto-fill)
  ;;     ;; (turn-on-eldoc-mode))")
  ;;     ;; byte-code("\302!\210\303\304\305    !\"\207" [icicle-orig-buff
  ;;     ;; act-on-choice icicle-try-switch-buffer error "%s"
  ;;     ;; error-message-string] 4)

  ;;     ;; NOTE: try to avoid icicle
  ;;     ;; icicle-execute-extended-command()
  ;;     ;; call-interactively(icicle-execute-extended-command nil nil)
  ;;     ;; (turn-on-auto-fill)
  ;;     ;; (turn-on-eldoc-mode)
  ;;     ;; (turn-on-hungry-delete-mode)

  (message "* ---[ lisp-mode post-load configuration is complete ]---"))

;;;###autoload
(defun emacs-lisp-mode-postload ()
  "Settings for `emacs-lisp-mode' after it's been loaded."
  ;; Add menu item for emacs-lisp mode
  ;; NOTE: can use `font-lock-mode-hook' to add Imenu Index for any
  ;; mode that supports Imenu.
  ;; (add-to-list emacs-lisp-mode-hook 'imenu-add-menubar-index)

  ;; (add-hook 'emacs-lisp-mode-hook
  ;;             '(lambda ()
  ;;              ;; (xy/set-font-default)
  ;;              (elisp-mode-hook-settings)
  ;;              ;; (turn-on-auto-fill)
  ;;              ;; (turn-on-eldoc-mode)
  ;;              ;; (turn-on-hungry-delete-mode)
  ;;              ;; (xy/yas-start)
  ;;              ;; (xy/linkd-start)))

  (message "* ---[ emacs-lisp-mode post-load configuration is complete ]---"))

(provide 'xy-rc-lisp)
