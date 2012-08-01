;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:24 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-autopair.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `autopair.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)


;;;###autoload
(defun autopair-settings ()
  "settings for `autopair'."
  (message "* ---[ autopair configuration is complete ]---"))

(provide 'xy-rc-autopair)

;; ahei's setting
;; ;; After do this, isearch any string, M-: (match-data) always return (0 3)
;; (setq autopair-extra-pairs `(:everywhere ((?` . ?'))))

;; (defun change-autopair-insert-opening ()
;;   "Change definition of `autopair-insert-opening'."
;;   (defun autopair-insert-opening-internal ()
;;     (interactive)
;;     (when (autopair-pair-p)
;;       (setq autopair-action (list 'opening (autopair-find-pair last-input-event) (point))))
;;     (autopair-fallback))

;;   (defun autopair-insert-opening ()
;;     (interactive)
;;     (if (and (fboundp 'skeleton-c-mode-left-brace)
;;              (memq major-mode modes-use-self-opening)
;;              (equal last-command-event ?{))
;;         (call-interactively 'skeleton-c-mode-left-brace)
;;       (call-interactively 'autopair-insert-opening-internal))))

;; (defvar modes-use-self-opening
;;   '(c-mode c++-mode java-mode awk-mode php-mode)
;;   "*Modes use themselves insert opening function.")

;; (eal-eval-by-modes
;;  modes-use-self-opening
;;  (lambda (mode)
;;    (change-autopair-insert-opening)))
