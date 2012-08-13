;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-13 Mon 23:46 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-kbd.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My key bindings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;* Point/frame/window operation, faster = better
(eal-define-keys-commonly
 global-map
 `(("C-c <f5>" revert-buffer)
   ("C-x <f5>" gbk-revert)
   ("M-<f10>"  menu-bar-mode)
   ("C-<f10>"  tool-bar-mode)
   ;;------------------------------------
   ;; changing font size
   ("C-+"    text-scale-increase) ;; (if (
   ("C--"    text-scale-decrease)
   ("C-0"    text-scale-normal-size)
   ("C-M-="  increase-default-font-height)
   ("C-M--"  decrease-default-font-height)
   ))


;;* Mouse

(eal-define-keys-commonly
 global-map
 `(("<S-down-mouse-1>" mouse-drag-drag)
   ("<down-mouse-1>"  mouse-drag-region)))


;;* Global keybindings for visiting some files/directory

(eal-define-keys-commonly
 global-map
 `(("C-x B" xy/emacs-build)))
   ;; ("C-x G i" open-init-dot-el-file)))

(global-set-key (kbd "C-x K") (lambda ()
                                (interactive)
                                (kill-buffer)
                                (delete-window)))

(global-set-key (kbd "S-<f4>") 'name-last-kbd-marco)
(global-set-key (kbd "C-<f4>") 'insert-kbd-marco)

(provide 'xy-rc-kbd)
