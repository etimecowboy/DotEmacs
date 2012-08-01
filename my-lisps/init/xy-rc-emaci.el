;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:06 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emaci.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emaci.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun switch-major-mode-with-emaci ()
  "Run `switch-major-mode' with `emaci-mode'."
  (interactive)
  (let ((emaci emaci-mode))
    (call-interactively 'switch-major-mode)
    (emaci-mode (if emaci 1 -1))))

;;;###autoload
(defun xy/read-only ()
  "Read-only mode."
  (interactive)
  (emaci-mode-on)
  (view-mode t))

;;;###autoload
(defun xy/normal-edit ()
  "Normal edit mode."
  (interactive)
  (View-quit)
  (emaci-mode-off))

;;;###autoload
(defun emaci-settings ()
  "settings for `emaci'."
  (setq emaci-brief-key-defs
        (append emaci-brief-key-defs
                `(("]" goto-paren))))
  (emaci-bind-brief-keys)
  (message "* ---[ emaci configuration is complete ]---"))

(provide 'xy-rc-emaci)

;; ;;;###autoload
;; (defun emacs-lisp-mode-settings-4-emaci ()
;;   "`emacs-lisp-mode' settings for `emaci'."
;;   (defvar lisp-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode) "*Lisp modes.")
;;   (emaci-add-key-definition
;;    "." 'find-symbol-at-point
;;    '(memq major-mode lisp-modes))
;;   (emaci-add-key-definition
;;    "," 'find-symbol-go-back
;;    '(memq major-mode lisp-modes)))

;; (eal-define-keys
;;  'emaci-mode-map
;;  `(("." emaci-.)
;;    ("," emaci-\,)))

;; (eval-after-load "emaci"
;;   '(progn
;;     (emacs-lisp-mode-settings-4-emaci)))
