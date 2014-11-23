;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-23 Sun 02:24 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-prog.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  My programming settings
;; Shell script development settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;* Code formatting

(setq-default comment-column 40) ;; set comment alignment position



;;** Auto indent
(eal-define-keys
 `(lisp-mode-map emacs-lisp-mode-map lisp-interaction-mode-map
   sh-mode-map ruby-mode-map tcl-mode-map python-mode-map
   perl-mode-map)
 `(("RET" newline-and-indent)))



;;** align
(eal-define-keys-commonly
 global-map
 `(("C-x A n"   align)
   ("C-x A r"   align-regexp)))



;;** auto-fill
(eval-after-load "simple" '(simple-postload))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook latex-mode-hook
                  c-common-mode-hook LaTeX-mode-hook
                  matlab-mode-hook org-mode-hook
                  ;; magit-log-edit-mode-hook ;no hook for this mode
                  ;; TODO: fix it.
                  mew-draft-mode-hook) 'turn-on-auto-fill)



;;** hungry-delete-mode
;; (autoload 'turn-on-hungry-delete-mode "hungry-delete"
;;   "Turns on hungry delete mode if the buffer is appropriate." t nil)
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-map
;;    sh-mode-map cperl-mode-hook c-common-mode-hook vhdl-mode-map
;;    verilog-mode-map matlab-mode-hook)
;;  'turn-on-hungry-delete-mode)



;;** paren-mode
(eval-after-load "paren" '(paren-postload))
;; (show-paren-mode 1)
;; (setq show-paren-style 'parenthesis)



;;** mic-paren
;; An extension and replacement to the packages `paren.el' and
;; `stig-paren.el' for Emacs
(eval-after-load "mic-paren" '(mic-paren-postload))
(when (try-require 'mic-paren) (paren-activate))



;;** rainbow-delimiters
;; With this package, the delimiters all get different colors based on
;; their nesting level.
;; NOTE: It takes a lot of computation resource, so I disabled it.
;; (eval-after-load "rainbow-delimiters"
;;   '(progn
;;      (rainbow-delimiters-postload)))
;; (require 'rainbow-delimiters)
;; (am-add-hooks
;;  `(find-file-hook
;;    help-mode-hook Man-mode-hook log-view-mode-hook
;;    compilation-mode-hook gdb-mode-hook lisp-interaction-mode-hook
;;    browse-kill-ring-mode-hook completion-list-mode-hook hs-hide-hook
;;    inferior-ruby-mode-hook custom-mode-hook Info-mode-hook
;;    svn-log-edit-mode-hook package-menu-mode-hook dired-mode-hook
;;    apropos-mode-hook)
;;  'rainbow-delimiters-mode)



;;** highlight-parentheses
(autoload 'highlight-parentheses-mode "highlight-parentheses" nil t)
(eval-after-load "highlight-parentheses"
  '(highlight-parentheses-postload))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  sh-mode-hook cperl-mode-hook c-common-mode-hook
                  vhdl-mode-hook verilog-mode-hook matlab-mode-hook)
 '(lambda ()
    (highlight-parentheses-mode 1)))



;;** autopair
;; NOTE: autopair-mode conflicts with `auctex'/`cdlatex', and
;; `yasnippet'. Need to use hooks to disable it in these modes.
(autoload 'autopair-mode "autopair" nil t)
(eval-after-load "autopair" '(autopair-postload))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  sh-mode-hook cperl-mode-hook c-common-mode-hook
                  ;; vhdl-mode-hook
                  verilog-mode-hook matlab-mode-hook)
 '(lambda () (autopair-mode 1)))




;;** iedit
;; FIXME: don't work
;; (autoload 'iedit-mode "iedit" nil t)
;; ;; (eval-after-load "iedit" '(iedit-postload))
;; (am-add-hooks
;;  `(lisp-mode-hook ;; emacs-lisp-mode-hook
;;                   ;; lisp-interaction-mode-hook
;;                   ;; sh-mode-hook
;;                   ;; cperl-mode-hook
;;                   c-common-mode-hook
;;                   ;; vhdl-mode-hook
;;                   ;; verilog-mode-hook
;;                   matlab-mode-hook)
;;  '(lambda ()
;;     (when (try-require 'iedit)
;;       (iedit-mode 1))))



