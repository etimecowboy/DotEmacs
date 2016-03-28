;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:49 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;;; Some basic edting settings

;; Emacs找不到合适的模式时，缺省使用text-mode
;; (setq default-major-mode 'text-mode) ;;  obsolete variable
(setq-default major-mode 'text-mode)

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;; 不用TAB字符来缩进，使用空格
;; (setq default-tab-width 4) ;;  obsolete variable
(setq-default tab-width 4)
(loop for x downfrom 50 to 1 do
      (setq tab-stop-list (cons (* x tab-width) tab-stop-list)))
(setq-default indent-tabs-mode nil)
;; tab补全的模式
(setq-default tab-always-indent t)

;;;; no-easy-keys
;; be a Emacser!
;; NOTE: may cause problem in some modes, such as org-mode
;; (when (try-require 'no-easy-keys)
;;   (no-easy-keys 1))


;;;; ethan-wspace
;; REF: (@url :file-name "https://github.com/glasserc/ethan-wspace" :display "Source")
;; (autoload 'global-ethan-wspace-mode "ethan-wspace" nil t)
;; (when (try-require 'ethan-wspace)
;;   (global-ethan-wspace-mode 1))
;
;; NOTE: seems no conflict now.
;; fix conflict with `yasnippet' snippet mode
;; (am-add-hooks
;;  `(snippet-mode)
;;  '(lambda () (ethan-wspace-mode -1)))
(global-set-key (kbd "<f6> W") 'ethan-wspace-mode)



;;;; ws-trim
;; automatically trims whitespace on edited lines. With a low
;; `ws-trim-level' it is complementary to `ethan-wspace', and may be
;; useful to encourage you to delete whitespace organically. Hopefully
;; ethan-wspace will grow similar functionality soon.
;; (require 'ws-trim)
;; (gloabl-ws-trim-mode 1) ;NOTE: too agressive
(global-set-key (kbd "<f7> W") 'ws-trim-buffer)



;;; Fast point move

;; NOTE: use back-button instead
;; ;;;; recent-jump
;; ;; 返回到最近去过的地方
;; ;; (require 'recent-jump)
;; ;; (require 'recent-jump-small)
;; ;; (setq rj-mode-line-format nil)
;; ;; (setq rjs-mode-line-format nil)
;; ;; (recent-jump-mode 1)
;; (when (try-require 'recent-jump-small)
;;   (progn
;;     (recent-jump-small-mode 1)
;;     (eal-define-keys-commonly
;;      global-map
;;      `(;; ("M-,"   recent-jump-backward)
;;        ;; ("M-."   recent-jump-forward)
;;        ("M-,"   recent-jump-small-backward)
;;        ("M-."   recent-jump-small-forward)
;;        ))))

;; ;;;; visible-mark
;; (when (try-require 'visible-mark)
;;   (setq visible-mark-max 10)
;;   (global-visible-mark-mode 1))
;; ;; color
;; '(visible-mark-face ((t (:box (:line-width 2 :color "red" :style released-button))))))

;;;; back-button
;; Default key bindings:
;;
;;     C-x C-<SPC>    go back in `global-mark-ring', respects prefix arg
;;     C-x C-<left>   go back in `global-mark-ring'
;;     C-x C-<right>  go forward in `global-mark-ring'
;;
;;     C-x <SPC>      go back in (buffer-local) `mark-ring', respects prefix arg
;;     C-x <left>     go back in (buffer-local) `mark-ring'
;;     C-x <right>    go forward in (buffer-local) `mark-ring'
(when (try-require 'back-button)
  (back-button-mode 1))

;;;; nav-flash
(when (try-require 'nav-flash)
  (setq nav-flash-use-pulse 'gui-only))



;;;; dot-mode
;; 模拟vi的点(.)命令
;; (try-require 'dot-mode)
;; (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;; (global-set-key [(control ?.)]
;;                 (lambda ()
;;                   (interactive) (dot-mode 1)
;;                   (message "Dot mode activated.")))



;;;; incremental search
(eval-after-load "isearch"
  '(progn
     ;; (isearch-face-settings)
     (isearch-postload)
     (eal-define-keys
      'isearch-mode-map
      `(;; ("M-i" isearch-query-replace-current) ;; not work
        ("M-k" isearch-clean)
        ("M-g" isearch-cancel)
        ("M-u" isearch-toggle-word)
        ("M-y" isearch-yank-line)
        ("C-y" isearch-yank-kill)
        ("M-h" isearch-del-char)
        ;; ("M-S-h" ,(if is-after-emacs-23 isearch-help-map
        ;;           'isearch-mode-help))
        ("C-o" isearch-occur)  ;; Activate occur easily inside isearch
        ("M-S-z" zap-to-isearch)
        ("C-<return>" isearch-exit-other-end)
        ))))
(global-set-key (kbd "C-c C-s") 'isearch-forward-cur-word)



;;;; ace-jump-mode
;; ace-jump-mode is an fast/direct cursor location minor mode.
(when (try-require 'ace-jump-mode)
    (global-set-key (kbd "C-c C-j") 'ace-jump-mode)
    (define-key isearch-mode-map (kbd "C-j") 'sl-isearch-ace-jump))
;; NOTE: For my key binding
;;      - "M-s"         ==> ace-jump-word-mode
;;      - "C-u M-s"     ==> ace-jump-char-mode
;;      - "C-u C-u M-s" ==> ace-jump-line-mode
;;      - tricks to use ac e-jump
;;        1) C-s ----- normal isearch
;;        2) <f11> ----- use ace-jump-mode to locate your point



;;;; my own replace face
;; (eval-after-load "replace" '(replace-postload))



;;; Fast select regions

(transient-mark-mode 1)   ;; Reqired when using org-mode
(delete-selection-mode 1)
;; (apply-args-list-to-fun
;;  'def-remember-command
;;  `("previous-line" "next-line"
;;    "am-forward-word-or-to-word" "forward-word" "backward-word"
;;    "forward-char" "backward-char"))
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



;;;; rectangular operations
;; (eal-define-keys-commonly
;;   global-map
;;   `(("C-x \\"  rm-mark-command)
;;     ("M-w"      copy-region)
;;     ))
;; (am-def-active-fun rm-mark-active rm-mark-active)

(eval-after-load "rect-mark" '(rect-mark-postload))
(try-require 'rect-mark)


;;;; cua-mode
;; CUA的矩阵区域操作特别方便
;; (setq use-cua t)
(eval-after-load "cua-base" '(cua-postload))




;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-|"      ywb-hippie-expand-filename)
;;    ("C-x M-M"  switch-major-mode)
;;    ("M-;"      qiang-comment-dwim-line)
;;    ("M-k"      qiang-copy-line)
;;    ))



;;;; multiple-cursor
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;; Graphic text tools

;;;; table
;; 可以“所见即所得”的编辑一个文本模式的表格
;; (if is-before-emacs-21 (require 'table "table-for-21"))



;;;; artist
;; 非常强大的文本画图的工具
;; (global-set-key (kbd "C-x A d") 'artist-mode)
(eval-after-load "artist"
  '(progn
     (artist-postload)
     (eal-define-keys
      'artist-mode-map
      `(("C-c l"   artist-select-op-line)
        ("C-c r"   artist-select-op-rectangle)
        ("C-c M-c" artist-select-op-copy-rectangle)
        ("C-c M-w" artist-select-op-cut-rectangle)
        ("C-c M-p" artist-select-op-paste)))))



;;;; palette
;; provides a general color palette that you can use to
;; examine color properties or choose colors.
;; Emacs配色的超级武器：Icicles，Color Palette和DoReMi
;; REF: (@url :file-name "http://emacser.com/icicles-doremi-palette.htm" :display "emacser")



;;; Global key bindings

;; (global-set-key (kbd "M-;") 'qiang-comment-dwim-line)

(eal-define-keys-commonly
 global-map
 `(("C-x <f5>" revert-buffer)
   ("C-c <f5>" gbk-revert)
   ;; ("C-x C-m"  execute-extended-command)
   ;; ("C-c C-m"  execute-extended-command)
   ("C-w"      backward-kill-word-or-kill-region)
   ("M-w"      smart-copy)
   ;; ("M-w"      copy-region)
   ;; ("M-W"      which-copy)
   ("C-S-d"    backward-delete-char)
   ("M-d"      my-kill-word)
   ;; ("C-k"      smart-kill)
   ;; ("M-k"      kill-sentence)
   ;; ("C-M-6"    jlh-join-lines)
   ("C-x %"    goto-paren) ;; NOTE: C-[ is Esc
   ;; ("C-c ]"    goto-paren) ;; NOTE: C-] is `abort-recursive-edit'
   ;; ("C-M-]"    ywb-indent-accoding-to-paren)
   ;; ("C-c F f"  iy-go-to-char) ;; use `ace-jump'
   ;; ("C-c F b"  iy-go-to-char-backward)
   ("C-^"      case-trans)
   ("C-@"      mark-command)
   ("C-<SPC>"  mark-command)
   ("C-x \\"   rm-mark-command)
   ;; ("C-s"      isearch-forward-cur-word)
   ("M-@"      wcy-mark-some-thing-at-point)
   ("M-;"      qiang-comment-dwim-line)
   ;; ("M-K"      qiang-copy-line)
   ("C-S-p"    move-line-up)  ;; NOTE: cannot use "C-P"
   ("C-S-n"    move-line-down);; NOTE: cannot use "C-N"
   ;; ("C-M-f"    format-cxx-file)
   ;; ("C-*"      insert-prior-line-char)
   ("C-<f4>"   name-last-kbd-marco)
   ("S-<f4>"   insert-kbd-marco)
   ))



;;; Global keybindings for visiting some files/directory

;; ("C-x G i" open-init-dot-el-file)))

(global-set-key (kbd "C-x K") (lambda ()
                                (interactive)
                                (kill-buffer)
                                (delete-window)))


(provide 'xy-rcroot-edit)
