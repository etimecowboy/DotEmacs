;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:22 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-verilog.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `verilog.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;;###autoload
(defun verilog-mode-settings ()
  "settings for `verilog-mode'."

  (setq verilog-mode-hook 'verilog-set-compile-command linum-mode)

  ;; (autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
  ;; (setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode)
  ;;                               auto-mode-alist))
  ;; (setq auto-mode-alist (cons '("\\.dv\\'" . verilog-mode)
  ;;                               auto-mode-alist))
  ;; (setq auto-mode-alist (cons '("\\.sv\\'" . verilog-mode)
  ;;                               auto-mode-alist))

  (setq verilog-align-ifelse             t
        verilog-auto-arg-sort            t
        verilog-indent-level             3
        verilog-indent-level-module      3
        verilog-indent-level-declaration 3
        verilog-indent-level-behavioral  3
        verilog-indent-level-directive   1
        verilog-case-indent              2
        verilog-auto-newline             t
        verilog-auto-indent-on-newline   t
        verilog-tab-always-indent        t
        verilog-auto-endcomments         t
        verilog-minimum-comment-distance 40
        verilog-indent-begin-after-if    t
        verilog-auto-lineup              'all)

  (message "* ---[ verilog-mode configuration is complete ]---"))

(provide 'xy-rc-verilog)
