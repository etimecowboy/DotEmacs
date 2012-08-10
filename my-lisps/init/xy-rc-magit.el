;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-10 Fri 23:23 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun magit-postload ()
  "Settings of `magit' after it's been loaded."

  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))
  ;; NOTE: current version of `magit' don't need this patch
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/Magit#toc3" :display "emacswiki")
  ;; Tramp under windows
  ;; Had to change magit-escape-for-shell To make it work on windows.
  (defun magit-escape-for-shell (str)
    (if (or (string= str "git")
            (string-match "^--" str))
        str
      (concat "'" (replace-regexp-in-string "'" "'\\''" str) "'")))

  (message "* ---[ magit post-load configuration is complete ]---"))

(provide 'xy-rc-magit)
