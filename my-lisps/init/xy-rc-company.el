;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-05-05 Fri 16:45 by xin on xinud>
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
(require 'xy-rc-utils)

;;;###autoload
(defun company-postload ()
  "Settings of `company' after it's been loaded."

  ;; (setq company-backends '(company-bbdb company-nxml company-css
  ;;                  company-semantic company-clang company-cmake
  ;;                  company-capf (company-dabbrev-code company-gtags
  ;;                  company-etags company-keywords) company-files
  ;;                  company-dabbrev) company-yasnippet)
  
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 4
        company-tooltip-align-annotations t
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)

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
  ;; (try-require 'company-anacoda)

  ;; company-flx
  ;; (with-eval-after-load 'company
  ;;   (company-flx-mode +1))
  (when (try-require 'company-flx)
    (company-flx-mode 1))

  ;; company-quickhelp
  (when (try-require 'company-quickhelp)
    (company-quickhelp-mode 1))

  ;; company-try-hard
  ;; (when (try-require 'company-try-hard)
  ;;   (global-set-key (kbd "") 'company-try-hard)
  ;;   (define-key company-active-map (kbd "") 'company-try-hard)
  ;;   )

  ;; company-math
  (when (try-require 'company-math)
    (add-to-list 'company-backends
                 '(company-latex-commands company-math-symbols-latex
                                          company-math-symbols-unicode)))
  ;; company-shell
  (when (try-require 'company-shell)
    (add-to-list 'company-backends 'company-shell))

  ;; company-tern
  (when (try-require 'company-shell)
    (add-to-list 'company-backends 'company-tern))

  ;; company-jedi
  (when (try-require 'company-jedi)
    (add-to-list 'company-backends 'comapy-jedi)
    (setq jedi:complete-on-dot t)
    )
  
  (message "* ---[ company post-load configuration is complete ]---"))

(provide 'xy-rc-company)
