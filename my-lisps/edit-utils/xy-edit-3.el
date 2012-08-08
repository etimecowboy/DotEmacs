;;; xy-edit-3.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2012-08-08 Wed 22:57 by xin on XIN-PC>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))


;;* 小强的“折腾Emacs“中的函数
;; REF: (@url :file-name "http://emacser.com/torture-emacs.htm" :display "Source")

;;** 添加删除注释
;; 写程序的，要经常和注释打交道，注释和反注释一段代码是家常便饭。
;; 可惜，Emacs 虽然有这个功能，默认的配置却并不好用：
;;     * 注释/反注释这两个功能默认没有绑定快捷键
;;     * 需要先选中一段区域才能调用注释功能，哪怕只想注释/反注释当前行
;;     * 好在有一个 Alt-; 的快捷键，默认绑定了
;;       comment-dwim，能注释/反注释当前激活的区域。
;;       如果没有激活区域，就在当前行末加注释
;; 其实 Alt-; 默认绑定的 comment-dwim 已经很理想了，可是，还是不够
;; dwim (Do What I Mean)。
;; 如果没有激活的区域，就注释/反注释当前行，仅当在行尾的时候才在行尾加
;; 注释
;;;###autoload
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
If no region is selected and current line is not blank and we are not
at the end of the line, then comment current line.
Replaces default behaviour of comment-dwim, when it inserts comment at
the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region
       (line-beginning-position) (line-end-position))
    (comment-dwim arg)))


;;** 复制当前行
;; 把 Alt-k 设成复制光标所在处到行尾。与 kill-line 的 Ctrl-k对应。这样
;; 一来，如果是要拷贝一整行的话，只要将光标移动到该行任意位置，按下
;; Alt-w； 如果是复制某个位置到行尾的文字的话，就把光标移到起始位置处，
;; 按 Alt-k 。
;; Smart copy, if no region active, it simply copy the current whole line
;;;###autoload
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
;;;###autoload
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line
instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))
;;;###autoload
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line
instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;; Copy line from point to the end, exclude the line break
;;;###autoload
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))


;;** 拷贝代码自动格式化
;; Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式
;; 化， 还可以选中一块代码，按 Ctrl-Alt-\ 对这块代码重新进行格式化。如
;; 果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\ ，就可以把新加入的
;; 代码格式化好。下面的代码能实现这些机械操作。你可以加入或删除一些
;; mode 名称来定制上面的配置。
;;;###autoload
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode
                     lisp-mode
                     ;; clojure-mode
                     ;; scheme-mode
                     ;; haskell-mode
                     ;; ruby-mode
                     ;; rspec-mode
                     ;; python-mode
                     sh-mode
                     c-mode
                     c++-mode
                     ;; objc-mode
                     latex-mode
                     ;; js-mode
                     vhdl-mode
                     verilog-mode
                     ;; plain-tex-mode
                     ;; org-mode
                     ))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

(provide 'xy-edit-3)