;;* Code folding

;;** hide-region
;; NOTE: very old, use `fold-this.el' instead, which is more powerful.
;; (eval-after-load "hide-region"
;;   '(progn
;;      (hide-region-postload)))
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook
;;    cperl-mode-hook cc-mode-hook
;;    vhdl-mode-hook verilog-mode-hook
;;    matlab-mode-hook
;;    ;; org-mode-hook text-mode-hook
;;    )
;;  '(lambda ()
;;     (require 'hide-region)))
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x M-r" hide-region-hide)
;;    ("C-x M-R" hide-region-unhide)))



;;** fold-this
(eal-define-keys-commonly
 global-map
 `(("C-x M-f" fold-this)
   ("C-x M-F" fold-this-all)
   ("C-x M-U" fold-this-unfold-all)))


;;** outline
;; outline-mode, structural editing
(defvar outline-minor-mode-prefix "\M-#")
(eval-after-load "outline" '(outline-postload))
(global-set-key (kbd "<f6> o") 'outline-minor-mode)
;; (eal-define-keys
;;  'outline-mode-map
;;  `(("C-M-h"   outline-mark-subtree)
;;    ("C-c u"   outline-up-heading)))



;;*** outline 插件
;; REF: - (@url :file-name "http://www.cnblogs.com/bamanzi/archive/2011/10/09/emacs-outline-org-like.html" :display "Post")
;;      - (@url :file-name "http://code.google.com/p/bamanzi-misc/source/browse/trunk/_emacs.d/lisp/outline-org-like.el" :display "Source")

;; (autoload 'outline-cycle "outline-magic" nil t)
;; (add-hook 'outline-minor-mode-hook
;;           (lambda ()
;;               (setq indent-tabs-mode nil)
;;               (setq tab-always-indent t)
;;               (define-key outline-minor-mode-map (kbd "C-<tab>")
;;                 'outline-cycle)))

;; (autoload 'outline-org-mode "outline-org-like" nil t)
;; NOTE: it takes a lot of time to load `org', so it is better to
;; turn it on manually.
;; (am-add-hooks
;;  `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
;;                       vhdl-mode-hook verilog-mode-hook
;;                       latex-mode-hook tex-mode-hook)
;;  '(lambda ()
;;       (outline-org-mode)))
;; (global-set-key (kbd "<f6> o") 'outline-org-mode)



;;** hideshow
;; a minor mode similar to outline-mode.
;; It hides and shows blocks of text.
;; In particular, HideShow hides balanced-expression code blocks and
;; multi-line comment blocks.
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/HideShow" :display "emacswiki")
(autoload 'hs-minor-mode "hideshow" nil t)
(eval-after-load "hideshow"
  '(progn
     (hs-minor-mode-postload)
     ;; (define-key hs-minor-mode-map (kbd "C-c @ C-h") 'hs-hide-block)
     ;; (define-key hs-minor-mode-map (kbd "C-c @ C-w") 'hs-show-block)
     ;; (define-key hs-minor-mode-map (kbd "S-<f6>") 'hs-toggle-hiding)
     ;; (define-key hs-minor-mode-map (kbd "C-<f6>") 'hs-hide-level)
     ;; (define-key hs-minor-mode-map (kbd "M-<f6>") 'hs-hide-all)
     ;; (define-key hs-minor-mode-map (kbd "M-S-<f6>") 'hs-show-all)
     ))
;; BUG: start it manually, or it will conflicts with my `ediff-postload'
;; (am-add-hooks
;;  `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
;;                       vhdl-mode-hook verilog-mode-hook)
;;  '(lambda () (hs-minor-mode)))
(global-set-key (kbd "<f6> H") 'hs-minor-mode)

;;*** hideshow-org
;; The extension makes hideshow.el’s functionality behave like org-mode’s.
;; REF: - (@url :file-name "https://github.com/secelis/hideshow-org" :display "Source")
;;      - (@url :file-name "http://gnufool.blogspot.com/2009/03/make-hideshow-behave-more-like-org-mode.html" :display "Post")
;; NOTE: the default <TAB> key conflicts with `icicles' and
;;       `yasnippet'
;; BUG: strange byte compile error which does not stop it from working.
(autoload 'hs-org/minor-mode "hideshow-org" nil t)
(eval-after-load "hideshow-org" '(hideshow-org-postload))
(global-set-key (kbd "<f6> h") 'hs-org/minor-mode)



;;** orgstruct-mode
;; universal cycling keys
;; BUG: not working in elisp code
;; (defun org-cycle-global ()
;;   (interactive)
;;   (org-cycle t))

;; (defun org-cycle-local ()
;;   (interactive)
;;   (save-excursion
;;     (move-beginning-of-line nil)
;;     (org-cycle)))

;; ;; (global-set-key (kbd "M-[") 'org-cycle-global)
;; ;; (global-set-key (kbd "M-]") 'org-cycle-local)
;; ;; (add-hook 'emacs-lisp-mode-hook #'orgstruct-mode)
;; ;; (add-hook 'lisp-mode-hook #'orgstruct-mode)



;;* Code exploration

;;** find-func
;; emacs build-in lisp for finding functions
;; (find-function-setup-keys)



;;** describe-symbol and find-symbol
;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map
;;    completion-list-mode-map help-mode-map debugger-mode-map)
;;  `(("C-c /"   describe-symbol-at-point)
;;    ("C-c M-v" describe-variable-at-point)
;;    ("C-c M-f" describe-function-at-point)
;;    ("C-c M-s" describe-face-at-point)
;;    ("C-c C-j" find-symbol-at-point)
;;    ("C-c C-h" find-symbol-go-back)
;;    ("C-c M-V" find-symbol-var-at-point)
;;    ("C-c M-F" find-symbol-fun-at-point)
;;    ("C-c M-S" find-symbol-face-at-point)
;;    ("C-c w"   where-is-at-point)))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x C-k" describe-key)
;;    ("C-x C-m" describe-mode)
;;    ("C-x / A" describe-face)
;;    ("C-x / a" apropos)
;;    ("C-x A"   apropos-command)
;;    ("C-x C-d" find-symbol)
;;    ("C-x K"   find-symbol-fun-on-key)
;;    (,(if window-system "C-x C-/" "C-x C-_") describe-symbol)))



;;** which-func
;; 用来显示当前光标在哪个函数
(eval-after-load "which-func" '(which-func-postload))
(which-func-mode 1)



;;** imenu
(eval-after-load "imenu" '(imenu-postload))
;; (add-hook 'font-lock-mode-hook ;; Add an Imenu index to the menu bar
;;                                ;; in any mode that supports Imenu.
;;           'try-to-add-imenu)

;;*** imenu-tree
(eval-after-load "imenu-tree" '(imenu-tree-postload))
(global-set-key (kbd "<f7> i") 'imenu-tree)



;;** etags
(eval-after-load "etags" '(etags-postload))



;;** projectile
;; A project management mode
(eval-after-load "projectile" '(projectile-postload))
(global-set-key (kbd "<f6> <f6>") 'projectile-mode)


;;* Shell script development settings
(eval-after-load "sh-script" '(sh-mode-postload))
;; (eal-define-keys
;;  'sh-mode-map
;;  `(("<"       self-insert-command)
;;    ("C-c M-c" sh-case)
;;    ("C-c C-c" comment)
;;    ("C-c g"   bashdb)))



;;* Windows DOS batch script programming
(autoload 'batch-mode "batch-mode" t)
(add-to-list 'auto-mode-alist '("\\.bat$" . batch-mode))



;;* Emacs-lisp development settings
(eval-after-load "emacs-lisp-mode"
  '(progn
     (emacs-lisp-mode-postload)
     (eal-define-keys
      'emacs-lisp-mode-map
      `(;; ("C-c M-a"             beginning-of-defun)
        ;; ("C-c M-e"             end-of-defun)
        ("C-M-f"               mark-function)
        ;; ("C-c D"               edebug-defun)
        ("C-c C-d"             eval-defun)
        ;; ("C-c B"               eval-buffer)
        ("C-c L"               emacs-lisp-byte-compile-and-load)
        ;; ("C-c f"               copy-function)
        ;; ("C-c F"               kill-function)
        ;; ("C-c C-q"             indent-function)
        ;; ("C-c C"               comment-function)
        ("C-M-f"               insert-sequence-symbol)
        ("C-M-k"               insert-sequence-key)
        ))))

(eval-after-load "lisp-mode"
  '(progn
     (lisp-mode-postload)
     (eal-define-keys
      `(lisp-mode-map lisp-interaction-mode-map)
      `(;; ("C-j"                 goto-line)
        ("M-j"                 eval-print-last-sexp)
        ("C-M-h"               mark-function)
        ;; ("C-c D"               edebug-defun)
        ("C-c C-d"             eval-defun)
        ;; ("C-c B"               eval-buffer)
        ;; ("C-c f"               copy-function)
        ;; ("C-c F"               kill-function)
        ;; ("C-c C-q"             indent-function)
        ;; ("C-c C"               comment-function)
        ))))

;; auto compile elisp files after save, do so only if there's exists
;; a byte-compiled file
;; BUG: removed, it is cause resursive loading sometimes.
;; (add-hook 'after-save-hook 'xy/auto-recompile-el-buffer)

;; auto delete elc files after changing a el file
(add-hook 'after-save-hook 'xy/remove-elc-on-save)

;; BUG: lisp-interaction-mode error
;; Debugger entered--Lisp error: (error "Invalid function:
;; (progn (turn-on-auto-fill) (turn-on-eldoc-mode))")
;; signal(error ("Invalid function: (progn (turn-on-auto-fill)
;; (turn-on-eldoc-mode))"))
;; error("%s" "Invalid function: (progn (turn-on-auto-fill)
;; (turn-on-eldoc-mode))")
;; byte-code("\302!\210\303\304\305    !\"\207" [icicle-orig-buff
;; act-on-choice icicle-try-switch-buffer error "%s"
;; error-message-string] 4)
;; (eval-after-load "lisp-interaction-mode"
;;   '(progn
;;     (lisp-mode-postload)))



;;** eldoc
;; 显示变量, 函数的声明，可用在很多语言中(c)
;; (eval-after-load "eldoc" '(eldoc-postload))
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook)
 'turn-on-eldoc-mode)



;;* c/c++ development settings
;; NOTE: C include directories' list are defined in `xy-util.el'
;; (add-to-list 'auto-mode-alist '("\\.c"   . c-mode))
;; (add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.c++$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hch" . c-mode)) ;; Handle-C
(add-to-list 'auto-mode-alist '("\\.hcc" . c-mode)) ;; Handle-C



;;** cc-mode
(eval-after-load "cc-mode"
  '(progn
     (cc-mode-postload)
     (eal-define-keys
      `(c-mode-base-map)
      `(("C-c <backspace>"     c-electric-backspace)
        ("C-c M-a"             beginning-of-defun)
        ("C-c M-e"             end-of-defun)
        ("C-M-h"               mark-function)
        ("C-c M-w"             copy-current-fun-name)
        ("C-c f"               copy-function)
        ("C-c F"               kill-function)
        ("C-c C-q"             indent-function)
        ("C-c C"               comment-function)
        ;; ifdef settings
        ;; ("C-c I"     mark-ifdef)
        ;; hide-ifdef
        ;; ("C-c w"     hide-ifdef-block)
        ;; ("C-c W"     hide-ifdefs)
        ;; ("C-c M-i"   show-ifdef-block)
        ;; ("C-c M-I"   show-ifdefs)
        ;; c-includes
        ;; ("C-c C i"     c-includes-current-file)
        ;; ("C-c C I"     c-includes)
        ;; sourcepair BUG: not working
        ;; ("C-c S"     sourcepair-load)
        ))))



;;** ifdef
(eval-after-load "ifdef" '(ifdef-postload))



;;** hide-ifdef
(eval-after-load "hideif" '(hideif-postload))
;; (autoload 'hide-ifdef-block "hideif"
;;   "Hide the ifdef block (true or false part) enclosing or before the cursor."
;;   t)
;; (autoload 'hide-ifdefs "hideif"
;;   "Hide the contents of some #ifdefs.
;; Assume that defined symbols have been added to `hide-ifdef-env'.
;; The text hidden is the text that would not be included by the C
;; preprocessor if it were given the file with those symbols defined.
;; ;; Turn off hiding by calling `show-ifdefs'."
;;   t)
;; (autoload 'show-ifdef-block "hideif"
;;   "Show the ifdef block (true or false part) enclosing or before the cursor."
;;   t)
;; (autoload 'show-ifdefs "hideif"
;;   "Cancel the effects of `hide-ifdef': show the contents of all #ifdefs."
;;   t)



;;** c-includes
(eval-after-load "c-includes" '(c-includes-postload))



;;** sourcepair
(eval-after-load "sourcepair" '(sourcepair-postload))
;; (autoload 'sourcepair-load "sourcepair"
;;   "Load the corresponding C/C++ header or source file for the current
;; buffer."  t)



;; ;;** codepilot
;; REF: (@url :file-name "https://github.com/brianjcj/mylisp" :display "Source")
;; someone else's c/c++ development environment
;; (setq codepilot-dir (concat my-local-lisp-path "codepilot"))
;; (try-require 'mycutil)
;; ;;;###autoload
;; (defun codepilot-settings-4-emaci ()
;;   "`codepilot' settings for `emaci'."
;;   (emaci-add-key-definition
;;    "[" 'cp-pb-where-we-are
;;    '(memq major-mode dev-modes)))
;; (eval-after-load "emaci"
;;   '(progn
;;     (codepilot-settings-4-emaci)))



;; ;; ** kde-emacs
;; 一个方便开发c的工具
;; ;; 包中定义了C-j 为goto-line, 还设置了c-style
;; (require 'kde-emacs-core)
;; (autoload 'agulbra-make-member "kde-emacs-utils"
;;   "make a skeleton member function in the .cpp or .cc file" t)
;; (eal-define-keys
;;  'c++-mode-map
;;  `(("C-c C-b" agulbra-make-member)))
;; ;;;###autoload
;; (defun kde-emacs-settings ()
;;   "Settings for `kde-emacs'."
;;   (setq magic-keys-mode nil)
;;   (setq kde-tab-behavior 'indent)
;;   (am-add-hooks
;;    `(java-mode-hook)
;;    (lambda ()
;;      (c-set-style "kde-c++"))))
;; (eval-after-load "kde-emacs-core"
;;   '(progn
;;     (kde-emacs-settings)))



;;** snavigator
;; (try-require 'sn)
;; (eal-define-keys
;;  `(c-mode-base-map)
;;  `(("C-h"     c-electric-backspace)
;;    ("C-c M-a" beginning-of-defun)
;;    ("C-c M-e" end-of-defun)
;;    ("C-c M-F" copy-current-fun-name)))



;;** xrefactory settings
;; (require 'xrefactory)
;; ;; 查找定义
;; (global-set-key (kbd "C-c x d") 'xref-push-and-goto-definition)
;; ;; 返回
;; (global-set-key (kbd "C-c x r") 'xref-pop-and-return)
;; ;; 浏览符号
;; (global-set-key (kbd "C-c x b") 'xref-browse-symbol)
;; ;; 上一个引用
;; (global-set-key (kbd "C-c x ,") 'xref-previous-reference)
;; ;; 下一个引用
;; (global-set-key (kbd "C-c x .") 'xref-next-reference)
;; ;;;###autoload
;; (defun xref-settings ()
;;   "settings for `xref'."
;;   (defvar xref-current-project nil)
;;   (defvar xref-key-binding 'global)
;;   (setq exec-path (cons (concat my-local-lisp-path "xref") exec-path)))
;; (eval-after-load "xref"
;;   '(progn
;;     (xref-settings)))



;;** xcscope
(eval-after-load "xcscope" '(xcscope-postload))



;;** ctags
;; TODO: try `ctags.el' and `ctags-update.el' in the future, and
;; make a comparison with the `xcscope.el' (ctags vs cscope)
;; REF:
;;     - (@url :file-name "http://stackoverflow.com/questions/934233/cscope-or-ctags-why-choose-one-over-the-other" :display "cscope vs ctags")
;; (eval-after-load "ctags" '(ctags-postload))



;;* vhdl development settings
(eval-after-load "vhdl" '(vhdl-mode-postload))



;;* verilog development settings
(eval-after-load "verilog" '(verilog-mode-postload))



;;* Matlab development settings
(eval-after-load "matlab" '(matlab-postload))
(autoload 'matlab-mode "matlab" "MATLAB editing mode" t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode" t)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.M\\'" . matlab-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
(add-to-list 'auto-mode-alist '("\\.M$" . matlab-mode))
;; (global-set-key (kbd "<f6> m") 'xy/matlab-cedet-start)
;; (global-set-key (kbd "<f6> m") 'xy/matlab-ecb-start)



;;* Documentation settings

;;** doxygen
;; (eval-after-load "doxymacs" '(doxymacs-postload))
;; (autoload 'doxymacs-mode "doxymacs"
;;   ;; All of the following text shows up in the "mode help" (C-h m)
;;   "Minor mode for using/creating Doxygen documentation.
;; To submit a problem report, request a feature or get support, please
;; visit doxymacs' homepage at http://doxymacs.sourceforge.net/.

;; To see what version of doxymacs you are running, enter
;; `\\[doxymacs-version]'.

;; In order for `doxymacs-lookup' to work you will need to customise the
;; variable `doxymacs-doxygen-dirs'.

;; Key bindings:
;; \\{doxymacs-mode-map}" t)
;; (am-add-hooks
;;  `(c-mode-common-hook php-mode-hook)
;;  (lambda ()
;;    (doxymacs-mode 1)
;;    (doxymacs-font-lock)))



;;* Compiler settings

;;** autoconf-mode settings
;; (eval-after-load "autoconf-mode" '(autoconf-mode-postload))
;; (require 'autoconf-mode-postload)



;;** flymake
;; 动态检查语法错误
(autoload 'flymake-find-file-hook "flymake" "" t)
(eval-after-load "flymake"
  '(progn
     (flymake-postload)
     (eal-define-keys
      'flymake-mode-map
      `(("C-c N"   flymake-goto-next-error-disp)
        ("C-c P"   flymake-goto-prev-error-disp)
        ("C-c M-w" flymake-display-current-warning/error))) ))
;; (add-hook 'find-file-hook 'flymake-find-file-hook)



;;** ahei 的智能编译
;; (require 'my-smart-compile)
;; (defalias 'cpl 'compile)
;; (defvar makefile-mode-map-list nil "the list of `makefile-mode-map'")
;; (if is-before-emacs-21
;;     (setq makefile-mode-map-list '(makefile-mode-map))
;;   (setq makefile-mode-map-list '(makefile-gmake-mode-map
;; makefile-automake-mode-map)))

;; (eal-define-keys
;;  (append makefile-mode-map-list
;;          '(c-mode-base-map svn-status-mode-map sh-mode-map
;;                            compilation-mode-map ruby-mode-map))
;;  `(("C-c C-m"  make-sb)
;;    ("C-c m"    make-check-sb)
;;    ("C-c M"    make-clean-sb)
;;    ("C-c c"    compile-buffer-sb)
;;    ("C-c r"    run-program-sb)
;;    ("C-c C"    smart-compile-sb)))

;; (eal-define-keys
;;  'java-mode-map
;;  `(("C-c C-m" ant-sb)
;;    ("C-c M"      ant-clean-sb)
;;    ("C-c m"      ant-test-sb)))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("M-n" next-error)
;;    ("M-p" previous-error)))

;; (eal-define-keys
;;  makefile-mode-map-list
;;  `(("M-p"      previous-error)
;;    ("M-n"      next-error)
;;    ("C-c p" makefile-previous-dependency)
;;    ("C-c n" makefile-next-dependency)))

;; (eal-define-keys
;;  'compilation-mode-map
;;  `(("n" compilation-next-error)
;;    ("p" compilation-previous-error)
;;    ("'" switch-to-other-buffer)
;;    ("u" View-scroll-half-page-backward)
;;    ("f" am-forward-word-or-to-word)
;;    ("d" scroll-up)
;;    ("w" scroll-down)))

;; (eval-after-load "compile"
;;   '(progn
;;      (compile-face-settings)
;;      (compile-postload)))



;;* Debug settings

;;** debug.el
;; (eval-after-load "debug"
;;   '(progn
;;      ;; (require 'util)
;;      (apply-define-key
;;       debugger-mode-map
;;       `(("'" switch-to-other-buffer)
;;         ("o" other-window)))))



;;** edebug
;; (eval-after-load "edebug"
;;   '(progn
;;      (define-key edebug-mode-map (kbd "C-c C-d") nil)))
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x M-E" toggle-debug-on-error)
;;    ("C-x Q"   toggle-debug-on-quit)))
;; (defun edebug-clear-global-break-condition ()
;;   "Clear `edebug-global-break-condition'."
;;   (interactive)
;;   (setq edebug-global-break-condition nil))



;;** gdb
;; (eal-define-keys
;;  'c-mode-base-map
;;  `(("C-c g" gdb)
;;    ("C-c b" gud-break)
;;    ("C-c B" gud-remove)))
;; (eal-define-keys
;;  'gud-mode-map
;;  `(("C-c B" gud-remove)
;;    ("M-s"   view)
;;    ("M-m"   comint-previous-matching-input)
;;    ("M-M"   comint-next-matching-input)
;;    ("C-c r" gud-run)
;;    ("C-c f" gud-finish)
;;    ("M-j"   gud-next)
;;    ("M-k"   gud-step)
;;    ("M-c"   gud-cont)
;;    ("M-S-c"   capitalize-word)
;;    ("C-c m" make)))
(eval-after-load "gdb-ui"
  '(progn
     (gud-postload)
     ;; (define-key c-mode-base-map [f2] 'gdb)
     ;; (define-key gud-minor-mode-map [f5]
     ;;   (lambda (&optional kill)
     ;;     (interactive "P")
     ;;     (if kill (gud-kill)
     ;;       (gud-go))))
     ;;      (define-key gud-minor-mode-map [S-f5] 'gud-kill)
     ;;      (define-key gud-minor-mode-map [f7] 'gud-kill) ; S-f5
     ;;      (define-key gud-minor-mode-map [f8] 'gud-print)
     ;;      (define-key gud-minor-mode-map [C-f8] 'gud-pstar)
     ;;      (define-key gud-minor-mode-map [f9] 'gud-break-or-remove)
     ;;      (define-key gud-minor-mode-map [C-f9] 'gud-enable-or-disable)
     ;;      (define-key gud-minor-mode-map [S-f9] 'gud-watch)
     ;;      (define-key gud-minor-mode-map [f10] 'gud-next)
     ;;      (define-key gud-minor-mode-map [C-f10] 'gud-until)
     ;;      (define-key gud-minor-mode-map [C-S-f10] 'gud-jump)
     ;;      (define-key gud-minor-mode-map [f11] 'gud-step)
     ;;      (define-key gud-minor-mode-map [C-f11] 'gud-finish)))
     ))
;; (eval-after-load "gdb-mi" '(gud-postload))



;;* Python development settings

(eval-after-load "elpy" '(elpy-postload))
(global-set-key (kbd "<f6> P") 'xy/elpy-start)


;;* IDE settings

;;** CEDET settings
;; FIXME: cedet need to be updated and reconfigured.
;; (eval-after-load "cedet" '(cedet-postload))
;; (global-set-key (kbd "<f6> C") 'xy/cedet-start)



;;** ECB settings
;; FIXME: ecb also need to be updated and reconfigured
;; (eval-after-load "ecb-autoloads" '(ecb-postload))
;; (global-set-key (kbd "<f6> B") 'xy/ecb-start)



;;** eclim settings
;; 把Eclipse的功能带给Emacs
;; (require 'eclim)
;; (dolist (hook (list 'c-mode-common-hook 'lisp-mode-hook
;;                     'emacs-lisp-mode-hook 'java-mode-hook))
;;   (add-hook hook 'eclim-mode))



(provide 'xy-rcroot-prog)
