;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-11 Sat 10:54 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-app.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  Emacs apparence
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;* Frame settings

;; TODO: create my own frame layout
;;** Default frame layout
;; (when window-system
;;   ;; Initial fram layout
;;   ;; (setq initial-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   ;; ;; New frame layout
;;   ;; (setq pop-up-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   ;; Default frame layout
;;   ;; (setq 'default-frame-alist
;;   ;;     '((height . 40)
;;   ;;       (width  . 90)))
;;   (add-to-list 'default-frame-alist '(height . 40))
;;   (add-to-list 'default-frame-alist '(width . 95)))

(global-set-key (kbd "C-x C-0") 'xy/toggle-fullscreen)


;;** Frame title
;; ;; Set frame title display: filename @ process
;; ;; (setq frame-title-format "%f @ %s")
;; (setq frame-title-format
;;       `(,(user-login-name) "@" ,(system-name) "     "
;;         global-mode-string "     %f" ))
;; ;; NOTE: `windows.el' and `revive.el' overwirte title
;; ;; (setq frame-title-format
;; ;;       '((:eval
;; ;;          (let ((login-name (getenv-internal "LOGNAME")))
;; ;;            (if login-name (concat login-name "@") "")))
;; ;;         (:eval (system-name))
;; ;;         ":"
;; ;;         (:eval (or (buffer-file-name) (buffer-name)))))

(setq frame-title-format
      '("%b"
        (:eval
         (if (buffer-file-name)
             (concat " (" (directory-file-name
                           (file-name-directory
                            (abbreviate-file-name
                             (buffer-file-name))))
                     ")")
           ""))
        " - Emacs"))


