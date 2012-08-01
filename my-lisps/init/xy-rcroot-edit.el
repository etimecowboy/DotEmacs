;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-28 Sat 17:58 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-edit.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My assistant editing tools and settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;====================================================================
;;* Some basic edting settings

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;; 不用TAB字符来缩进，使用空格
(setq default-tab-width 4)
(setq tab-width 4)
(loop for x downfrom 50 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))
(setq-default indent-tabs-mode nil)
;; tab补全的模式
(setq-default tab-always-indent t)

;;--------------------------------------------------------------------
;;** ethan-wspace
;; REF: (@url :file-name "https://github.com/glasserc/ethan-wspace" :display "Source")
(autoload 'ethan-wspace-mode "ethan-wspace" nil t)
;; (autoload 'global-ethan-wspace-mode "ethan-wspace" nil t)
;; (require 'ethan-wspace)
;; (global-ethan-wspace-mode 1) ;BUG: conflict with `yasnippet' snippet mode
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  c-common-mode-hook sh-mode-hook matlab-mode-hook
                  vhdl-mode-hook verilog-mode-hook
                  org-mode-hook LaTeX-mode-hook)
 '(lambda () (ethan-wspace-mode 1)))
(global-set-key (kbd "<f6> W") 'ethan-wspace-mode)

;;--------------------------------------------------------------------
;;** ws-trim
;; automatically trims whitespace on edited lines. With a low
;; `ws-trim-level' it is complementary to `ethan-wspace', and may be
;; useful to encourage you to delete whitespace organically. Hopefully
;; ethan-wspace will grow similar functionality soon.
;; (require 'ws-trim)
;; (gloabl-ws-trim-mode 1) ;NOTE: too agressive
(global-set-key (kbd "<f7> W") 'ws-trim-buffer)

;;====================================================================
;;* Fast point move

;;** recent-jump
;; 返回到最近去过的地方
;; (require 'recent-jump)
;; (require 'recent-jump-small)
;; (setq rj-mode-line-format nil)
;; (setq rjs-mode-line-format nil)
;;(recent-jump-mode 1)
(recent-jump-small-mode 1)
;; (eal-define-keys-commonly
;;  global-map
;;  `(;; ("M-,"   recent-jump-backward)
;;    ;; ("M-."   recent-jump-forward)
;;    ;; ("C-x M-," recent-jump-small-backward)
;;    ;; ("C-x M-." recent-jump-small-forward)))
;;    ("M-,"   recent-jump-small-backward)
;;    ("M-."   recent-jump-small-forward)))

;;--------------------------------------------------------------------
;;** dot-mode
;; 模拟vi的点(.)命令
;; (try-require 'dot-mode)
;; (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;; (global-set-key [(control ?.)]
;;                 (lambda ()
;;                   (interactive) (dot-mode 1)
;;                   (message "Dot mode activated.")))

;;--------------------------------------------------------------------
;;** Incremental search
(eval-after-load "isearch"
  '(progn
     ;; (isearch-face-settings)
     (isearch-settings)
     (eal-define-keys
      'isearch-mode-map
      `(("M-i" isearch-query-replace-current)
        ("M-k" isearch-clean)
        ("M-g" isearch-cancel)
        ("M-u" isearch-toggle-word)
        ("M-y" isearch-yank-line)
        ("C-y" isearch-yank-kill)
        ("M-h" isearch-del-char)
        ;; ("M-H" ,(if is-after-emacs-23 isearch-help-map
        ;;           'isearch-mode-help))
        ("C-o" isearch-occur)  ;; Activate occur easily inside isearch
        ("M-Z" zap-to-isearch)
        ("C-<return>" isearch-exit-other-end)
        ))))
(global-set-key (kbd "C-x M-s") 'isearch-forward-cur-word)

;;====================================================================
;;** ace-jump-mode
;; ace-jump-mode is an fast/direct cursor location minor mode.
;; (try-require 'ace-jump-mode)
(define-key global-map (kbd "C-c j") 'ace-jump-mode)
;; NOTE:
;;      - "C-c j"         ==> ace-jump-word-mode
;;      - "C-u C-c j"     ==> ace-jump-char-mode
;;      - "C-u C-u C-c j" ==> ace-jump-line-mode

;;--------------------------------------------------------------------
;;** my own replace face
;; (eval-after-load "replace" '(replace-settings))

;;====================================================================
;;* Fast select regions

(transient-mark-mode 1)
(delete-selection-mode 1)
(apply-args-list-to-fun
 'def-remember-command
 `("previous-line" "next-line"
   "am-forward-word-or-to-word" "forward-word" "backward-word"
   "forward-char" "backward-char"))
;; (define-key-list
;;   global-map
;;   `(("C-n"     next-line-remember)
;;     ("C-p"     previous-line-remember)
;;     ("C-f"     forward-char-remember)
;;     ("C-b"     backward-char-remember)
;;     ("M-f"     am-forward-word-or-to-word-remember)
;;     ("M-b"     backward-word-remember)
;;     ("M-F"     forward-word-remember)
;;     ("C-x C-n" mark-and-next-line)
;;     ("C-x C-p" mark-and-previous-line)
;;     ("C-x M->" mark-and-end-of-buffer)
;;     ("C-x M-<" mark-and-beginning-of-buffer)))
;; (if window-system
;;     (define-key global-map (kbd "C-2") 'set-mark-command))
;; (define-key global-map (kbd "C-x M-l") 'wcy-mark-some-thing-at-point)

;;--------------------------------------------------------------------
;;** 矩形区域操作
;; (eal-define-keys-commonly
;;   global-map
;;   `(("C-x \\"  rm-mark-command)
;;     ("M-w"      copy-region)
;;     ))
(am-def-active-fun rm-mark-active rm-mark-active)

;;--------------------------------------------------------------------
;;** CUA model settings
;; CUA的矩阵区域操作特别方便
;; (setq use-cua t)
;; (eval-after-load "cua-base" '(cua-settings))

;;--------------------------------------------------------------------

;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-|"      ywb-hippie-expand-filename)
;;    ("C-x M-M"  switch-major-mode)
;;    ("M-;"      qiang-comment-dwim-line)
;;    ("M-k"      qiang-copy-line)
;;    ))

;;====================================================================
;;* Graphic text tools

;;** table
;; 可以“所见即所得”的编辑一个文本模式的表格
;; (if is-before-emacs-21 (require 'table "table-for-21"))

;;--------------------------------------------------------------------
;;** artist
;; 非常强大的文本画图的工具
(global-set-kbd "C-x A d" 'artist-mode)
(eval-after-load "artist"
  '(progn
     (artist-settings)
     (eal-define-keys
      'artist-mode-map
      `(("C-c l"   artist-select-op-line)
        ("C-c r"   artist-select-op-rectangle)
        ("C-c M-c" artist-select-op-copy-rectangle)
        ("C-c M-w" artist-select-op-cut-rectangle)
        ("C-c M-p" artist-select-op-paste)))))

;;--------------------------------------------------------------------
;;** palette
;; provides a general color palette that you can use to
;; examine color properties or choose colors.
;; Emacs配色的超级武器：Icicles，Color Palette和DoReMi
;; REF: (@url :file-name "http://emacser.com/icicles-doremi-palette.htm" :display "emacser")

(provide 'xy-rcroot-edit)
