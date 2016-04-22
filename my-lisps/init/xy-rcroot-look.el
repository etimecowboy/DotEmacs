;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-22 Fri 21:39 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-look.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  Emacs look
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;; Frame settings

;;;; Default frame layout
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

;; (global-set-key (kbd "C-c C-0") 'xy/toggle-fullscreen)
;; (global-set-key (kbd "C-M-o") 'other-frame)
;; (global-set-key (kbd "C-M-c") 'new-frame)
;; (global-set-key (kbd "C-M-k") 'delete-frame)



;;;; Frame title
;; Set frame title display
;; NOTE: `windows.el' and `revive.el' overwirte title

;;;;; setting 1: filename @ process
;; (setq frame-title-format "%f @ %s")
;; (setq frame-title-format
;;       `(,(user-login-name) "@" ,(system-name) "     "
;;         global-mode-string "     %f" ))

;;;;; setting 2:
;; (setq frame-title-format
;;       '((:eval
;;          (let ((login-name (getenv-internal "LOGNAME")))
;;            (if login-name (concat login-name "@") "")))
;;         (:eval (system-name))
;;         ":"
;;         (:eval (or (buffer-file-name) (buffer-name)))))

;;;;; setting 3:
;; (setq frame-title-format
;;       '("%b"
;;         (:eval
;;          (if (buffer-file-name)
;;              (concat " (" (directory-file-name
;;                            (file-name-directory
;;                             (abbreviate-file-name
;;                              (buffer-file-name))))
;;                      ")")
;;            ""))
;;         " - Emacs"))

;;;;; setting 4:
(setq-default frame-title-format
              '(:eval (format "%s@%s: %s %s"
                              (or (file-remote-p default-directory 'user)
                                  user-real-login-name)
                              (or (file-remote-p default-directory 'host)
                                  system-name)
                              (buffer-name)
                              (cond
                               (buffer-file-truename
                                (concat "(" buffer-file-truename ")"))
                               (dired-directory
                                (concat "{" dired-directory "}"))
                               (t
                                "[no file]")))))



;;;; Transparent frame
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/TransparentEmacs" :display "emacswiki")
;;;;; alpha.el
;; sample keybinding for transparency manipulation
;; (global-set-key (kbd "M-?") 'transparency-set-value)
;; the two below let for smooth transparency control
(global-set-key (kbd "C-<f11>") 'transparency-increase)
(global-set-key (kbd "C-<f12>") 'transparency-decrease)



;;;; Resize frame and window
;; BUG: there is a bug in `fit-frame.el' or `thumb-frm.el' which
;;      causes info-mode reports an error when following a link. Have
;;      to load these two lisp files in order to fix it, whether it is
;;      in console mode or GUI mode.
;; NOTE: `autofit-frame.el' may be annoying and cause problem in
;;       terminal mode
;; BUG: `maxframe.el' doesn't work in my laptop Windows 7.(eval-after-load "fit-frame" '(fit-frame-postload))

;; NOTE: it is now no need of addon packages to maximize the emacs
;; frame nor the whole screen. Since 24.4, Emacs `frame.el' provides
;; `toggle-frame-maximized' (ESC-<F10>) and `toggle-frame-fullscreen'
;; (<F11>) to do it.

;; (eval-after-load "maxframe"  '(maxframe-postload))
;; (eval-after-load "autofit-frame" '(autofit-frame-postload))
;; (try-require 'fit-frame)
;; (try-require 'maxframe) ;; NOTE: not stable with two or more monitors
;; ;; (try-require 'frame-cmds)
;; (try-require 'thumb-frm) ;; NOTE: not very useful
;; (try-require 'autofit-frame)

;; (autoload 'fit-frame "fit-frame" nil t)
;; NOTE: not very useful

;; (eal-define-keys-commonly
;;  global-map
;;  `(;; ("S-<f5>"    fit-frame) ;; `fit-frame.el'
;;    ;; ("M-<f11>"    maximize-frame) ;; `maxframe.el'
;;    ;; ("C-<f11>"    restore-frame)  ;; `maxframe.el'
;;    ;; ("M-<f5>"    toggle-max-frame)  ;; `frame-cmds.el'
;;    ;; ("C-M-<f5>"  xy/toggle-autofit-frame) ;; `autofit-frame.el'
;;    ;; ("C-z"     thumfr-toggle-thumbnail-frame) ;; `thumb-frm.el'
;;    ;; ("C-S-z"   thumfr-thumbify-other-frames)
;;    ;; ("C-M-z"   thumfr-fisheye-next-frame)
;;    ;; ("C-M-S-z" thumfr-fisheye-previous-frame)
;;    ));; ;; avoid system maximize window icon conflict with `maxframe.el'
;; ;; (define-key special-event-map [iconify-frame]
;; ;;   'thumfr-thumbify-frame-upon-event)



;;; Window settings

;;;; window-number
;; (autoload 'window-number-mode "window-number"
;;   "A global minor mode that enables selection of windows according to
;; numbers with the C-x C-j prefix.  Another mode,
;; `window-number-meta-mode' enables the use of the M- prefix." t)
;; (autoload 'window-number-meta-mode "window-number"
;;   "A global minor mode that enables use of the M- prefix to select
;; windows, use `window-number-mode' to display the window numbers in
;; the mode-line." t)
;; (window-number-meta-mode 1)

;;;; ace-window
;; configured in xy-rcroot-edit.el



;;;; windmove
;; NOTE: If not fast enough, use `window-number.el' or `ace-window.el'
;; NOTE: the default key bindings C-left/right/up/down conflicts
;; with org-mode default key bindings.
(eval-after-load "windmove" '(windmove-postload))
(eal-define-keys-commonly
 global-map ;; BUG: keybindings do not work in linux console
 `(("<f5> <left>"  windmove-left)
   ("<f5> <right>" windmove-right)
   ("<f5> <up>"    windmove-up)
   ("<f5> <down>"  windmove-down)))



;;;; buffer-move
;; swap buffers without typing C-x b on each window
(autoload 'buf-move-up "buffer-move" nil t)
(autoload 'buf-move-down "buffer-move" nil t)
(autoload 'buf-move-left "buffer-move" nil t)
(autoload 'buf-move-right "buffer-move" nil t)
(eal-define-keys-commonly
 global-map ;; not work in linux console
 `(("M-S-<up>"    buf-move-up)
   ("M-S-<down>"  buf-move-down)
   ("M-S-<left>"  buf-move-left)
   ("M-S-<right>" buf-move-right)))



;;;; Winner mode for window splits
(winner-mode 1)



;;;; Windsize
(autoload 'windsize-left "windsize" nil t)
(autoload 'windsize-right "windsize" nil t)
(autoload 'windsize-up "windsize" nil t)
(autoload 'windsize-down "windsize" nil t)
(eal-define-keys-commonly
 global-map
 `(("<f8> <left>"  windsize-left)
   ("<f8> <right>" windsize-right)
   ("<f8> <up>"    windsize-up)
   ("<f8> <down>"  windsize-down)))



;;;; win-switch
;; NOTE: the idle time makes it not good
;; (eval-after-load "windmove" '(windmove-postload))
;; (when (try-require 'win-switch)
;;   (global-set-key "\C-xo" 'win-switch-dispatch))
;; ;;    + i window above the current window.
;; ;;    + k window below the current window.
;; ;;    + j window left of the current window.
;; ;;    + l window right of the current window.
;; ;;    + o cycle forward through the window list in the current frame.
;; ;;    + p cycle backward through the window list in the current frame.
;; ;;    + SPACE cycles among existing frames.
;; ;;    + u (and RETURN) exit window switching mode.
;; ;;    + I and K vertically enlarge and shrink the current window, respectively.
;; ;;    + L and J horizontally enlarge and shrink the current window, respectively.
;; ;;    + h and ; split the current window, horizontally and vertically, respectively.
;; ;;    + ESCAPE acts as an "emergency" exit



;;;; popwin
(eval-after-load "popwin" '(popwin-postload))
(when (try-require 'popwin)
  (popwin-mode 1)
  (global-set-key (kbd "<f2> o") popwin:keymap))
;; NOTE: popwin:keymap + key
;; | Key    | Command                               |
;; |--------+---------------------------------------|
;; | b      | popwin:popup-buffer                   |
;; | l      | popwin:popup-last-buffer              |
;; | o      | popwin:display-buffer                 |
;; | C-b    | popwin:switch-to-last-buffer          |
;; | C-p    | popwin:original-pop-to-last-buffer    |
;; | C-o    | popwin:original-display-last-buffer   |
;; | SPC    | popwin:select-popup-window            |
;; | s      | popwin:stick-popup-window             |
;; | 0      | popwin:close-popup-window             |
;; | f, C-f | popwin:find-file                      |
;; | e      | popwin:messages                       |
;; | C-u    | popwin:universal-display              |
;; | 1      | popwin:one-window                     |



;;; Buffer settings

(global-visual-line-mode nil) ;; use logical line, not viusal line
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



;;; Fringe settings
(fringe-mode '(nil . 0))
(setq visual-line-fringe-indicators '(left-curly-arrow nil))
(setq-default indicate-buffer-boundaries 'left ;; Display buffer boudaries
              indicate-empty-lines t ;; Indicate empty lines
              overflow-newline-into-fringe t)



;;; mode-line settings
;; Display mode-line the same in non-selected windows
(setq-default mode-line-in-non-selected-windows nil)
(column-number-mode 1) ;; Display column number
(size-indication-mode 1) ;; Display the current location in the file
;; (setq-default mode-line-buffer-identification
;;               (propertized-buffer-identification "%b"))
(setq display-time-day-and-date nil) ;; Display only time but not date
(display-time-mode -1)
;; (Laptop (display-battery-mode 1)) ;; when is-after-emacs-23



;;;; diminish
;; Removing or abbreviating minor mode indicators
(eval-after-load "filladapt" '(diminish 'filladapt-mode))
(eval-after-load "highlight-symbol" '(diminish 'highlight-symbol-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
;; (eval-after-load "linkd" '(diminish 'linkd-mode))
;; (eval-after-load "simple" '(diminish 'global-visual-line-mode))
(eval-after-load "simple" '(diminish 'visual-line-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
;; (eval-after-load "flyspell" '(diminish 'flyspell-mode))
;; (eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "autopair" '(diminish 'autopair-mode))
;; (eval-after-load "hideshow" '(diminish 'hs-minor-mode))
;; (eval-after-load "outline" '(diminish 'outline-minor-mode))
;; (eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
;; (eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
;; (eval-after-load "ws-trim" '(diminish 'ws-trim-mode))
;; (eval-after-load "skeleton-complete" '(diminish 'skeleton-complete-mode))
(eval-after-load "auto-dim-other-buffers" '(diminish 'auto-dim-other-buffers-mode))
(eval-after-load "fic-mode" '(diminish 'fic-mode))
(eval-after-load "face-remap" '(diminish 'buffer-face-mode))
;; (eval-after-load "back-button" '(diminish 'back-button-mode))
;; (eval-after-load "helm" '(diminish 'helm-mode))
;; (eval-after-load "company" '(diminish 'company-mode))



;;;; modeline-posn
;; (try-require 'modeline-posn)  ;; Display number of characters in region



;;;; hide-mode-line
;; REF: (@url :file-name "http://webonastick.com/emacs-lisp/hide-mode-line.el" :display "Source")
;; NOTE: NOT good for me, cause no screen sapce can be saved
(autoload 'hide-mode-line "hide-mode-line" nil t)
;; (hide-mode-line)
;; Don't show mode-line, after all mode-line configureation is done



;;;; mode-line-frame
;; offers a frame to show various information
;; Just call `xy/separate-line-frame' to use it.
;; (eval-after-load "mode-line-frame" '(mode-line-frame-postload))
;; (global-set-key (kbd "<f2> f") 'xy/separate-line-frame)

;;;; modeline face
;; (set-face-background 'modeline "grey90")
;; (set-face-background 'modeline-inactive "grey60")

;;;; smart-mode-line
(eval-after-load "smart-mode-line" '(smart-mode-line-postload))
(global-set-key (kbd "<f2> m") 'xy/sml-setup)
;; (xy/sml-setup)



;;; mini-buffer settings
(setq enable-recursive-minibuffers t)
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
;; (minibuffer-electric-default-mode t) ;; ido or icicles



;;; Menu settings
(defvar menu-bar-rectangle-map
  (let
      ((map (make-sparse-keymap "Rectangle functions")))
    (define-key map [string] (quote ("string insert rectangle" .
                                     string-insert-rectangle)))
    (define-key map [yank] (quote ("yank rectangle" . yank-rectangle)))
    (define-key map [delete] (quote ("delete rectangle" . delete-rectangle)))
    (define-key map [kill] (quote ("kill rectangle" . kill-rectangle)))
    map))
(defalias (quote menu-bar-rectangle-map) menu-bar-rectangle-map)
(define-key-after
  (lookup-key global-map [menu-bar edit])
  [rectangle]
  '("Rectangle" . menu-bar-rectangle-map) 'bookmark)



;;; Vaious bar settings

;;;; menu-bar
(menu-bar-mode -1)
(global-set-key (kbd "M-<f10>") 'menu-bar-mode)

;; ;;;;; menua-bar+
;; (require 'menu-bar+)

;; ;;;;; facemenu+
;; ;; This library enhances the "Text Properties" menu.  It adds menu
;; ;; items to the menu, and provides two different versions of the
;; ;; menu: one for the menu-bar Edit menu (`facemenu-menu') and one for
;; ;; the mouse popup menu (`facemenu-mouse-menu').  In standard library
;; ;; `facemenu.el', these two menus are the same.
;; (require 'facemenu+)



;;;; tool-bar
(tool-bar-mode -1)
(global-set-key (kbd "C-<f10>") 'tool-bar-mode)

;; ;;;;; tool-bar+
;; (require 'tool-bar+)



;;;; scroll related
(scroll-bar-mode -1) ;; No vertical scroll bar
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1)) ;; Never show horizontal scroll bar
(setq scroll-step 1
      scroll-margin 3
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-conservatively 10000
      scroll-preserve-screen-position 'always)



;;;; tabbar NOTE: not very useful
;; tab style buffer switch
;; (require 'tabbar)
;; (tabbar-mode 1)
;; (setq tabbar-cycling-scope (quote tabs))
;; (setq tabbar-cycling-scope nil)

;;;;; tabbar-ruler NOTE: not very useful
;; (setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
;; (setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;; (setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;; (setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar
;; (require 'tabbar-ruler)



;;; Point (cursor) settings
(blink-cursor-mode 1)
(setq x-stretch-cursor t)



;;;; bar-cursor
;; 光标由方块变成一个小长条
;; (require 'bar-cursor)
(autoload 'bar-cursor-mode "bar-cursor" nil t)
;; (bar-cursor-mode 1)



;;;; cursor-change
;; 智能的改变光标形状
;; REF: (@url :file-name "http://emacser.com/cursor-change.htm" :display "emacser")
;; (autoload 'cursor-change-mode "cursor-change" nil t)
;; (cursor-change-mode 1) ;; 细细的找不着



;;; Mouse settings

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

(eal-define-keys-commonly
 global-map
 `(("<S-down-mouse-1>" mouse-drag-drag)
   ("<down-mouse-1>"  mouse-drag-region)))



;;; Syntax highlighting

;;;; font-lock
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

;;;; fic-mode
(eval-after-load "fic-mode" '(fic-mode-postload))
;; NOTE: have some problem
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  sh-mode-hook cperl-mode-hook c-common-mode-hook
                  vhdl-mode-hook verilog-mode-hook matlab-mode-hook
                  LaTeX-mode-hook)
 'xy/turn-on-fic-mode)




;;;; hl-line
;; (global-hl-line-mode 1) ; (if window-system 1 -1)



;;;; hi-lock
;; (global-hi-lock-mode 1)
(eal-define-keys
 'hi-lock-map
 `(("C-c l l" highlight-lines-matching-regexp)
   ("C-c l f" hi-lock-find-patterns)
   ("C-c l x" highlight-regexp)
   ("C-c l h" highlight-phrase)
   ("C-c l u" unhighlight-regexp)
   ("C-c l w" hi-lock-write-interactive-patterns)
   ("C-c l a" hi-lock-show-all)))



;;;; highlight-symbol
;; 像Eclipse那样高亮光标处单词, 基于hi-lock，方便但是不能保存高亮设置
(eval-after-load "highlight-symbol"
  '(progn
     ;; (highlight-symbol-face-settings)
     (highlight-symbol-postload)))
(global-set-key (kbd "<f6> L") 'global-highlight-symbol-mode)
 
;; NOTE: C-x H has been binded to `goto-help-buffer'
;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
;;    c-mode-base-map c++-mode-map perl-mode-map matlab-mode-map
;;    ruby-mode-map html-mode-map)
;;  `(("C-c l m" highlight-symbol)
;;    ("C-c l k" highlight-symbol-remove-all)
;;    ("C-c l n" highlidght-symbol-next)
;;    ("C-c l p" highldight-symbol-prev)
;;    ("C-c l %" highlight-symbol-query-replace)
;;    ("C-c l N" highlight-symbol-next-in-defun)
;;    ("C-c l P" highlight-symbol-prev-in-defun)))
(eal-define-keys-commonly
 global-map
 `(("C-c l m" highlight-symbol)
   ("C-c l k" highlight-symbol-remove-all)
   ("C-c l n" highlidght-symbol-next)
   ("C-c l p" highldight-symbol-prev)
   ("C-c l %" highlight-symbol-query-replace)
   ("C-c l N" highlight-symbol-next-in-defun)
   ("C-c l P" highlight-symbol-prev-in-defun)))
;; (eal-define-keys
;;  'highlight-symbol-mode-map
;;  `(("C-c l m" highlight-symbol)
;;    ("C-c l k" highlight-symbol-remove-all)
;;    ("C-c l n" highlidght-symbol-next)
;;    ("C-c l p" highldight-symbol-prev)
;;    ("C-c l %" highlight-symbol-query-replace)
;;    ("C-c l N" highlight-symbol-next-in-defun)
;;    ("C-c l P" highlight-symbol-prev-in-defun)))



;;;; smart-hl
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
(try-require 'pulse)



;;;; Zjl-hl
;; use CEDET semantic to highlight function calls
;; (eval-after-load "zjl-hl"
;;   '(progn
;;      (zjl-hl-face-settings)
;;      (zjl-hl-postload)))



;;; Color & face settings

;;;; generic-x
;; 增加更丰富的高亮
;; (require 'generic-x)



;;;; color-theme
;; NOTE: too old, too bugy. >emacs24.2 has built-in theme support.
;; fancy themes for emacs
;; REF: (@url :file-name "http://emacser.com/color-theme.htm" :display "emacser")
;; (eval-after-load "color-theme" '(color-theme-postload))
;; (require 'color-theme)
;; (when window-system
;;   (color-theme-solarized-dark))
;; (global-set-key (kbd "<f2> t") 'xy/load-themes)

;; (when window-system  
;;   (Windows ;; windows system should use the dark theme for eye protection
;;    (color-theme-solarized-dark))
;;   ;; (Linux ;; I am now using ~/.Xresources to set system-wide theme in Linux
;;   ;;  (color-theme-solarized-dark))
;; )

;;;; Emacs built-in color system
;; NOTE: two most popular color-theme: zenburn (low contrast for long
;; time work at the screen) and solarized (for same color setting on
;; dark and bright background)
;; - zenburn
;;   + `zenburn-theme': official zenburn color setting (my choise)
;;   + `nzenburn': a home brew zenburn theme (out dated)
;;   + `hc-zenburn-theme': a higher contrast zenburn theme
;; - solarized
(setq custom-safe-themes t)
;; don't load any color theme when starting emacs
;; (when (and window-system (try-require 'solarized-dark-theme))
;;   (load-theme 'solarized-dark t))
(when window-system
    ;; (when (try-require 'solarized-dark-theme)
    ;;   (load-theme 'solarized-dark t)))
    (when (try-require 'zenburn-theme)
      (load-theme 'zenburn t)))

(global-set-key (kbd "<f2> c") 'load-theme) ;; NOTE: default key C-x 6 c
(global-set-key (kbd "<f2> C") 'disable-theme)

;; (Windows
;;  (when (try-require 'color-theme-sanityinc-solarized)
;;    (load-theme 'sanityinc-solarized-dark t)))
;; (when (and window-system (try-require 'color-theme-sanityinc-tomorrow))
;;    (load-theme 'sanityinc-tomorrow-night t))

;;;;; load a fresh color-theme instead on overwrite current color-theme
;; REF: http://emacs.stackexchange.com/questions/3112/how-to-reset-color-theme
;; Advise load-theme, so that it first disables all custom themes
;; before loading (enabling) another one. 
;;
;; However, when using together with `smart-mode-line', I want the
;; overwrite behave. Then, I must use the `disable-theme' function
;; (<f2> C) to manually undo the customization.
;;
;; (Defadvice load-theme (before theme-dont-propagate activate)
;;   (mapcar #'disable-theme custom-enabled-themes))



;;;; auto-dim-other-buffers
(eval-after-load "auto-dim-other-buffers"
  '(auto-dim-other-buffers-postload))
(when (try-require 'auto-dim-other-buffers)
  (auto-dim-other-buffers-mode 1))



;;;; doremi
;; (eval-after-load "icicles" `(doremi-postload))



;; ;;;; palette
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



;;;; rainbow-mode
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



;;;; pp-c-l
;; Display Vontrol-l characters in a pretty way
;; NOTE: C-L will be printed as page seperation
(eval-after-load "pp-c-l" '(pp-c-l-postload))
(autoload 'pretty-control-l-mode "pp-c-l" nil t)
(global-set-key (kbd "<f6> p") 'pretty-control-l-mode)
(am-add-hooks
 `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
                  sh-mode-hook cperl-mode-hook c-common-mode-hook
                  vhdl-mode-hook verilog-mode-hook matlab-mode-hook
                  org-mode-hook LaTeX-mode-hook python-mode-hook)
 'xy/turn-on-pretty-control-l-mode)



;;;; page-break-mode
;; display a play brake symbol as a horizontal line
;; BUG: NOT working
;; (when (try-require 'page-break-mode)
;;   (turn-on-page-break-mode))
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   sh-mode-hook cperl-mode-hook c-common-mode-hook
;;                   vhdl-mode-hook verilog-mode-hook matlab-mode-hook)
;;  'turn-on-page-break-mode)



;;; *Scratch* buffer settings
;; Change default major mode of *scratch* buffer
(setq initial-major-mode 'text-mode)

;; Change default text in the *scratch* buffer
;; NOTE: a warnning message is nessary for emacs fans like me
(setq-default initial-scratch-message "")



;;; Font settings

;; (defun xy/set-font-default ()
;;   "Set Emacs font."
;;   (interactive)
;;   (GNULinux
;;    (xy/set-font-and-scale 10.5 1.2))
;;   (Windows
;;    (xy/set-font-and-scale 10 1.22)))

;; If emacs daemon is in use
;; (if (and (fboundp 'daemonp) (daemonp))
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (xy/set-font-default)
;;                   ;; (xy/set-font-prog)
;;                   (load-theme 'zenburn t)
;;                   )))
;;   (xy/set-font-default)
;;   ;; (xy/set-font-prog)
;;   )

(eal-define-keys-commonly
 global-map
 `(("<f2> d" xy/set-font-default)
   ;; ("<f2> m" xy/set-font-Monofur-STHeiti)
   ("<f2> w" xy/set-font-write)
   ("<f2> g" xy/set-font-prog)
   ("<f2> W" xy/set-font-write-big)
   ("<f2> G" xy/set-font-prog-big)
   ;;------------------------------------

   ;; ("C-+"    bhj-text-scale-increase)
   ;; ("C--"    bhj-text-scale-decrease)
   ;; NOTE: default text scaling ("C-x C-=" and "C-x C--")
   ;; ("C-M-="  increase-default-font-height)
   ;; ("C-M--"  decrease-default-font-height)
   ))
(xy/set-font-default)
(xy/set-font-prog-big)

;;;; Automatically set fonts for different modes
;; NOTE: a pain to my eyes
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook cc-mode-hook c-mode-hook
;;    c++-mode-hook sh-mode-hook vhdl-mode-hook verilog-mode-hook
;;    matlab-mode-hook)
;;  'xy/set-font-prog)
;; (am-add-hooks
;;  `(LaTeX-mode-hook latex-mode-hook tex-mode-hook
;;    muse-mode-hook
;;    w3m-mode-hook Info-mode-hook
;;    ;; org-mode-hook ;; NOTE: not to bother me when capturing notes
;;    gnus-startup-hook mew-summary-mode-hook)
;;  'xy/set-font-write)



;;;; Zoom fonts by mouse wheel

;;;;; Use emacs internal functions
(GNULinux 
 (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase) 
 (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease))
(Windows
 (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase) 
 (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease))

;;;;; Use bhj's list of font sizes that lead to nicely alignment of Latin
;; and Chinese characters.
;; NOTE: Cannot use other fonts
;; (GNULinux 
;;  (global-set-key (kbd "<C-mouse-4>") 'bhj-text-scale-increase) 
;;  (global-set-key (kbd "<C-mouse-5>") 'bhj-text-scale-decrease))
;; (Windows
;;  (global-set-key (kbd "<C-wheel-up>")   'bhj-text-scale-increase) 
;;  (global-set-key (kbd "<C-wheel-down>") 'bhj-text-scale-decrease))

;;;; Global font size scale
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/GlobalTextScaleMode" :display "GlobalTextScaleMode")
;; NOTE: Only for exsiting buffers.
;;       The font size of new buffers is not changed.
;; (defadvice text-scale-increase
;;   (around all-buffers (arg) activate)
;;   (dolist (buffer (buffer-list))
;;     (with-current-buffer buffer
;;       ad-do-it)))
;; (defadvice text-scale-decrease
;;   (around all-buffers (arg) activate)
;;   (dolist (buffer (buffer-list))
;;     (with-current-buffer buffer
;;       ad-do-it)))



(provide 'xy-rcroot-look)
