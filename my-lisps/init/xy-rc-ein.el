;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-08-28 Mon 10:26 by xin on xinud>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ein.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ein.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun ein-postload ()
  "Settings of `ein' after it's been loaded."

  (require 'ein-connect)
  (require 'ein-org)
  (require 'ob-ein)
  ;; (require 'ein-company)  ;; current company backend doesn't support Jedi
 
  (setq ein:complete-on-dot t
        ein:completion-backend (quote ein:use-ac-jedi-backend)
        ein:use-auto-complete-superpack t
        ein:jupyter-default-notebook-directory "~/work/jupyter"
        ein:jupyter-default-server-command "/usr/local/bin/jupyter"
        ein:jupyter-server-args (quote ("--no-browser"))
        ein:notebook-autosave-frequency 120
        ein:notebook-create-checkpoint-on-save t
        ein:use-auto-complete nil
        ein:use-auto-complete-superpack nil
        ein:worksheet-enable-undo (quote yes)
        ein:worksheet-show-slide-data t
        ein:use-smartrep nil
        ;; ein:helm-kernel-history-search-key t ;; FIXME: cause error
        )

  ;; NOTE: `smartrep' is a heavy package which influence the whole emacs
  ;; (when (try-require 'smartrep)
  ;;   (setq ein:use-smartrep t))
  
  (message "* ---[ ein post-load configuration is complete ]---"))

(provide 'xy-rc-ein)
