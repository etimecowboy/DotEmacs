;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-03 Sun 22:44 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-shell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `shell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; Use this command to clear the shell buffer:
;;;###autoload
(defun clear-shell ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;;;###autoload
(defun shell-postload ()
  "Settings for `term' after it's been loaded."

  (require 'ansi-color) ;; Use ansi-color in shell and eshell mode
  ;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; (require 'shell-completion) ;; Press tab for completions
  ;; Add command of `shell-command', `shell-command-on-region',
  ;; `compile', `grep', and `background' to shell history file

  (require 'shell-history)

  ;; SHELL = %your_emacs_path%\bin\cmdproxy.exe
  (Windows ;; NOTE: not necessary for recent versions of Emacs
   ;; (setenv SHELL "cmdproxy.exe")
   (setq shell-file-name "cmdproxy.exe"))

  ;; `shell-command.el'
  (when (try-require 'shell-command)
    (shell-command-completion-mode t))

  ;; `bash-completion.el'
  (when (try-require 'bash-completion)
    (bash-completion-setup))

  ;; `shell-here.el'
  (try-require 'shell-here)

  (message "* ---[ shell-mode post-load configuration is complete ]---"))

(provide 'xy-rc-shell)
