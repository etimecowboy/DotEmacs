;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:29 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-help.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `help-mode' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun goto-help-buffer ()
  "Goto *Help* buffer."
  (interactive)
  (let ((buffer (get-buffer "*Help*")))
    (if buffer
        (switch-to-buffer buffer)
      (message "*Help* buffer dose not exist!"))))

;;;###autoload
(defun help-mode-settings ()
  "settings of `help-mode'."
  (def-turn-on "view-mode" nil)
  (am-add-hooks 'help-mode-hook 'view-mode-off)
  (message "* ---[ help configuration is complete ]---")
)

;; ;;;###autoload
;; (defun help-mode-face-settings ()
;;   "Face settings for `help-mode'."
;;   (unless is-before-emacs-21
;;     (set-face-foreground 'help-argument-name "green")))

(provide 'xy-rc-help)
