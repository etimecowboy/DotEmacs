;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:55 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-tramp.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `tramp' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; REF: (@url :file-name "http://nflath.com/2009/08/tramp/" :display "Post")
;;;### autoload
;; (defun sudo-edit (&optional arg)
;;   "Prompt for a filename and then open that file as sudo."
;;   (interactive "p")
;;   (if arg
;;       (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
;;     (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
;;;###autoload
(defun sudo-edit-current-file ()
  "Open the current file as sudo without prompting"
  (interactive)
  (require 'tramp)
  (find-alternate-file (concat "/sudo:root@localhost:" (buffer-file-name (current-buffer)))))

;;;###autoload
(defun tramp-preload ()
  "Settings of `tramp' before it's been loaded."

  (setq-default tramp-persistency-file-name
                (concat my-var-path "/tramp-"
                        user-login-name "-"
                        system-name "-"
                        system-configuration))
  ;; (unless (file-exists-p tramp-persistency-file-name)
  ;;   (shell-command (concat "touch " tramp-persistency-file-name)))
  ;; (setq tramp-backup-directory-alist '(("." . "~/.emacs-backup")))

  (message "* ---[ tramp post-load configuration is complete ]---"))

;;;###autoload
(defun tramp-postload ()
  "Settings of `tramp' after it's been loaded."

  (GNULinux
   (setq tramp-default-method "pscp"))

  ;; REF: (@url :file-name "http://www.jeremyenglish.org/docs/tramp_ntmacs.pdf" :display "PDF file")
  ;; REF: readme.org and startup.org in (@url :file-name "https://github.com/mlf176f2/EmacsPortable.App/" :display "EmacsProtable.app")
  (Windows
   (when (and (executable-find "plink.exe"))
     (setq tramp-default-method "plink.exe")))

  (setq tramp-verbose 10)
  (setq tramp-chunksize 500)

  (message "* ---[ tramp post-load configuration is complete ]---"))

(provide 'xy-rc-tramp)
