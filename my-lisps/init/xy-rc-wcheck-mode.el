;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:54 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-wcheck-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `wcheck-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun wcheck-mode-postload ()
  "Settings of `wcheck-mode.el' after it's been loaded."
  (setq ispell-really-hunspell t)
  (setq  wcheck-timer-idle .1)
  (setq-default
   wcheck-language "en_GB"
   wcheck-language-data
   '(("en_GB"
      (program . "~/.emacs.d/bin/win32/hunspell/hunspell.exe")
      (args . ("-l" "-d" "en_GB_hunspell"))
      (action-program . "~/.emacs.d/bin/win32/hunspell/hunspell.exe")
      (action-args "-a" "-d" "en_GB_hunspell")
      (action-parser . wcheck-parser-ispell-suggestions))

     ;; ("Danish"
     ;;  (program . "/usr/bin/enchant")
     ;;  (args . ("-l" "-d" "da_DK"))
     ;;  (suggestion-program . "/usr/bin/hunspell")
     ;;  (suggestion-args . ( "-t" "-m" "-a" "-d" "da_DK" "-i"
     ;;                       "utf-8"))
     ;;  (suggestion-parser
     ;;   . wcheck-parse-suggestions-ispell))
     ;; ("German"
     ;;  (program . "/usr/bin/enchant")
     ;;  (args . ("-l" "-d" "da_DK"))
     ;;  (suggestion-program . "/usr/bin/hunspell")
     ;;  (suggestion-args . ( "-t" "-m" "-a" "-d" "de_DE" "-i"
     ;;                       "utf-8"))
     ;;  (suggestion-parser
     ;;   . wcheck-parse-suggestions-ispell))
     ))

  ;; toggle between Danish and English easily

  ;; (defun wcheck-set-danish ()
  ;;   "switch wcheck language to English"
  ;;   (interactive)
  ;;   (wcheck-change-language "Danish"))

  ;; (defun wcheck-set-english ()
  ;;   "switch ispell language to English"
  ;;   (interactive)
  ;;   (wcheck-change-language "English"))

  ;; (defvar toggle-wcheck-english-danish t
  ;;   "state of english/danish toggle. nil means English, t means Danish")

  ;; (make-variable-buffer-local 'toggle-ispell-english-danish)

  ;; (defun wcheck-toggle-language ()
  ;;   "Toggle ispell-language between English and Danish"
  ;;   (interactive)
  ;;   (if (eq toggle-wcheck-english-danish t)
  ;;       (progn
  ;;                                       ;       (set (make-local-variable 'foo) "value")
  ;;         (set (make-local-variable 'toggle-wcheck-english-danish) nil)
  ;;         (wcheck-set-danish)
  ;;         (message "wcheck set to Danish"))
  ;;     (progn
  ;;       (set (make-local-variable 'toggle-wcheck-english-danish) t)
  ;;       (wcheck-set-english)
  ;;       (message "wcheck set to English"))))

  ;; keys
  ;; (define-key global-map [f5] 'wcheck-mode)
  ;; (define-key global-map [S-f5] 'wcheck-toggle-language)
  ;; (global-set-key "\M-n" 'wcheck-spelling-suggestions)
  (message "* ---[ wcheck-mode post-load configuration is complete ]---"))

(provide 'xy-rc-wcheck-mode)
