;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-11 Sat 10:36 by xin on p5q>
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
 `(;; `fit-frame.el'
   ;; ("S-<f5>" fit-frame)
   ;;-----------------------------------
   ;; `maxframe.el'
   ;; ("M-<f5>" maximize-frame)
   ;; ("M-S-<f5>" restore-frame)
   ;;------------------------------------
   ;; `windresize.el'
   ;; ("C-<f5>" windresize)
   ;;------------------------------------
   ;; `windmove.el'
   ;; ("C-S-<left>" windmove-left)
   ;; ("C-S-<right>" windmove-right)
   ;; ("C-S-<up>" windmove-up)
   ;; ("C-S-<down>" windmove-down)
   ;;----------------------------------
   ;; `window-number.el'
   ;; ("M-<f5>"  window-number-meta-mode)
   ;;----------------------------------
   ;; `buffer-move.el'
   ;; ("M-S-<up>"    buf-move-up)
   ;; ("M-S-<down>"  buf-move-down)
   ;; ("M-S-<left>"  buf-move-left)
   ;; ("M-S-<right>" buf-move-right)
   ;;----------------------------------
   ;; `thumb-frm.el'
   ;; (define-key special-event-map [iconify-frame]
   ;;             'thumfr-thumbify-frame-upon-event)
   ;; (global-set-key [(shift mouse-3)]
   ;;                 'thumfr-toggle-thumbnail-frame)
   ;; (global-set-key [(shift control mouse-3)]
   ;;                 'thumfr-thumbify-other-frames)
   ;; ("C-M-z" thumfr-thumbify-other-frames)
   ;; ("C-S-p" thumfr-fisheye-previous-frame)
   ;; ("C-S-n" thumfr-fisheye-next-frame)
   ;; ("C-S-z" thumfr-toggle-thumbnail-frame)
            ;;'thumfr-really-iconify-or-deiconify-frame)
   ;;------------------------------------
   ("C-c <f5>" revert-buffer)
   ("C-x <f5>" gbk-revert)
   ("M-<f10>"  menu-bar-mode) ;; (if (>= emacs-major-version 23)
   ("C-<f10>"  tool-bar-mode) ;; (if (>= emacs-major-version 23)
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
