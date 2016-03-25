;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-20 Sun 23:26 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-enhance.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Basic enhancements
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;; build-in lisps 

;;;; Enable some hidden functions
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(global-subword-mode 1) ;; subword
;; (when is-after-emacs-23 ;; Move deleted files to system trash
  (setq delete-by-moving-to-trash t);;)
(auto-compression-mode 1) ;; put in front of `session.el'
(setq kill-do-not-save-duplicates t) ;; Do not save same cut
(setq kill-ring-max 500) ;; Set a large kill ring
(setq save-interprogram-paste-before-kill t) ;; Save paster
;; TODO: move to `w32' settings
;; try to improve slow performance on windows.
(Windows (setq w32-get-true-file-attributes nil))



;;;; ffap
;; REF: (@url :file-name "http://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html#index-ffap-3860" :display "emacs manual")
(eval-after-load "ffap" '(ffap-postload))
(ffap-bindings) ;; BUG: conflict with `ido.el' C-x C-f, can be fixed
                ;;      by (setq ffap-require-prefix t)
                ;;      (Has been added to `ffap-postload')



;;;; linum
(eval-after-load 'linum '(linum-postload))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook ;; lisp-interaction-mode-hook
                  sh-mode-hook cperl-mode-hook c-common-mode-hook
                  vhdl-mode-hook verilog-mode-hook matlab-mode-hook
                  haskell-mode-hook python-mode-hook)
 '(lambda () (linum-mode 1)))
