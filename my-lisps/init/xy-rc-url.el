;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:56 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;;;###autoload
(defun url-postload ()
  "Settings of `url.el' after it's been loaded."
  (setq-default url-configuration-directory
                (concat my-var-path "/url"))
  (setq url-privacy-level 'high)

  ;; ;; Set proxy server
  ;; (setq url-using-proxy t)
  ;; (setq url-proxy-services '(("no_proxy" . "work\\.com")
  ;;                            ("http" . "proxy.work.com:911")))

  ;; NOTE: Suggested in http://melpa.milkbox.net/#known-issues for
  ;;       melpa ELPA repo.
  (setq url-http-attempt-keepalives nil)

  (message "* ---[ url post-load configuration is complete ]---"))

(provide 'xy-rc-url)
