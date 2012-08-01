;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:37 by xin on XIN-PC>
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

(require 'cl)
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
  (find-alternate-file (concat "/sudo:root@localhost:" (buffer-file-name (current-buffer)))))

;;;###autoload
(defun tramp-settings ()
  "Settings of `tramp'."
  ;; (require 'tramp)
  (setq tramp-default-method "pscp")
  (setq tramp-verbose 10)
  (setq tramp-chunksize 500)
  (setq-default tramp-persistency-file-name
                (concat my-var-path "/tramp-"
                        user-login-name "@"
                        system-name "@"
                        system-configuration))
  (unless (file-exists-p tramp-persistency-file-name)
    (shell-command (concat "touch " tramp-persistency-file-name)))
  (setq tramp-backup-directory-alist '(("." . "~/.emacs-backup")))

  (message "* ---[ tramp configuration is complete ]---")
)

(provide 'xy-rc-tramp)
