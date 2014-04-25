;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-04-19 Sat 22:39 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-smex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `smex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; NOTE: NEVER use both icy-mode and ido/smex. They are different in the
;;way of using minibuffer, and conflicts with each other.
;;;###autoload
(defun xy/smex-start ()
  "Start ido completion."
  (interactive)
  (when (featurep 'icicles)
    (icy-mode -1))
  (require 'smex)
  (smex-initialize))

;;;###autoload
(defun smex-postload ()
  "Settings of `smex.el' after it's been loaded."

  (setq-default smex-save-file
                (concat my-var-path "/smex-save-"
                        user-login-name "@"
                        system-name "@"
                        system-configuration))
                ;; (concat my-var-path "/smex-save"))
  (unless (file-exists-p smex-save-file)
    (shell-command (concat "touch " smex-save-file)))
  (setq smex-history-length 100)

  (defun smex-update-after-load (unused)
    (when (boundp 'smex-cache)
      (smex-update)))
  (add-hook 'after-load-functions 'smex-update-after-load)

  (message "* ---[ smex post-load configuration is complete ]---"))

(provide 'xy-rc-smex)
