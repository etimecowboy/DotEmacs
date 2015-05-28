;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-28 Thu 10:44 by xin on zbox.soton.ac.uk>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/elpy-start ()
  "Start elpy for Python development"
  (interactive)
  (elpy-mode 1)
  (flyspell-prog-mode)
  (autopair-mode 1)
  (turn-on-auto-fill))

;;;###autoload
(defun elpy-postload ()
  "Settings of `elpy.el' after it's been loaded."

  (setq elpy-rpc-backend "jedi"
        elpy-rpc-project-specific t)
  (elpy-use-ipython)
  (elpy-enable)
  ;; FIXME: it doesn't work
  ;; (setq elpy-mode-hook '((autopair-mode)
  ;;                        (turn-on-auto-fill)))
  
  (message "* ---[ elpy post-load configuration is complete ]---"))

(provide 'xy-rc-elpy)
