;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:37 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-url.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `url.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun url-settings ()
  "Settings of `url.el'."
  (setq-default url-configuration-directory
                (concat my-var-path "/url"))
  (setq url-privacy-level (quote high))
  ;; (setq url-proxy-services '(("no_proxy" . "work\\.com")
  ;;                            ("http" . "proxy.work.com:911")))
  ;; NOTE: Suggested in http://melpa.milkbox.net/#known-issues for
  ;;       melpa ELPA repo.
  (setq url-http-attempt-keepalives nil)
  (message "* ---[ url configuration is complete ]---"))

(provide 'xy-rc-url)
