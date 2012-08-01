;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:31 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ispell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ispell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ispell-settings ()
  "Settings of `ispell.el'."

  (GNULinux
   (setq ispell-program-name "aspell")
   (setq-default ispell-dictionary "british")
   (ispell-change-dictionary "british" t)
   (ispell-change-dictionary "english" t)
   ;; ispell-alternate-dictionary "/usr/share/dict/words"
   ;; ispell-complete-word-dict "/usr/share/dict/words"))
   )

  (Windows
   (setq ispell-program-name "hunspell.exe")
   (setq-default ispell-dictionary "en_GB_hunspell"))

  (setq ispell-choices-win-default-height 2
        ispell-check-comments t
        ispell-following-word t
        ispell-keep-choices-win nil
        ispell-help-in-bufferp t
        ispell-local-dictionary nil
        ispell-personal-dictionary "~/emacs/ispell/personal.dict"
        ispell-query-replace-choices t
        ispell-silently-savep t
        ispell-skip-html (quote use-mode-name)
        ispell-skip-tib t
        ispell-use-framepop-p nil)

  (message "* ---[ ispell configuration is complete ]---"))

(provide 'xy-rc-ispell)
