;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-05 Tue 10:11 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-c-moccur.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-c-moccur.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun helm-c-moccur-postload ()
  "Settings of `helm-c-moccur.el' after it's been loaded."

  ;; TODO: make it work
  ;; (add-hook 'dired-mode-hook
  ;;              (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
  ;;           '(lambda ()

  (setq helm-c-moccur-enable-auto-look-flag t
        helm-c-moccur-helm-idle-delay t
        helm-c-moccur-higligt-info-line-flag t
        helm-c-moccur-preselect-current-line t)

  (setq helm-idle-delay 1)
  
  (message "* ---[ helm-c-moccur post-load configuration is complete ]---"))


(provide 'xy-rc-helm-c-moccur)
