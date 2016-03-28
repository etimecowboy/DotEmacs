;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:31 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eim.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eim.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun eim-postload ()
  "Settings for ei after it's been loaded."
  (setq eim-use-tooltip nil) ;; 显示效果不好，老是闪烁
  ;; (register-input-method
  ;;  "eim-wb" "utf-8" 'eim-use-package "eim-wb" "eim-wb" "wb.txt")
  (register-input-method
   "eim-py" "utf-8"
   'eim-use-package "eim-py" "eim-py" (concat my-emacs-path "/eim/py.txt"))
  (setq default-input-method "eim-py")
  ;; (setq input-activate nil)
  ;; (add-hook 'find-file-hook
  ;;           (lambda ()(if (eq input-activate t)
  ;;                       (toggle-input-method))))
  (message "* ---[ eim post-load configuration is complete ]---"))

(provide 'xy-rc-eim)
