;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-01-22 Thu 22:50 by xin on UOS208326.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mic-paren.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mic-paren.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun mic-paren-postload ()
  "Settings for `mic-paren' after it's been loaded."
  ;; (paren-activate)
  (setq paren-message-show-linenumber 'absolute)
  (add-hook 'LaTeX-mode-hook
            (function (lambda ()
                        (paren-toggle-matching-quoted-paren 1)
                        (paren-toggle-matching-paired-delimiter 1))))  
  (add-hook 'c-mode-common-hook
            (function (lambda ()
                        (paren-toggle-open-paren-context 1))))
  
  (message "* ---[ mic-paren post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun mic-paren-face-settings ()
;;   "Face settings for `mic-paren'."
;;   (set-face-background 'paren-face-match "magenta")
;;   (set-face-foreground 'paren-face-match "yellow")
;;   (set-face-background 'paren-face-mismatch "red"))

(provide 'xy-rc-mic-paren)
