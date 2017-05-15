;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-05-15 星期一 11:01 by xin on xinud>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-elpy.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `elpy.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun xy/elpy-start ()
  "Start elpy for Python development"
  (interactive)
  ;; (require 'elpy)
  ;; (require 'py-autopep8)
  ;; (when (try-require 'py-autopep8)
  ;;   (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
  (elpy-enable)
  (elpy-use-ipython)
  (flyspell-prog-mode 1)
  (autopair-mode 1)
  (turn-on-auto-fill))

;;;###autoload
(defun elpy-postload ()
  "Settings of `elpy.el' after it's been loaded."

  ;; Try defaults: 20170515
  ;; ;; use flycheck not flymake with elpy
  ;; (when (require 'flycheck nil t)
  ;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

  ;; (require 'py-autopep8)
  ;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  
  ;; (setq elpy-rpc-backend "jedi"
  ;;       elpy-rpc-project-specific t)

  ;; ;; (elpy-enable)
  ;; ;; (elpy-use-ipython)

  ;; ;; FIXME: it doesn't work
  ;; ;; (setq elpy-mode-hook '((autopair-mode)
  ;; ;;                        (turn-on-auto-fill)))

  
  (message "* ---[ elpy post-load configuration is complete ]---"))

(provide 'xy-rc-elpy)
