;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-03-01 Fri 01:41 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-rw-hunspell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `rw-hunspell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun rw-hunspell-postload ()
  "Settings of `rw-hunspell.el' after it's been loaded."
  (GNULinux
   (setq rw-hunspell-dicpath-list
         (quote
          ("/usr/share/hunspell")))
   (setq rw-hunspell-default-dictionary "en_US_hunspell"))
  (Windows
   (setq rw-hunspell-dicpath-list
         '("~/.emacs.d/bin/win32/hunspell"))
   (setq rw-hunspell-default-dictionary "en_GB_hunspell"))
  (setq rw-hunspell-make-dictionary-menu t)
  (setq rw-hunspell-use-rw-ispell t)
  (message "* ---[ rw-hunspell post-load configuration is complete ]---"))

;;;###autoload
(defun rw-ispell-postload ()
  "Settings of `rw-ispell.el' after it's been loaded."
  ;; (setq xy:personal-dict (concat my-emacs-path
  ;;                                "/ispell/personal.dict"))
  (setq rw-ispell-language-pdict-alist
    '(("emacs" . "~/Dropbox/emacs/ispell/personal.dict")))
  (setq rw-ispell-create-pdict-files t)
  (message "* ---[ rw-ispell post-load configuration is complete ]---"))

(provide 'xy-rc-rw-hunspell)
