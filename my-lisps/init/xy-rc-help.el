;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:20 by xin on p5q>
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

(eval-when-compile (require 'cl))
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
(defun help-mode-postload ()
  "Settings of `help-mode' after it's been loaded."
  ;; (def-turn-on "view-mode" nil)
  ;; (am-add-hooks 'help-mode-hook 'view-mode-off)
  (message "* ---[ help post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun help-mode-face-settings ()
;;   "Face settings for `help-mode'."
;;   (unless is-before-emacs-21
;;     (set-face-foreground 'help-argument-name "green")))

(provide 'xy-rc-help)