;;** Transparent frame
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/TransparentEmacs" :display "emacswiki")
;;; `alpha.el'
;; sample keybinding for transparency manipulation
(global-set-key (kbd "M-?") 'transparency-set-value)
;; the two below let for smooth transparency control
(global-set-key (kbd "C->") 'transparency-increase)
(global-set-key (kbd "C-<") 'transparency-decrease)


;;** Resize frame and window
;; BUG: there is a bug in `fit-frame.el' or `thumb-frm.el' which
;;      causes info-mode reports an error when following a link. Have
;;      to load these two lisp files in order to fix it, whether it is
;;      in console mode or GUI mode.
(eval-after-load "fit-frame" '(fit-frame-postload))
(eval-after-load "maxframe"  '(maxframe-postload))
(try-require 'fit-frame)
(try-require 'thumb-frm)
(try-require 'maxframe) ;; NOTE: not stable with two or more monitors

(if window-system
    (progn
      (when (try-require 'autofit-frame) ;; NOTE: annoying and cause problem in terminal
        (setq autofit-frames-flag t))
      (add-hook 'after-make-frame-functions 'fit-frame)
      (add-hook 'temp-buffer-show-hook
                'fit-frame-if-one-window 'append))
  (progn
    (when (try-require 'autofit-frame)
      (setq autofit-frames-flag nil))))

(eal-define-keys-commonly
 global-map
 `(("S-<f5>" fit-frame) ;; `fit-frame.el'
   ("M-<f5>" xy/smart-toggle-maxframe) ;; `maxframe.el'
   ("C-<f5>" windresize) ;; `windresize.el'
   ("C-M-z" thumfr-thumbify-other-frames) ;; `thumb-frm.el'
   ;; ("C-S-p" thumfr-fisheye-previous-frame)
   ;; ("C-S-n" thumfr-fisheye-next-frame)
   ("C-S-z" thumfr-toggle-thumbnail-frame))) ;; thumfr-really-iconify-or-deiconify-frame
;; avoid system maximize window icon conflict with `maxframe.el'
(define-key special-event-map [iconify-frame]
  'thumfr-thumbify-frame-upon-event)


;;* Window settings

;;** window-number
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
numbers with the C-x C-j prefix.  Another mode,
`window-number-meta-mode' enables the use of the M- prefix." t)
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line." t)
(window-number-meta-mode 1)


;;** windmove
;; NOTE: If not fast enough, use `window-number.el'
;; NOTE: the default key bindings C-left/right/up/down conflicts
;; with org-mode default key bindings.
(eval-after-load "windmove" '(windmove-postload))

(eal-define-keys-commonly
 global-map
 `(("C-S-<left>" windmove-left)
   ("C-S-<right>" windmove-right)
   ("C-S-<up>" windmove-up)
   ("C-S-<down>" windmove-down)))


;;** buffer-move
;; swap buffers without typing C-x b on each window
(autoload 'buf-move-up "buffer-move" nil t)
(autoload 'buf-move-down "buffer-move" nil t)
(autoload 'buf-move-left "buffer-move" nil t)
(autoload 'buf-move-right "buffer-move" nil t)

(eal-define-keys-commonly
 global-map
 `(("M-S-<up>"    buf-move-up)
   ("M-S-<down>"  buf-move-down)
   ("M-S-<left>"  buf-move-left)
   ("M-S-<right>" buf-move-right)))


;;** Winner mode for window splits
(winner-mode 1)


;;** Windresize
(eal-define-keys-commonly
 global-map
 `(("C-<f5>" windresize)))


;;* Buffer settings

(global-visual-line-mode 1) ;; Wrap line dynamically
(setq word-wrap t)
(setq inhibit-startup-screen t) ;; Do not display starup welcome screen
(setq visible-bell t) ;; Use visible bell instead of bell sound
(setq-default echo-keystrokes 0.1)    ;; Display key strokes quickly
;; (setq chart-face-use-pixmaps t)    ;; Prefer pixmap icons
;; (defalias 'yes-or-no-p 'y-or-n-p)
(fset 'yes-or-no-p 'y-or-n-p)   ;; Use "y-or-n" instead of "yes-or-no"
(if window-system
    (auto-image-file-mode 1)        ;; automatically display images
  (auto-image-file-mode -1))
(global-auto-revert-mode 1)     ;; automatically refresh buffer
(setq sentence-end-double-space nil)
(setq no-redraw-on-reenter t)   ;; Do not redraw on reenter

;; emacs lock
;; (autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)


;;* Fringe settings
(fringe-mode '(nil . 0))
(setq visual-line-fringe-indicators '(left-curly-arrow nil))
(setq-default indicate-buffer-boundaries 'left ;; Display buffer boudaries
              indicate-empty-lines t ;; Indicate empty lines
              overflow-newline-into-fringe t)


;;* mode-line settings

(setq-default ;; Display mode-line the same in non-selected windows
  mode-line-in-non-selected-windows nil)
(column-number-mode 1) ;; Display column number
(size-indication-mode 1) ;; Display the current location in the file
(setq-default mode-line-buffer-identification
              (propertized-buffer-identification "%b"))
(setq display-time-day-and-date t) ;; Display time and date
(display-time-mode 1)
(when is-after-emacs-23
  (display-battery-mode -1)) ;; battery infomation is not necessary


;;** diminish
;; Removing or abbreviating minor mode indicators
(eval-after-load "filladapt" '(diminish 'filladapt-mode))
;; (eval-after-load "icicles" '(diminish 'icicle-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
;; (eval-after-load "linkd" '(diminish 'linkd-mode))
(eval-after-load "simple" '(diminish 'global-visual-line-mode))
(eval-after-load "simple" '(diminish 'visual-line-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))
(eval-after-load "recent-jump" '(diminish 'recent-jump-mode))
(eval-after-load "recent-jump-small" '(diminish 'recent-jump-small-mode))
(eval-after-load "ibus" '(diminish 'ibus-mode))
(eval-after-load "outline" '(diminish 'outline-minor-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "ws-trim" '(diminish 'ws-trim-mode))

;; An function get from newsgroup cn.bbs.comp.emacs
(setq my-default-mode-line-modes mode-line-modes)
(defun my-modeline-format-toggle-minor-modes ()
  "toggle minor modes display on mode-line"
  (interactive)
  (setq my-modeline-format-toggle-minor-modes 'mode-name)
  (if (not (equal mode-line-modes 'mode-name))
      (setq mode-line-modes 'mode-name)
    (setq mode-line-modes my-default-mode-line-modes))
  (force-mode-line-update))
;; (my-modeline-format-toggle-minor-modes)
;; (global-set-key (kbd "<f6> h") 'my-modeline-format-toggle-minor-modes)


;;** modeline-posn
;; (require 'modeline-posn)  ;; Display number of characters in region


;;** hide-mode-line
;; REF: (@url :file-name "http://webonastick.com/emacs-lisp/hide-mode-line.el" :display "Source")
;; NOTE: NOT good for me, cause no screen sapce can be saved
;; (autoload 'hide-mode-line "hide-mode-line" nil t)
;; (hide-mode-line)
;; Don't show mode-line, after all mode-line configureation is done


;;** mode-line-frame
;; offers a frame to show various information
;; Just call `xy/separate-line-frame' to use it.
(eval-after-load "mode-line-frame" '(mode-line-frame-postload))


;;* mini-buffer settings

(setq enable-recursive-minibuffers t)
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
;; (minibuffer-electric-default-mode t) ;; ido or icicles



;;* Menu settings
(defvar menu-bar-rectangle-map
  (let
      ((map (make-sparse-keymap "Rectangle functions")))
    (define-key map [string] (quote ("string insert rectangle" .
                                     string-insert-rectangle)))
    (define-key map [yank] (quote ("yank rectangle" . yank-rectangle)))
    (define-key map [delete] (quote ("delete rectangle" . delete-rectangle)))
    (define-key map [kill] (quote ("kill rectangle" . kill-rectangle)))
    map
    )
  )
(defalias (quote menu-bar-rectangle-map) menu-bar-rectangle-map)
(define-key-after
  (lookup-key global-map [menu-bar edit])
  [rectangle]
  '("Rectangle" . menu-bar-rectangle-map) 'bookmark)


;;* Vaious bar settings

;;** menu-bar
(menu-bar-mode -1) ;; No menu bar as default

;; ;;*** menua-bar+
;; (require 'menu-bar+)

;; ;;*** facemenu+
;; ;; This library enhances the "Text Properties" menu.  It adds menu
;; ;; items to the menu, and provides two different versions of the
;; ;; menu: one for the menu-bar Edit menu (`facemenu-menu') and one for
;; ;; the mouse popup menu (`facemenu-mouse-menu').  In standard library
;; ;; `facemenu.el', these two menus are the same.
;; (require 'facemenu+)


;;** tool-bar
(tool-bar-mode -1)

;; ;;*** tool-bar+
;; (require 'tool-bar+)


;;** scroll related
;; No scroll bar as default
(scroll-bar-mode -1)
(setq scroll-step 10
      scroll-margin 3
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-conservatively 10000
      scroll-preserve-screen-position 'always)


;;** tabbar
;; tab style buffer switch
;; (require 'tabbar)
;; (tabbar-mode 1)
;; (setq tabbar-cycling-scope (quote tabs))
;; (setq tabbar-cycling-scope nil)

;;*** tabbar-ruler
;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar
;; (require 'tabbar-ruler)


;;* Point (cursor) settings
(blink-cursor-mode 1)
(setq x-stretch-cursor t)


;;** bar-cursor
;; 光标由方块变成一个小长条
;; (require 'bar-cursor)
;; (autoload 'bar-cursor-mode "bar-cursor" nil t)
;; (bar-cursor-mode 1)


;;** cursor-change
;; 智能的改变光标形状
;; REF: (@url :file-name "http://emacser.com/cursor-change.htm" :display "emacser")
(autoload 'cursor-change-mode "cursor-change" nil t)
(cursor-change-mode 1)


;;* Mouse settings

;; (mouse-wheel-mode 1)
;; (mouse-sel-mode 1)
(mouse-avoidance-mode 'jump)
(setq mouse-drag-copy-region nil
      mouse-wheel-progressive-speed t
      mouse-wheel-follow-mouse  t ;; scroll window under mouse
      mouse-wheel-scroll-amount '(5 ((shift) . 1) ((control)))
      ;; mouse-autoselect-window 1.0 ;; don't auto select
      mouse-throw-with-scroll-bar nil)
(when (not window-system) (xterm-mouse-mode 1)) ;; Mouse in terminal


;;* Syntax highlighting

;;** font-lock
(eval-after-load "font-lock" '(font-lock-postload))
(global-font-lock-mode 1)
;; 避免打开大的文本文件时反应缓慢
;; BUG: org-mode 显示错误
;; (global-font-lock-mode -1)
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   sh-mode-hook cperl-mode-hook c-common-mode-hook
;;                   vhdl-mode-hook verilog-mode-hook matlab-mode-hook
;;                   org-mode-hook)
;;  '(lambda () (font-lock-mode 1)))


;;** hl-line
;; (global-hl-line-mode 1) ; (if window-system 1 -1)


;;** hi-lock
;; (global-hi-lock-mode 1)
(eal-define-keys
 'hi-lock-map
 `(("C-c H l" highlight-lines-matching-regexp)
   ("C-c H f" hi-lock-find-patterns)
   ("C-c H x" highlight-regexp)
   ("C-c H h" highlight-phrase)
   ("C-c H u" unhighlight-regexp)
   ("C-c H w" hi-lock-write-interactive-patterns)
   ("C-c H a" hi-lock-show-all)))


;;** highlight-symbol
;; 像Eclipse那样高亮光标处单词, 基于hi-lock，方便但是不能保存高亮设置
(eval-after-load "highlight-symbol"
  '(progn
     ;; (highlight-symbol-face-settings)
     (highlight-symbol-postload)))

;; NOTE: C-x H has been binded to `goto-help-buffer'
(eal-define-keys
 `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
   c-mode-base-map c++-mode-map perl-mode-map
   org-mode-map text-mode-map ruby-mode-map html-mode-map)
 `(("C-c H m" highlight-symbol-at-point)
   ("C-c H d" highlight-symbol-remove-all)
   ("C-c H n" highlidght-symbol-next)
   ("C-c H p" highldight-symbol-prev)
   ("C-c H r" highlight-symbol-query-replace)
   ("C-c H N" highlight-symbol-next-in-defun)
   ("C-c H P" highlight-symbol-prev-in-defun)))


;;** smart-hl
;; 像Eclipse那样双击高亮当前字符串
;; NOTE: A part of codepilot which is removed.
;;       Use highlight-symbol-mode instead.
;; (require 'smart-hl)


;; pulse
;; 实现Emacs的淡入淡出效果, is a part of cedet
;; REF: (@url :file-name "http://emacser.com/pulse.htm" :display "Emacser")
;; BUG: face-settings seem not working
(eval-after-load "pulse"
  '(progn
     (pulse-face-settings)
     (pulse-postload)))
(require 'pulse)


;;** zjl-hl
;; use CEDET semantic to highlight function calls
(eval-after-load "zjl-hl"
  '(progn
     (zjl-hl-face-settings)
     (zjl-hl-postload)))


;;* Color settings

;;** generic-x
;; 增加更丰富的高亮
;; (require 'generic-x)


;;** color-theme
;; fancy themes for emacs
;; REF: (@url :file-name "http://emacser.com/color-theme.htm" :display "emacser")
(eval-after-load "color-theme" '(color-theme-postload))
;; (require 'color-theme)
;; (when window-system
;;   (color-theme-solarized-dark))
;; (global-set-key (kbd "<f6> t") 'xy/load-themes)


;;** doremi
;; (eval-after-load "icicles" `(doremi-postload))


;; ;;** palette
;; ;; emacs 的调色板
;; (eval-after-load "palette"
;;   '(progn
;;      (palette-postload)
;;      (eal-define-keys
;;       'palette-mode-map
;;       `(("j"     palette-down)
;;         ("k"     palette-up)
;;         ("h"     palette-left)
;;         ("l"     palette-right)
;;         ("J"     palette-down-quickly)
;;         ("K"     palette-up-quickly)
;;         ("H"     palette-left-quickly)
;;         ("L"     palette-right-quickly)
;;         ("r"     palette-face-restore-bg-fg)
;;         ("f"     palette-set-face-changed-to-foreground)
;;         ("b"     palette-set-face-changed-to-background)
;;         ("B"     facemenup-face-bg-restore)
;;         ("F"     facemenup-face-fg-restore)
;;         ("d"     palette-disply-which-in-changine)
;;         ("m"     palette-pick-background-at-point)
;;         ("C"     palette-copy-current-color)
;;         ("C-x k" palette-quit-restore-bg-fg)))))
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x P p" palette)
;;    ("C-x P f" facemenup-palette-face-fg-at-point)
;;    ("C-x P b" facemenup-palette-face-bg-at-point)))


;;** rainbow-mode
;; displays strings representing colors with the color they represent
;; as background
;; (require 'rainbow-mode)
;; ;; 定义一个全局的 rainbow-mode, by 海猫◎newsmth
;; (define-globalized-minor-mode
;;   global-rainbow-mode
;;   rainbow-mode rainbow-turn-on
;;   :initialize 'custom-initialize-delay
;;   :init-value (not (or noninteractive
;;                        emacs-basic-display))
;;   :group 'rainbow
;;   :version "24")
;; ;; 打开 global-rainbow-mode
;; (global-rainbow-mode)


;;** pp-c-l
;; Display Vontrol-l characters in a pretty way
(eval-after-load "pp-c-l" '(pp-c-l-postload))
(when (try-require 'pp-c-l)
  (pretty-control-l-mode 1))


;;** page-break-mode
;; display a play brake symbol as a horizontal line
;; BUG: NOT working
;; (when (try-require 'page-break-mode)
;;   (turn-on-page-break-mode))
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   sh-mode-hook cperl-mode-hook c-common-mode-hook
;;                   vhdl-mode-hook verilog-mode-hook matlab-mode-hook)
;;  'turn-on-page-break-mode)


(provide 'xy-rcroot-app)
