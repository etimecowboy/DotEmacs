;;; xy-edit-1.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 27 Nov 2011
;; Time-stamp: <2012-08-11 Sat 10:26 by xin on p5q>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 23.2

;;; Commentary:

;; Collected various functions to assist edting.

;;; Code:

(eval-when-compile (require 'cl))


;;* ahei 的函数
;; REF: (@url :file-name "http://code.google.com/p/dea/" :display "Source")

;; Use `undo-tree.el' instead
;; ;;;###autoload
;; (defmacro def-redo-command (fun-name redo undo)
;;   "Make redo command."
;;   `(defun ,fun-name ()
;;      (interactive)
;;      (if (equal last-command ,redo)
;;          (setq last-command 'undo)
;;        (setq last-command nil))
;;      (call-interactively ,undo)
;;      (setq this-command ,redo)))
;; (def-redo-command redo 'redo 'undo)


;;;###autoload
(defmacro def-action-on-area-command (fun-name action mark-area doc)
  `(defun ,fun-name ()
     ,doc
     (interactive)
     (save-excursion
       (funcall ,mark-area)
       (call-interactively ,action))))


;;;###autoload
(defun backward-kill-word-or-kill-region ()
  "`mark-active'时, 剪切选择的区域, 平时向后删除word, 和bash下面一样."
  (interactive)
  (if (rm-mark-active)
      (call-interactively 'rm-kill-region)
    (if mark-active
        ;; (if cua--rectangle
        ;;     (progn
        ;;       (cua-cut-rectangle t)
        ;;       (cua-cancel))
        (call-interactively 'kill-region);;)
      (call-interactively 'backward-kill-word))))


;; ;;;###autoload
;; (defun mark-whole-sexp (&optional not-whole)
;;   "Mark whole sexp.

;; If NOT-WHOLE is non-nil, do not mark whole sexp."
;;   (interactive "P")
;;   (if not-whole
;;       (mark-sexp)
;;     (let ((region (bounds-of-thing-at-point 'sexp)))
;;       (if (not region)
;;           (message "Can not found sexp.")
;;         (goto-char (car region))
;;         (call-interactively 'set-mark-command)
;;         (forward-sexp)))))


;; ;;;###autoload
;; (defun kill-whole-sexp (&optional not-whole)
;;   "Kill whole sexp.
;; If NOT-WHOLE is non-nil, do not kill whole sexp."
;;   (interactive)
;;   (mark-whole-sexp not-whole)
;;   (backward-kill-word-or-kill-region))


;; ;;;###autoload
;; (defun copy-sexp (&optional not-whole)
;;   "Copy whole sexp.
;; If NOT-WHOLE is non-nil, do not copy whole sexp."
;;   (interactive)
;;   (save-excursion
;;     (mark-whole-sexp not-whole)
;;     (if mark-active
;;         (copy-region (region-beginning) (region-end)))))


;;;###autoload
(defun my-kill-word ()
  "删除一个单词, 当光标处于单词中间时也删除整个单词, 这是与`kill-word'
的区别"
  (interactive)
  (wcy-mark-some-thing-at-point)
  (backward-kill-word-or-kill-region))


;;;###autoload
(defun mark-function ()
  "Mark a lisp/c/c++ function."
  (interactive)
  (cond
   ((or (equal major-mode 'c-mode) (equal major-mode 'c++-mode))
    (c-mark-function))
   ((or (equal major-mode 'emacs-lisp-mode)
        (equal major-mode 'lisp-mode)
        (equal major-mode 'lisp-interaction-mode))
    (lisp-mark-function))))


;;;###autoload
(defmacro def-action-on-function-command (fun-name action action-str)
  `(defun ,fun-name ()
     ,(concat (capitalize action-str) " function.")
     (interactive)
     (save-excursion
       (mark-function)
       (call-interactively ,action))))


;;;###autoload
(defun comment-function (&optional arg)
  "Comment function."
  (interactive "P")
  (save-excursion
    (mark-function)
    (comment-region (region-beginning) (region-end) arg)))


;; ;;;###autoload
;; (defun kill-whole-paragraph (&optional arg)
;;   "Kill whole paragraph."
;;   (interactive "P")
;;   (if arg
;;       (kill-paragraph nil)
;;     (call-interactively 'mark-paragraph)
;;     (call-interactively 'kill-region)))


;; ;;;###autoload
;; (defun copy-whole-paragraph (&optional arg)
;;   "Copy whole paragraph."
;;   (interactive "P")
;;   (save-excursion
;;     (if arg
;;         (progn
;;           (mark-command t)
;;           (forward-paragraph))
;;       (call-interactively 'mark-paragraph))
;;     (call-interactively 'copy-region)))


;; ;;;###autoload
;; (defun copy-cur-line ()
;;   "拷贝当前行"
;;   (interactive)
;;   (let ((end (min (point-max) (1+ (line-end-position)))))
;;     (copy-region-as-kill-nomark (line-beginning-position) end)))


;; ;;;###autoload
;; (defun copy-lines (&optional number)
;;   "从当前行开始拷贝NUMBER行"
;;   (interactive "p")
;;   (if (null number)
;;       (copy-cur-line)
;;     (let ((lineNo))
;;       (save-excursion
;;         (if (< number 0)
;;             (next-line))
;;         (setq lineNo (line-number-at-pos nil))
;;         (move-beginning-of-line nil)
;;         (set-mark-command nil)
;;         (goto-line (+ number lineNo))
;;         (call-interactively 'copy-region-as-kill-nomark)))))


;; ;;;###autoload
;; (defun copy-line-left ()
;;   "拷贝当前行光标后面的文字"
;;   (interactive)
;;   (copy-region-as-kill-nomark
;;    (point) (min (1+ (line-end-position)) (point-max))))


;; ;;;###autoload
;; (defun smart-copy ()
;;   "智能拷贝, 如果`mark-active'的话, 则`copy-region', 否则`copy-lines'"
;;   (interactive)
;;   (if mark-active
;;       (call-interactively 'copy-region)
;;     (call-interactively 'copy-lines)))


;; ;;;###autoload
;; (defun copy-region-and-paste ()
;;   "拷贝region并且粘贴到region后"
;;   (interactive)
;;   (call-interactively 'copy-region)
;;   (call-interactively 'yank))


;; ;;;###autoload
;; (defun which-copy ()
;;   "如果`mark-active'的话, 则`copy-region-and-paste', 否则
;; `copy-line-left'"
;;   (interactive)
;;   (if mark-active (copy-region-and-paste) (copy-line-left)))


;; ;;;###autoload
;; (defun insert-cur-line ()
;;   "拷贝当前行并粘贴进当前buffer"
;;   (interactive)
;;   (copy-cur-line)
;;   (forward-line)
;;   (beginning-of-line)
;;   (call-interactively 'yank)
;;   (previous-line)
;;   (end-of-line))


;; ;;;###autoload
;; (defun insert-cur-sexp ()
;;   "拷贝当前sexp并粘贴进当前buffer"
;;   (interactive)
;;   (copy-sexp)
;;   (call-interactively 'yank))


;;;###autoload
(defun copy-sentence ()
  "拷贝sentence"
  (interactive)
  (save-excursion
    (call-interactively 'mark-end-of-sentence)
    (call-interactively 'copy-region-as-kill-nomark)))


;; 删除当前光标到行首的字符
;;;###autoload
(defun del-to-begin (&optional arg)
  "Delete characters to line beginning."
  (interactive "P")
  (if (not arg)
      (kill-line 0)
    (copy-region-as-kill-nomark
     (1+ (line-beginning-position)) (point))))


;;;###autoload
(defun lisp-mark-function (&optional allow-extend)
  "`mark-defun'有时候会多mark一个空白行, 这个函数就是解决这个bug的"
  (interactive "p")
  (mark-defun allow-extend)
  (let (next-is-fun)
    (save-excursion
      (forward-line) (setq next-is-fun (looking-at "[ \t]*(defun")))
    (if (or (looking-at "$")
            (and next-is-fun (not (looking-at "[ \t]*(defun"))))
        (forward-line))))


;;;###autoload
(defun case-trans ()
  "大小写转换当前字符"
  (interactive)
  (let* ((ochar (char-after (point))) (char ochar))
    (if (and (>= char ?a) (<= char ?z))
        (setq char (upcase char))
      (setq char (downcase char)))
    (if (/= ochar char)
        (save-excursion
          (delete-char 1)
          (insert-char char 1)))))


;; ;;;###autoload
;; (defun comment (&optional arg)
;;   "如果`mark-active'的话,就`comment-region',否则注释光标所在行"
;;   (interactive "P")
;;   (if mark-active
;;       (comment-region (region-beginning) (region-end) arg)
;;     (let (fun)
;;       (if arg (setq fun 'uncomment-region) (setq fun 'comment-region))
;;       (funcall fun (line-beginning-position) (line-end-position)))))


;; ;;;###autoload
;; (defun uncomment (&optional arg)
;;   "如果`mark-active'的话,就`uncomment-region',否则取消注释光标所在行"
;;   (interactive "P")
;;   (comment (not arg)))


;; ;;;###autoload
;; (defun mark-invisible-region ()
;;   "Mark invisible region."
;;   (interactive)
;;   (if (not (and last-region-beg last-region-end))
;;       (message "No previous region.")
;;     (goto-char last-region-beg)
;;     (if last-region-is-rect
;;         (if last-region-use-cua
;;             (call-interactively 'cua-set-rectangle-mark)
;;           (call-interactively 'rm-set-mark))
;;       (call-interactively 'set-mark-command))
;;     (goto-char last-region-end)
;;     (if (and last-region-is-rect last-region-use-cua)
;;         (cua--activate-rectangle))))


;;;###autoload
(defun c-electric-backspace-kill ()
  "If `mark-active', run `kill-region', otherwise run
`c-electric-backspace'."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'c-electric-backspace)))


;; ;;;###autoload
;; (defun delete-blank-lines-region (beg end)
;;   "Execute `delete-blank-lines' in region."
;;   (interactive "*r")
;;   (save-excursion
;;     (goto-char beg)
;;     (let ((blank-line "^\\s-*$")
;;           (nonblank-line "^.*\\S-.*$")
;;           blank-beg blank-end)
;;       (while (and (< (point) end)
;;                   (setq blank-beg
;;                         (search-forward-regexp blank-line end t)))
;;         (save-excursion
;;           (setq blank-end
;;                 (search-forward-regexp nonblank-line end t)))
;;         (if blank-end
;;             (setq end (- end (- blank-end blank-beg)))
;;           (setq end 0))
;;         (previous-line)
;;         (delete-blank-lines)))))


;; ;;;###autoload
;; (defun smart-delete-blank-lines (&optional no-region)
;;   "Smart `delete-blank-lines'.
;; If NO-REGION is non-nil, always execute `delete-blank-lines',
;; otherwise, if `mark-active', execute `delete-blank-lines-region',
;; and execute `delete-blank-lines' if there no mark."
;;   (interactive "P")
;;   (if (or no-region (not mark-active))
;;       (delete-blank-lines)
;;     (call-interactively 'delete-blank-lines-region)))


;;;###autoload
(defun smart-home (&optional home)
  "Goto home.
If HOME is negative, call `beginning-of-line-text',
otherwise call `move-beginning-of-line'."
  (interactive "P")
  (if (not home)
      (let ((old (point)))
        (beginning-of-line-text)
        (if (= (point) old)
            (move-beginning-of-line 1)))
    (if (< (prefix-numeric-value home) 0)
        (beginning-of-line-text)
      (move-beginning-of-line 1))))


;; ;;;###autoload
;; (defun smart-kill ()
;;   "If `mark-active', call `kill-region', otherwise call
;; `kill-whole-line'."
;;   (interactive)
;;   (if mark-active
;;       (call-interactively 'kill-region)
;;     (call-interactively 'kill-whole-line)))


;;;###autoload
(defun smart-indent ()
  "If `mark-active', call `indent-region', otherwise indent all buffer."
  (interactive)
  (save-excursion
    (unless mark-active
      (call-interactively 'mark-whole-buffer))
    (call-interactively 'indent-region)))


;;;###autoload
(defun fill-paragraph-justify (region)
  "Run `fill-paragraph' with argument justify t."
  (interactive (list t))
  (fill-paragraph 'full region))


;; ;;;###autoload
;; (defun count-brf-lines (&optional is-fun)
;;   "显示当前buffer或region或函数的行数和字符数"
;;   (interactive "P")
;;   (let (min max)
;;     (if is-fun
;;         (save-excursion
;;           (beginning-of-defun) (setq min (point))
;;           (end-of-defun) (setq max (point))
;;           (message "当前函数%s内共有%d行, %d个字符"
;;                    (which-function) (count-lines min max) (- max min)))
;;       (if mark-active
;;           (progn
;;             (setq min (min (point) (mark)))
;;             (setq max (max (point) (mark))))
;;         (setq min (point-min))
;;         (setq max (point-max)))
;;       (if (or (= 1 (point-min)) mark-active)
;;           (if mark-active
;;               (message "当前region内共有%d行, %d个字符"
;;                        (count-lines min max) (- max min))
;;             (message "当前buffer内共有%d行, %d个字符"
;;                      (count-lines min max) (- max min)))
;;         (let ((nmin min) (nmax max))
;;           (save-excursion
;;             (save-restriction
;;               (widen)
;;               (setq min (point-min))
;;               (setq max (point-max))))
;;           (message "narrow下buffer内共有%d行, %d个字符, 非narrow下buffer内共有%d行, %d个字符"
;;                    (count-lines nmin nmax) (- nmax nmin) (count-lines min max) (- max min)))))))
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x l" count-brf-lines)
;;    ("C-x L" (lambda () (interactive) (count-brf-lines t)))))


;;;###autoload
(defun switch-to-scratch ()
  "切换到*scratch*"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))
;; (global-set-key (kbd "C-x s") 'switch-to-scratch)


;;;###autoload
(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "P")
  (let ((file (buffer-name)))
    (if full
        (setq file (expand-file-name file)))
    (kill-new file)
    (message "File `%s' copied." file)))
;; (eal-define-keys-commonly
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map
;;    sh-mode-map c-mode-base-map text-mode-map
;;    ruby-mode-map html-mode-map python-mode-map
;;    java-mode-map conf-javaprop-mode-map conf-space-mode-map)
;;  `(("C-c M-C" copy-file-name)))


;; 关于mark的一些设置，使你非常方便的选择region
;;;###autoload
(defun mark-command (&optional no-record)
  "如果是CUA mode, 则执行`cua-set-mark', 否则执行`set-mark-command'.
if NO-RECORD is non-nil, do not record last-region."
  (interactive)
  (unless no-record
    (setq last-region-beg (point))
    (setq last-region-is-rect nil))
  (let ((command (if cua-mode 'cua-set-mark 'set-mark-command)))
    (if (interactive-p)
        (call-interactively command)
      (funcall command))))

;;;###autoload
(defmacro def-mark-move-command (command)
  "Make definition of command which first `mark-command' and then move."
  `(defun ,(am-intern "mark-and-" command) ()
     ,(concat "If no `mark-active', then `mark-command'. After do
that, execute `" command "'.")
     (interactive)
     (if (not mark-active) (call-interactively 'mark-command))
     (call-interactively (intern ,command))
     (setq last-region-end (point))))

(apply-args-list-to-fun
 'def-mark-move-command
 `("next-line" "previous-line" "end-of-buffer" "beginning-of-buffer"))

;;;###autoload
(defmacro def-remember-command (command)
  "Make definition of command which remember `point'."
  `(defun ,(am-intern command "-remember") ()
     ,(concat "When `" command "' remember `point'.")
     (interactive)
     (call-interactively (intern ,command))
     (if mark-active
         (setq last-region-end (point)))))

;;;###autoload
(defun wcy-mark-some-thing-at-point()
  "这个功能就是根据光标的所在位置，智能的选择一块区域，也就
是设置成为当前的point和mark。这样就可以方便的拷贝或者剪切，
或者交换他们的位置。

如果当前光标在一个单词上，那么区域就是这个单词的开始和结尾分别。
如果当前光标在一个连字符上，那么就选择包含连字符的一个标识符。
这两个的是有区别的，而且根据不同的mode的语法定义，连字符和单词
的定义也不一样。

例如C mode下，abc_def_xxx, 如果光标停在abc上，那么就会选择abc
这个单词。如果停在下划线上，那么就会选择abc_def_xxx。如果当前
光标在一个双引号,单引号，一个花括号，方括号，圆括号，小于号，
或者大于号等等，那么就会选择他们对应的另一个括号之间的区域。
引号中的escape字符也是可以自动识别的。嵌套关系也是可以识别的。
这一点可以和VIM中的%的功能类比。"

  (interactive)
  (let* ((from (point))
         (a (mouse-start-end from from 1))
         (start (car a))
         (end (cadr a))
         (goto-point (if (= from start) end start)))
    (if (eq last-command 'wcy-mark-some-thing-at-point)
        (progn
          ;; exchange mark and point
          (goto-char (mark-marker))
          (set-marker (mark-marker) from))
      (push-mark (if (= goto-point start) end start) nil t)
      (when (and (interactive-p) (null transient-mark-mode))
        (goto-char (mark-marker))
        (sit-for 0 500 nil))
      (goto-char goto-point))))


;; 矩形区域操作
;;;###autoload
(defun rm-mark-command ()
  "如果是CUA mode, 则执行`cua-set-rectangle-mark',
否则执行`rm-set-mark'"
  (interactive)
  (setq last-region-beg (point))
  (setq last-region-is-rect t)
  (setq last-region-use-cua cua-mode)
  (if cua-mode
      (call-interactively 'cua-set-rectangle-mark)
    (try-require 'rect-mark)
    (call-interactively 'rm-set-mark)))

;; ;;;###autoload
;; (defun copy-region (beg end)
;;   "根据`mark-active'和`rm-mark-active'来决定是执行
;; `copy-region-as-kill-nomark'还是`rm-kill-ring-save'"

;;   (interactive "r")
;;   (if cua-mode
;;       (if cua--rectangle
;;           (progn
;;             (cua-copy-rectangle t)
;;             (cua-cancel))
;;         (call-interactively 'cua-copy-region))
;;     (if (rm-mark-active)
;;         (call-interactively 'rm-kill-ring-save)
;;       ;; BUG: cannot find  `copy-region-as-kill-nomark'
;;       (copy-region-as-kill-nomark beg end))))

(provide 'xy-edit-1)
