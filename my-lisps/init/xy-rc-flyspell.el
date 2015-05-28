;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-28 Thu 10:38 by xin on zbox.soton.ac.uk>
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

(eval-when-compile (require 'cl))
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
(defun flyspell-postload ()
  "Settings of `flyspell.el' after it's been loaded."
  (setq flyspell-delay 0.5)
  (setq flyspell-issue-welcome-flag nil)
  ;; 令flyspell按照相近程度补齐
  (setq flyspell-sort-corrections t)
  ;; (add-hook 'flyspell-incorrect-hook 'my-flyspell-ignore-uppercase)
  (message "* ---[ flyspell post-load configuration is complete ]---"))

(provide 'xy-rc-flyspell)