(am-add-hooks
 `(lisp-interaction-mode-hook)
   '(lambda () (linum-mode -1)))
;; (global-linum-mode 1) ;; always turn on linum-mode
(global-set-key (kbd "<f6> n") 'linum-mode)



;;;; time-stamp
;; maintain last change time stamps
;; (`Time-stamp:<>' occurring within the first 8 lines)
;; in files edited by Emacs
(eval-after-load "time-stamp" '(time-stamp-postload))
(add-hook 'write-file-hooks 'time-stamp)

;;;; ispell
;; 其他拼写检查的基础
(eval-after-load "ispell" '(ispell-postload))



;;;; flyspell
(eval-after-load 'flyspell '(flyspell-postload))
(am-add-hooks
 `(;;text-mode-hook ;; BUG: cause error when start emacs daemon or
                    ;;      Emacs24
     org-mode-hook latex-mode-hook
                   LaTeX-mode-hook
                   org-mode-hook
                   message-mode-hook
                   mew-draft-mode-hook)
 '(lambda ()
    (flyspell-mode 1)))

;; BUG: error when uncomment the following code
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook c-common-mode-hook
;;                   matlab-mode-hook)
;;  '(lambda ()
;;     (flyspell-prog-mode 1)))
;; (global-set-key (kbd "M-Q") 'flyspell-correct-word-before-point)

;; REF: https://www.emacswiki.org/emacs/FlySpell#toc1
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

(global-set-key (kbd "M-Q") 'flyspell-auto-correct-previous-word)

;; REF: http://superuser.com/questions/540942/is-it-possible-to-auto-correct-spelling-on-space-in-emacs
;; (defun  xy/flyspell-auto-correct-and-space ()
;;   (interactive)
;;   (flyspell-auto-correct-word)    ;; Auto-correct the word at point
;;   (when (not (or (looking-at " ") ;; If after the correction we are in the
;;                  (eolp)))         ;; middle of the word, forward to the end
;;     (forward-word))             ;; of the word.
;;   (insert " "))                   ;; insert a space
;; (global-set-key (kbd "SPC") 'xy/flyspell-auto-correct-and-space)

;; ;; NOTE: not necssary when using a single language
;; ;;;; auto-dictionary
;; (when (try-require 'auto-dictionary)
;;   (add-hook 'flyspell-mode-hook
;;             (lambda () (auto-dictionary-mode 1))))



;;;; calendar
;; Emacs 中有日历，而且可以称之为一个系统，因为其中除了最常用的日历之外，
;; 还有其他的近十种历法，其中有日记、约会提醒、纪念日提示以及节假日提示等
;; 等。其中的历法包括中国的农历、希伯来历、伊斯兰历、法国革命历、中美玛雅
;; 历等等，可以根据经纬度告知你的所在的每天日出日落的时间等等。
;;
;; holiday-fixed m d    固定阳历节日， m 月 d 日
;; holiday-float m w n 浮动阳历节日， m 月的第 n 个星期 w%7
;;


;; .    跳回当前天
;; o    跳到某一个月
;; g d    跳到某年某月某日
;; g c    跳到某年某星期的星期几
;; g C    跳到阴历的某一天
;; p C    显示当前的阴历日期
;; h    显示当前节日
;; i d    加入当前这一天的日程安排
;; i w    加入每周这一天的日程安排
;; i m    加入每月这一天的日程安排
;; i y    加入每年这一天的日程安排
;; i a    加入周年纪念（anniversary），比如生日等
;; d    察看当前日期的diary


(eval-after-load "calendar" '(calendar-postload))
(eval-after-load "diary-lib" '(diary-postload))
(eval-after-load "appt" '(appt-postload))
;; (try-require 'chinese-calendar) ;;中文日历 by wanson@newsmth
(eval-after-load "cal-china-x" '(cal-china-x-postload))
;; (try-require 'cal-china-x)



;;;; tramp
;; 以另一用户编辑文件, 或者编辑远程主机文件
(tramp-preload)
(eval-after-load "tramp" '(tramp-postload))
(GNULinux
 (global-set-key (kbd "C-c C-R") 'sudo-edit-current-file))



;;;; term-mode
(eval-after-load "term" '(term-postload))



;;;; Shell/eshell-mode
;;(define-key shell-mode-map "\M-m" 'shell-add-to-history)
;; Backgrounding a process in shell mode
;; You might find it difficult to background
;; a process that’s started, once you’re in shell mode.
;; If you hit ‘C-z’, you end up backgrounding Emacs!
;; To solve this, just execute
;;  M-x local-set-key RET C-z self-insert-command
;; And if you want to background Emacs, just go to a different buffer.
;; ‘C-q C-z’ doesn’t work? - No, but C-c C-z should.
(global-set-key (kbd "<f9> s") 'ansi-shell)
(global-set-key (kbd "<f9> e") 'eshell)


;;; undo and redo
;;;; undo-tree
;; NOTE: temperal disabled because of the conflict between undo-tree
;; and menu-bar(?)
;; (require 'undo-tree)
;; (autoload 'global-undo-tree-mode "undo-tree" nil t)
(when (try-require 'undo-tree)
  (global-undo-tree-mode 1))
;; (global-set-key (kbd "<f6> u") 'global-undo-tree-mode)
;;
;; NOTE:
;; `undo-tree-mode' and `global-undo-tree-mode'
;;   Enable undo-tree mode (either in the current buffer or globally).
;;
;; C-_  C-/  (`undo-tree-undo')
;;   Undo changes.
;;
;; M-_  C-?  (`undo-tree-redo')
;;   Redo changes.
;;
;; `undo-tree-switch-branch'
;;   Switch undo-tree branch.
;;   (What does this mean? Better press the button and see!)
;;
;; C-x u  (`undo-tree-visualize')
;;   Visualize the undo tree.
;;   (Better try pressing this button too!)
;;
;; C-x r u  (`undo-tree-save-state-to-register')
;;   Save current buffer state to register.
;;
;; C-x r U  (`undo-tree-restore-state-from-register')
;;   Restore buffer state from register.



;;;; redo+
;; (autoload 'undo "redo+" "Undo some previous changes." t)
;; (autoload 'redo "redo+" "Redo the the most recent undo." t)
;; (when (try-require 'redo+)
;;   (global-set-key (kbd "C-/") 'undo)
;;   (global-set-key (kbd "C-?") 'redo))



;;; list-processes+
;; 查看Emacs内进程
(autoload 'list-processes+ "list-processes+"
  "Enhanced `list-processes'" t)
(autoload 'list-processes-sort "list-processes+" nil t)
(autoload 'list-processes-kill-process "list-processes+" nil t)
(autoload 'list-processes-goto-buffer "list-processes+" nil t)
(defalias 'list-processes+ 'list-processes)


;;; command-frequence
;; 统计命令使用频率
;; (autoload 'command-frequence "command-frequence"
;;   "Emacs command frequence statistics" t)



;;; todochiku
;; notification tool.
;; It started life interfacing with Growl (OS X, http://growl.info/),
;; Snarl (Win 32, http://www.fullphat.net/) and libnotify (linux/unix).
;; It can also do standard messages (in the minibuffer) and pop up a
;;tooltip.
(eval-after-load "todochiku" '(todochiku-postload))



;;; kill ring
;; use `helm-show-kill-ring' instead
;;;; browse-kill-ring
;; (eval-after-load "browse-kill-ring"
;;   '(progn
;;      (browse-kill-ring-postload)
;;      (browse-kill-ring-face-settings)
;;      (eal-define-keys
;;       'browse-kill-ring-mode-map
;;       `(("RET" browse-kill-ring-insert-and-quit)
;;         ;; ("<"   beginning-of-buffer)
;;         ;; (">"   end-of-buffer)
;;         ;; ("j"   next-line)
;;         ;; ("k"   previous-line)
;;         ;; ("h"   backward-char)
;;         ;; ("l"   forward-char)
;;         ("n"   browse-kill-ring-forward-without-linum-mode)
;;         ("p"   browse-kill-ring-previous-without-linum-mode)
;;         ;; ("SPC" scroll-up)
;;         ;; ("U"   scroll-down)
;;         ("u"   View-scroll-half-page-backward)
;;         ("o"   other-window)))))
;; (global-set-key (kbd "<f2> k") 'browse-kill-ring)



;;;; kill-ring-search
;; use `helm-show-kill-ring' instead
;; Search the kill ring in the minibuffer.
;; (autoload 'kill-ring-search "kill-ring-search"
;;  "Search the kill ring in the minibuffer."
;;  (interactive))
;; (global-set-key (kbd "C-M-y") 'kill-ring-search)



;;; copyright
;; (GNUEmacs
;;  ;; update the copyright notice in current buffer
;;  (when (try-require 'copyright)
;;            ; XXX Check no other copyright.el gets in the way
;;    (add-hook 'write-file-hooks 'copyright-update)))



;;; Hanconvert
;; 自动在简体中文和繁体中文间转换.
(autoload 'hanconvert-region "hanconvert"
  "Convert a region from simple chinese to tradition chinese or
from tradition chinese to simple chinese" t)



;;; htmlize
;; 把文件或buffer彩色输出成html
(eval-after-load "htmlize" '(htmlize-postload))



;;; inkd
;; 在各种 text 文档间提供链接
(autoload 'linkd-mode
  "linkd" "Make hypertext with active links in any buffer" t)
(eval-after-load "linkd"
  '(progn
     (linkd-postload)
     (eal-define-keys
      'linkd-overlay-map
      `(("n"        linkd-next-link)
        ("p"        linkd-previous-link)
        ("<return>" linkd-follow-at-point)
        ("e"        linkd-edit-link-at-point)))
     (eal-define-keys
      'linkd-map
      `(("<mouse-4>" nil)
        ("C-c ," nil)
        ("C-c '" nil)))
     (eal-define-keys-commonly
      global-map
      `(("C-x L t" linkd-insert-tag)
        ("C-x L s" linkd-insert-star)
        ("C-x L l" linkd-insert-link)))))

(global-set-key (kbd "<f6> l") 'linkd-mode)

;; NOTE: it is better to turn on linkd-mode manually
;; FIXME: cause highlight error when start
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook
;;                   c-common-mode-hook
;;                   sh-mode-hook matlab-mode-hook
;;                   vhdl-mode-hook verilog-mode-hook
;;                   ;; org-mode-hook ;; NOTE: C-c ' conflicts with linkd
;;                   LaTeX-mode-hook)
;;  '(lambda () (linkd-mode 1)))
;; (am-add-hooks
;;  `(lisp-interaction-mode-hook org-mode-hook)
;;  '(lambda () (linkd-mode -1)))



;;; ascii
;; ascii表查询
;; (autoload 'ascii-on        "ascii"
;;   "Turn on ASCII code display."   t)
;; (autoload 'ascii-off       "ascii"
;;   "Turn off ASCII code display."  t)
;; (autoload 'ascii-display   "ascii"
;;   "Toggle ASCII code display."    t)
;; (autoload 'ascii-customize "ascii"
;;   "Customize ASCII code display." t)



;;; shell
;;;; multi-term
;; ;; a mode based on term.el, for managing multiple terminal buffers
;; (autoload 'multi-term "multi-term" nil t)
;; (eval-after-load "multi-term"
;;   '(progn
;;      (multi-term-postload)
;;      (eal-define-keys-commonly
;;       global-map
;;       `(("C-c T n" multi-term-next)
;;         ("C-c T p" multi-term-prev)))))
;;      ;; (eal-define-keys
;;      ;;  'text-mode-map
;;      ;;  `(("M-S-j"   switch-term-and-text)
;;      ;;    ("M-S-l"   enter-term-mode)))))
;; (global-set-key (kbd "C-x S-t") 'multi-term)
;; NOTE: not very useful

;;;; shell-pop
;; pop up a window for shell
(autoload 'shell-pop "shell-pop" "Pop-up a shell" t)
(eval-after-load "shell-pop" '(shell-pop-postload))
(global-set-key (kbd "<f9> p") 'shell-pop)



;;;; shell-here
(global-set-key (kbd "<f9> d") 'shell-here)


;;; spell check
;;;; hunspell
;; NOTE: Commented due to use aspell instead of hunspell
;; ;; (eval-after-load "rw-hunspell" '(rw-hunspell-postload))
;; ;; (eval-after-load "rw-ispell" '(rw-ispell-postload))
;; ;; (require 'rw-language-and-country-codes)
;; ;; (require 'rw-ispell)
;; ;; (Windows
;; ;;  (require 'rw-hunspell))
;; (Windows
;;  (eval-after-load "rw-hunspell" '(rw-hunspell-postload))
;;  (eval-after-load "rw-ispell" '(rw-ispell-postload))
;;  ;; (require 'rw-language-and-country-codes)
;;  (require 'rw-ispell)
;;  (require 'rw-hunspell))



;;;; wcheck-mode
;; TODO: make wcheck-mode working
;; (eval-after-load "wcheck-mode" '(wcheck-mode-postload))



(provide 'xy-rcroot-enhance)
