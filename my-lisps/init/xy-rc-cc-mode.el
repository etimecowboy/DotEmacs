;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-20 Mon 15:31 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cc-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My C/C++/Java development settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun cc-mode-postload ()
  "Settings for `cc-mode' after it's been loaded."
  ;; Make a non-standard key binding.  We can put this in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
  ;; inherit from it.
  ;; (defun my-c-initialization-hook ()
  ;;   (define-key c-mode-base-map "\C-m" 'c-context-line-break))
  ;; (add-hook 'c-initialization-hook 'my-c-initialization-hook)

  ;; (c-set-offset 'inline-open 0)
  ;; (c-set-offset 'friend '-)
  ;; (c-set-offset 'substatement-open 0)

  (setq  c-basic-offset 4
         c-strict-syntax-p t
         c-syntactic-indentation t)

  ;;------------------------------------------------------------------
  ;; C programming style
  ;; (setq c-default-style '((java-mode . "java")
  ;;                         (awk-mode . "awk")
  ;;                         (other . "linux")))

  ;; offset customizations not in my-c-style
  ;; This will take precedence over any setting of the syntactic symbol
  ;; made by a style.
  (setq c-offsets-alist '((member-init-intro . ++)))

  ;; Create my personal style.
  ;; (defconst my-c-style
  ;;   '((c-tab-always-indent        . t)
  ;;     (c-comment-only-line-offset . 4)
  ;;     (c-hanging-braces-alist     . ((substatement-open after)
  ;;                                    (brace-list-open)))
  ;;     (c-hanging-colons-alist     . ((member-init-intro before)
  ;;                                    (inher-intro)
  ;;                                    (case-label after)
  ;;                                    (label after)
  ;;                                    (access-label after)))
  ;;     (c-cleanup-list             . (scope-operator
  ;;                                    empty-defun-braces
  ;;                                    defun-close-semi))
  ;;     (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
  ;;                                    (substatement-open . 0)
  ;;                                    (case-label        . 4)
  ;;                                    (block-open        . 0)
  ;;                                    (knr-argdecl-intro . -)))
  ;;     (c-echo-syntactic-information-p . t))
  ;;   "My C Programming Style")
  ;; (c-add-style "PERSONAL" my-c-style)

  (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
  (add-hook 'c-mode-hook 'my-c-mode-hook)
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)

  ;;------------------------------------------------------------------
  (message "* ---[ cc-mode post-load configuration is complete ]---"))

;; Customizations for all modes in CC Mode.
;;;###autoload
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  ;; (c-set-style "PERSONAL")

  ;; Use google style
  (when (try-require 'google-c-style)
    (add-hook 'c-mode-common-hook 'google-set-c-style)
    ;; If you want the RETURN key to go to the next line and space over
    ;; to the right place, add this to your .emacs right after the load-file:
    (add-hook 'c-mode-common-hook 'google-make-newline-indent))

  ;; other customizations
  (setq ;; tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode -1)
  ;; (setq-default c-electric-flag nil) ;; for newbies to cc-mode
  (c-toggle-electric-state 1)
  ;; (auto-newline-mode 1)
  ;; (c-toggle-auto-newline 1)
  ;; (hungry-delete-mode 1)
  (c-toggle-auto-hungry-state 1)
  (c-subword-mode 1)
  (c-toggle-syntactic-indentation 1)
  (require 'filladapt)
  (c-setup-filladapt)
  (filladapt-mode 1)
  (message "* ---[ c-common-mode configuration is complete ]---"))

;; Customizations for c-mode
;;;###autoload
(defun my-c-mode-hook ()
  (global-cwarn-mode 1)  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (require 'ifdef)       ;; 为不同层次的ifdef着色
  (require 'hideif)      ;; 显示隐藏 ifdef
  (hide-ifdef-mode 1)
  (require 'c-includes)  ;; 快速include
  ;; (require 'sourcepiar)  ;; 可以在cpp与h文件之间切换
  (require 'xcscope)     ;; 在 C 源代码中快速跳转，查找变量，函数
  (require 'xcscope+)
  (message "* ---[ c-mode configuration is complete ]---"))

;; Customizations for c++-mode
;;;###autoload
(defun my-c++-mode-hook ()
  (global-cwarn-mode 1)  ;; 高亮显示C/C++中的可能的错误(CWarn mode)
  (require 'ifdef)       ;; 为不同层次的ifdef着色
  (require 'hideif)      ;; 显示隐藏 ifdef
  (hide-ifdef-mode 1)
  (require 'c-includes)  ;; 快速include
  (require 'xcscope)     ;; 在 C 源代码中快速跳转，查找变量，函数
  (require 'xcscope+)
  ;; (setq tab-width 4 indent-tabs-mode nil)
  ;; (c-set-style "stroustrup")
  ;; (defalias 'cpp-mode 'c++-mode)
  ;; (define-key c++-mode-map [f3] 'replace-regexp)
  (message "* ---[ c++-mode configuration is complete ]---"))

(provide 'xy-rc-cc)

;; ;;;###autoload
;; (defun c-mode-common-hook-settings ()
;;   "Settings for `c-mode-common-hook'."
;;   (c-set-style "awk")
;;   ;;预处理设置
;;   (setq c-macro-shrink-window-flag t)
;;   (setq c-macro-preprocessor "cpp")
;;   (setq c-macro-cppflags " ")
;;   (setq c-macro-prompt-flag t)
;;   ;; (setq hs-minor-mode t)
;;   ;; (setq abbrev-mode t)
;;   ;; (when (try-require 'c-eldoc)
;;   ;;       (eval-after-load "c-eldoc"
;;   ;;         (progn
;;   ;;           (c-eldoc-postload)))))
;;   )


;; REF: http://wuyang.yangsheep.net/#sec-2-2-1-18
;; 2.2.1.18 一个简单的C风格设定，不过现在我用google的了

;; (add-hook 'c-mode-hook 'linux-c-mode)
;; (add-hook 'c++-mode-hook 'linux-cpp-mode)
;; ;; 设置imenu的排序方式为按名称排序
;; (setq imenu-sort-function 'imenu--sort-by-name)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun linux-c-mode()
;;   ;; 将回车代替C-j的功能，换行的同时对齐
;;   (define-key c-mode-map [return] 'newline-and-indent)
;;   (interactive)
;;   ;; 设置C程序的对齐风格
;;   (c-set-style "K&R")
;;   ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
;;   (c-toggle-auto-state)
;;   ;; 此模式下，当按Backspace时会删除最多的空格
;;   (c-toggle-hungry-state)
;;   ;; TAB键的宽度设置为4
;;   (setq c-basic-offset 4)
;;   ;; 在菜单中加入当前Buffer的函数索引
;;   (imenu-add-menubar-index)
;;   ;; 在状态条上显示当前光标在哪个函数体内部
;;   (which-function-mode)
;;   )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun linux-cpp-mode()
;;   (define-key c++-mode-map [return] 'newline-and-indent)
;;   (define-key c++-mode-map [(control c) (c)] 'compile)
;;   (interactive)
;;   (c-set-style "K&R")
;;   (c-toggle-auto-state)
;;   (c-toggle-hungry-state)
;;   (setq c-basic-offset 8)
;;   (imenu-add-menubar-index)
;;   (which-function-mode)
;;   )
