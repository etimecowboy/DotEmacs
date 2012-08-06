;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-04 Sat 16:39 by xin on p5q>
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

;;====================================================================
;;* F-keys


;;====================================================================
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

;;====================================================================
;;* Mouse

(eal-define-keys-commonly
 global-map
 `(("<S-down-mouse-1>" mouse-drag-drag)
   ("<down-mouse-1>"  mouse-drag-region)))

;;====================================================================
;;* Edit shortcuts

(eal-define-keys-commonly
 global-map
 `(
   ;;    ("M-k" kill-whole-paragraph)
   ;;    ("M-C-k" kill-paragraph)
   ;;    ("M-C" copy-whole-paragraph)
   ;;    ("C-x c" copy-whole-buffer)
   ;;    ("C-x C" kill-whole-buffer)
   ;;    ("M-W" which-copy)
   ;;    ("M-w" smart-copy)
   ;;    ("C-x M-w" insert-cur-line)
   ;;    ("C-x M-W" insert-cur-sexp)
   ("C-M-w"               copy-sentence)
   ;;    ;; 删除整行
   ;;    ("M-K" kill-line)
   ;;    ("C-k" smart-kill)
   ;;    ("C-\\" delete-indentation)
   ;; ("C-x M-m"             mark-invisible-region)
   ("M-U"                 del-to-begin)
   ("C-^"                 case-trans)
   ;;    ("C-6" case-trans)
   ("C-w"                 backward-kill-word-or-kill-region)
   ;;    ("C-x S" mark-whole-sexp)
   ;;    ("C-x W" kill-whole-sexp)
   ;;    ("C-x w" copy-sexp)
   ("M-d"                 my-kill-word)
   ;;    ("C-x TAB" indent-whole-buffer)
   ;;    ("C-h" c-electric-backspace-kill)
   ;;    ("M-m" beginning-of-line-text)
   ("C-M-\\"              smart-indent)
   ("M-q"                 fill-paragraph)
   ("<escape> SPC"        just-one-space)
   ("C-a"                 smart-home)
   ("C-M-a"               mark-whole-buffer)
   ("C-k"                 kill-and-join-forward)
   ("C-M-6"               jlh-join-lines)
   ("C-]"                 goto-paren)
   ("C-M-]"               ywb-indent-accoding-to-paren)
   ("C-c F f"             iy-go-to-char)
   ("C-c F b"             iy-go-to-char-backward)
   ("M-,"                 recent-jump-small-backward)
   ("M-."                 recent-jump-small-forward)
   ("C-x M-s"             isearch-forward-cur-word)
   ("C-'"                 wcy-mark-some-thing-at-point)
   ("C-x \\"              rm-mark-command)
   ;; ("M-w"                 copy-region)
   ("M-|"                 ywb-hippie-expand-filename)
   ("C-x M-M"             switch-major-mode)
   ("M-;"                 qiang-comment-dwim-line)
   ("M-k"                 qiang-copy-line)
   ;; Meteor Liu's functions
   ("C-S-n"               move-line-down)
   ("C-S-p"               move-line-up)
   ("C-c C-x f"           format-region)
   ("C-c C-x F"           format-cxx-file)
   ("C-x M-l"             mark-current-line)
   ))

;;====================================================================
;;* Global keybindings for visiting some files/directory

(eal-define-keys-commonly
 global-map
 `(("C-x B" xy/emacs-build)))
   ;; ("C-x G i" open-init-dot-el-file)))

(global-set-key (kbd "C-x K") (lambda ()
                                (interactive)
                                (kill-buffer)
                                (delete-window)))

(provide 'xy-rc-kbd)
