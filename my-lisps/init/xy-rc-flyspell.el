;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:29 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-flyspell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `flyspell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun my-flyspell-ignore-uppercase (beg end &rest rest)
  (while (and (< beg end)
          (let ((c (char-after beg)))
        (not (= c (downcase c)))))
    (setq beg (1+ beg)))
  (= beg end))

;;TODO: try hunspell instead of aspell
;;;###autoload
(defun flyspell-settings ()
  "settings of `flyspell.el'."
  (setq flyspell-delay 1)
  (setq flyspell-issue-welcome-flag nil)
  ;; 令flyspell按照相近程度补齐
  (setq flyspell-sort-corrections nil)
  ;; (add-hook 'flyspell-incorrect-hook 'my-flyspell-ignore-uppercase)
  (message "* ---[ flyspell configuration is complete ]---"))

(provide 'xy-rc-flyspell)
