;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-27 Thu 00:05 by xin on vmdebian.xyang.com>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-company.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `company.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun company-postload ()
  "Settings of `company' after it's been loaded."

  (setq company-backends '(company-bbdb company-nxml company-css
                   company-semantic company-clang company-cmake
                   company-capf (company-dabbrev-code company-gtags
                   company-etags company-keywords) company-files
                   company-dabbrev) company-yasnippet)
  
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3
        company-tooltip-align-annotations t)

  ;; (setq company-begin-commands '(self-insert-command))
  ;; (define-key company-mode-map
  ;;   (kbd "M-RET") 'company-expand-top)

  ;; official backends
  ;; company-yasnippet
  ;; (require 'company-yasnippet)
  
  ;; third-party backends
  ;; company-c-headers
  (when (try-require 'company-c-headers)
    (add-to-list 'company-backends 'company-c-headers))

  ;; company-auctex
  (when (try-require 'company-auctex)
    (company-auctex-init))

  ;; company-anaconda
  (try-require 'company-anacoda)

  (message "* ---[ company post-load configuration is complete ]---"))

(provide 'xy-rc-company)
