;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-04-27 Mon 14:05 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-env.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My Emacs environment settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils) ;; `header' for all



;;; user information
(setq user-full-name "Xin Yang")
(setq user-mail-address "xin2.yang@gmail.com")



;;; local custom file
;; Emacs generated customization, which overwrites settings above
(add-to-list 'load-path my-var-path)
(setq custom-file (expand-file-name "xy-rc-custom.el" my-emacs-path))
(load custom-file) ;; NOTE: Remove '(session-use-package t nil (session)))



;;; pathes

;; load-path
;; NOTE: add all = very slow
(fni/add-to-load-path my-emacswiki-lisp-path)
(fni/add-to-load-path my-local-lisp-path 'with-subdirs 'recursive)
(fni/add-to-load-path my-git-lisp-path 'with-subdirs 'recursive)
(fni/add-to-load-path my-own-lisp-path 'with-subdirs 'recursive)
(delete-dups load-path)

;; image-path
(fni/add-to-image-load-path my-local-image-path
                            'with-subdirs 'recursive)
(delete-dups image-load-path)

;; exec-path
(add-to-list 'exec-path (expand-file-name my-local-exec-path))
(Windows
 (add-to-list 'exec-path (expand-file-name
                          (concat my-local-exec-path "/win32")))
 (add-to-list 'exec-path (expand-file-name
                          (concat my-local-exec-path "/win64")))
 (add-to-list 'exec-path (concat my-local-exec-path
                                 "/win32/aspell/bin"))
 ;; (add-to-list 'exec-path (expand-file-name
 ;;                          (concat my-local-exec-path "/win32/hunspell")))
 ;; (add-to-list 'exec-path (expand-file-name
 ;;                          (concat my-local-exec-path "/win32/stunnel")))
 )
;; NOTE: Linux don't need it
(GNULinux
  ;; (setenv "PATH" (concat
  ;;      "C:/PROGRA~1/MATLAB/R2011a/bin/win64;" (getenv "PATH")))
  (add-to-list 'exec-path (getenv "PATH"))
  (add-to-list 'exec-path (expand-file-name
                           (concat my-local-exec-path "/lin64"))))
(delete-dups exec-path)

;; Info files
;; NOTE: auto-customised by setting `Info-additional-directory-list'
;;   (add-to-list 'Info-additional-directory-list "~/.emacs.d/info")
;; But seems not working
(add-to-list 'Info-default-directory-list my-local-info-path)
;; Man files
;; NOTE: additional manual(man) pathes are added in `woman-postload'
(delete-dups Info-default-directory-list)



;;; more lisp packages
;; NOTE: There is a (@url :file-name "https://github.com/emacsmirror" :display "Github site")
;;       which has a lot of emacs git sources. You can always check it.

;;;; EmacsWiki lisps

;; NOTE: don't load all the emacswiki lisps, they might cause
;; conflictions with other lisps
;; ;; Download from emacswiki, via `auto-install'
(xy/load-autoloads my-emacswiki-lisp-path)



;;;; downloaded lisps
;; Packages with version numbers are stable releases, while
;; packages without version numbers are development versions

;;*** Single files

(xy/load-autoloads my-local-lisp-path)

;;*** ac-math
;; REF: (@url :file-name "http://code.google.com/p/ac-math/" :display "SVN Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/ac-math"))

;;*** auctex
;; REF: (@url :file-name "http://www.gnu.org/s/auctex/" :display "CVS Source")
;; (add-to-list 'load-path (concat my-local-lisp-path "/auctex"))
;; (load "auctex.el" nil t t)           ;; auctex
;; (load "preview-latex.el" nil t t)    ;; preview-latex

;; NOTE: 1. I am using cvs `auctex' instead of the old ELPA one.
;;
;;       2. The auctex style file
;;            `~/.emacs.d/lisps/auctex/style/url.el'
;;          conflicts with the standard `url.el'.
;; (setq load-path (remove
;;                  (expand-file-name "~/.emacs.d/lisps/auctex-11.87/style")
;;                  load-path))

;;*** cc-mode
;; REF:  (@url :file-name "http://cc-mode.sourceforge.net/" :display "Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/cc-mode-5.32.3"))

;;*** cedet
;; REF: (@url :file-name "http://cedet.sourceforge.net/" :display "CVS Source")
;; NOTE: CEDET can be installed by its `cedet-built.el' script, and
;; will be load when `M-x xy/cedet-start' which is a function write
;; by myself.
;; ;; 禁止emacs24.1内部自带的cedet
;; ;; C-h v load-path 检查是否去掉emacs内置cedet 
;; (setq load-path (remove "/usr/local/share/emacs/cedet" load-path))
;; (setq load-path (remove "/usr/local/share/emacs/24.1/lisp/cedet"
;;                         load-path))

;;*** command-log-mode (Inactive git source)
;; REF: (@url :file-name "https://github.com/lewang/command-log-mode" :display "Git Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/command-log-mode"))

;;*** dea
;; REF: (@url :file-name "http://code.google.com/p/dea/" :display "SVN Source")
(xy/load-autoloads (concat my-local-lisp-path "/dea"))

;;*** eim (Inactive git source)
;; REF: - (@url :file-name "https://github.com/viogus/eim" :display "Website")
;;      - (@url :file-name "http://ywb-codes.googlecode.com/svn/trunk/emacs/eim" :display "Git Source")
(xy/load-autoloads (concat my-local-lisp-path "/eim-2.4"))

;;*** emacs-w3m
;; REF: (@url :file-name "http://emacs-w3m.namazu.org/index-en.html" :display "CVS Source")
;; NOTE: w3m can work better on CJK encodings with these lisp libs.
;; Current CVS lisp `w3m-ucs.el' cause error when byte compiled.
;; NOTE: use ELPA package instead, remember to remove `w3m-ucs.el'
;; (xy/load-autoloads (concat my-local-lisp-path "/elib-1.0"))
;; (xy/load-autoloads (concat my-local-lisp-path "/mule-ucs-20061127-1/lisp"))
;; (xy/load-autoloads (concat my-local-lisp-path "/emacs-w3m/shimbun"))
;; (xy/load-autoloads (concat my-local-lisp-path "/emacs-w3m"))

;;*** google-weather-el (Inactive git source)
;; REF: (@url :file-name "http://git.naquadah.org/?p=google-weather-el.git;a=summary" :display "Git Source")
;; NOTE: goodle has disabled its weather api
;; (xy/load-autoloads (concat my-local-lisp-path "/google-weather-el"))

;;*** hideshow-org (Inactive git source, strange error)
;; REF: (@url :file-name "https://github.com/secelis/hideshow-org" :display "Git Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/hideshow-org"))

;;*** ibus-el
;; REF: (@url :file-name "https://launchpad.net/ibus.el" :display "Brz Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/ibus-el-0.3.2"))

;;*** mailcrypt
;; REF: (@url :file-name "http://mailcrypt.sourceforge.net/" :display "Source")
;; NOTE: too old
;; (xy/load-autoloads (concat my-local-lisp-path "/mailcrypt-3.5.8"))

;;*** matlab-emacs
;; REF: (@url :file-name "http://matlab-emacs.sourceforge.net/" :display "CVS Source")
(xy/load-autoloads (concat my-local-lisp-path "/matlab-emacs"))

;;*** mew
;; REF: (@url :file-name "http://www.mew.org/en/" :display "Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/mew-6.5"))

;;*** org-html5presentation (Inactive git source. Many forks avaliable for tests)
;; HTML5 Presentation export for Org-mode
;; REF: (@url :file-name "https://gist.github.com/509761" :display "kinjo's original Git Source")

;;;*** mo-git-blame
;; REF: (@url :file-name "https://github.com/mbunkus/mo-git-blame" :display "Git Source")
;; (xy/load-autoloads (concat my-local-lisp-path "mo-git-blame"))

;;*** elscreen
;; REF:  (@url :file-name "https://github.com/knu/elscreen" :display "Git Source")
;; NOTE: `elscreen-gf.el' and `elscreen-wl.el' are removed
;; (xy/load-autoloads (concat my-local-lisp-path "/elscreen"))

;;*** ido-ubiquitous
;; REF:  (@url :file-name "https://github.com/DarwinAwardWinner/ido-ubiquitous" :display "Git Source")
;; NOTE: Use ELPA package now
;; (xy/load-autoloads (concat my-local-lisp-path "/ido-ubiquitous-1.7"))

;;*** git-wip
;; REF: (@url :file-name "https://github.com/bartman/git-wip" :display "Git Source")
;; NOTE: git-wip vs magit-wip
(xy/load-autoloads (concat my-local-lisp-path "/git-wip"))

;;*** o-blog
;; REF: (@url :file-name "https://github.com/renard/o-blog" :display "Git Source")
;;      (@url :file-name "http://renard.github.com/o-blog/index.html" :display "Website")
;; NOTE: ELPA package does not work now
;; (xy/load-autoloads (concat my-local-lisp-path "/o-blog-1.2"))
(xy/load-autoloads (concat my-local-lisp-path "/o-blog-2.6/lisp"))

;;;; rebuild Emacs configuration
(global-set-key (kbd "C-x B") 'xy/emacs-build)


;;;; git submodules

;;*** anything-config
;; REF: (@url :file-name "http://repo.or.cz/w/anything-config.git" :display "Git Source")
;; NOTE: use ELPA helm package instead
;; (xy/load-autoloads (concat my-git-lisp-path "/anything-config"))
;; (xy/load-autoloads (concat my-git-lisp-path "/anything-config/extensions"))
;; (xy/load-autoloads (concat my-git-lisp-path "/anything-config/contrib"))

;;*** fuzzy-el (ELPA)
;; REF: (@url :file-name "https://github.com/m2ym/fuzzy-el" :display "Git Source")
;; NOTE: MUST before `auto-complete'
;; (xy/load-autoloads (concat my-git-lisp-path "/fuzzy-el"))

;;*** popup-el (ELPA)
;; REF: (@url :file-name "https://github.com/m2ym/popup-el" :display "Git Source")
;; NOTE: MUST before `auto-complete'
;; (xy/load-autoloads (concat my-git-lisp-path "/popup-el"))

;;*** auto-complete (ELPA)
;; ;; REF: (@url :file-name "http://cx4a.org/software/auto-complete/" :display "Website")
;; ;;      (@url :file-name "https://github.com/m2ym/auto-complete" :display "Git Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/auto-complete"))

;;*** predictive (NOT used)
;; REF: (@url :file-name "http://www.dr-qubit.org/emacs.php#predictive" :display "Git Source")
;; NOTE: I have very slow git connection with it, then a git submodule
;; is not possible
;; NOTE: It makes emacs quite slow. I don't like it.
;; (xy/load-autoloads (concat my-local-lisp-path "/predictive"))

;;*** babel (NOT used)
;; ;; REF: (@url :file-name "https://github.com/juergenhoetzel/babel" :display "Git Source")
;; (xy/load-autoloads (concat my-local-lisp-path "/babel"))

;;*** egg (NOT used)
;; ;; REF: (@url :file-name "https://github.com/bogolisk/egg" :display "Git Source")
;; ;; NOTE: Use `magit' instead of it.
;; (xy/load-autoloads (concat my-local-lisp-path "/egg"))

;;*** o-blog
;; REF: (@url :file-name "https://github.com/renard/o-blog" :display "Git Source")
;;      (@url :file-name "http://renard.github.com/o-blog/index.html" :display "Website")
;; NOTE: use ELPA package instead.
;; (xy/load-autoloads (concat my-git-lisp-path "/o-blog"))

;;*** org2blog
;; REF: (@url :file-name "https://github.com/punchagan/org2blog" :display "Git Source")
;; NOTE: use ELPA package instead.
;; (xy/load-autoloads (concat my-git-lisp-path "/org2blog"))

;;*** google-maps (ELPA)
;; REF: (@url :file-name "http://git.naquadah.org/?p=google-maps.git;a=summary" :display "Git Source")
;; (xy/load-autoloads (concat my-git-lisp-path "/google-maps"))

;;*** whizzytex (NOT used)
;; REF: (@url :file-name "http://cristal.inria.fr/whizzytex/" :display "Source")
;; NOTE: NOT very useful, bad Chinese support
;; (xy/load-autoloads (concat my-git-lisp-path "/whizzytex/src"))

;;*** weibo (NOT used)

;;*** dictionary
;; REF: (@url :file-name "https://github.com/myrkr/dictionary-el" :display "Git Source")
;; (xy/load-autoloads (concat my-git-lisp-path "dictionary"))
;; (fni/add-to-load-path (concat my-git-lisp-path "dictionary"))



;; NOTE: NOT work
;; (xy/load-autoloads (concat my-local-lisp-path "/weibo"))

;;*** magit (ELPA)
;; REF: (@url :file-name "https://github.com/magit/magit" :display "Git Source")
;; NOTE: use ELPA package instead.
;; (xy/load-autoloads (concat my-local-lisp-path "/magit"))

;;*** wanderlust (NOT used)
;; REF: (@url :file-name "https://github.com/wanderlust" :display "GIT Source")
;; NOTE:
;;      1. apel, flim, semi, and mule-ucs are very old packages.
;;
;;      2. These packages are closly related. They are widely used by
;;         Japanese developers that developed `mew', `wanderlust',
;;         `emacs-w3m', and etc.
;;
;;      3. Some lisps cause errors while byte-compiled, and their
;;         backup are "~/.emacs.d/backup/apel-bug.tar.gz".
;;
;;      4. flim has a lisp `mailcap.el' which shadows the emacs
;;         `mailcap.el'. It has been moved to
;;         "~/.emacs.d/backup/flim.bug.tar.gz".
;;
;;      5. Just put these packages in the load-path. Other lisps can
;;         load them when required.
;;
;;      6. No need to have a git submodule for them. I don't upgrade
;;         them very often.
;; NOTE:
;;      It seems being supported by ELPA mew & w3m packages, no need
;;      to keep them any more.
;; (xy/load-autoloads (concat my-local-lisp-path "/apel"))
;; (xy/load-autoloads (concat my-local-lisp-path "/flim"))
;; (xy/load-autoloads (concat my-local-lisp-path "/semi"))
;; (xy/load-autoloads (concat my-local-lisp-path "/wanderlust")))



;;;; ELPA packages
;; Packages installed via `package.el'.
;; `package.el' is now part of GNU Emacs 24. You can get the
;; latest at http://bit.ly/pkg-el while the last version that's
;; compatible with Emacs 23 is at http://bit.ly/pkg-el23
(global-set-key (kbd "S-<f1>") 'list-packages)



;;;; my lisps
;; Include init files and my own hacks, make sure they are installed
;; at last to make my hacks work.
(xy/install-lisps my-own-lisp-path 'with-subdirs 'recursive)



;; NOTE: Another scheme for managing Emacs configurations
;; REF: - (@url :file-name "http://www.emacswiki.org/emacs/DotEmacsModular" :display "emacswiki")
;;      - (@url :file-name "http://www.emacswiki.org/emacs/elinstall" :display "emacswiki")
;; (autoload 'my-site-start "my-site-start" nil t)
;; (my-site-start "~/.emacs.d/site-start.d/")

;; NOTE: el-get is another apporach



;;; help system customisation

;;;; Info
(eval-after-load "info"
  '(progn
     (info-postload)
     ))
;; (require 'info+) ;; NOTE: not very useful
;; (apply-args-list-to-fun
 ;; 'def-command-max-window `("info"))
(global-set-key (kbd "C-<f1>") 'info)



;;;; Man
(eval-after-load "man"
  '(progn
     (man-postload)
     ))
(global-set-key (kbd "M-<f3>") 'man-follow)
;; (eal-define-keys
;;  `(c-mode-base-map sh-mode-map)
;;  `(("C-c /" man-current-word)))

;;*** woman settings
(eval-after-load "woman" '(woman-postload))
(global-set-key (kbd "M-<f1>") 'woman)



;;;; help
(eval-after-load "help-mode"
  '(progn
     (help-mode-postload)
     ))
;; (global-set-key (kbd "C-x H") 'goto-help-buffer)

;;*** help+
;; (require 'help+) ;; NOTE: not very useful
;;    `C-h u'      `manual-entry'
;;    `C-h C-a'    `apropos'
;;    `C-h C-l'    `locate-library'
;;    `C-h RET'    `help-on-click/key'
;;    `C-h M-a'    `apropos-documentation'
;;    `C-h M-o'    `pop-to-help-toggle'
;;    `C-h C-M-a'  `tags-apropos'
;;    [mouse-1]    `mouse-help-on-click' (non-mode-line)
;;    [mouse-1]    `mouse-help-on-mode-line-click' (mode-line)
;; (global-set-key (kbd "<f1>") 'help-on-click/key)

;;*** describe-symbol
;; ahei 非常方便的查看emacs帮助的插件, 没有 `help+' 方便但是有些很好的
;; 功能 
(eal-define-keys `(emacs-lisp-mode-map
		   lisp-interaction-mode-map
		   completion-list-mode-map
		   help-mode-map
		   debugger-mode-map)
 `(("C-<f3>"   describe-symbol-at-point)
   ;; ("C-c M-v" describe-variable-at-point)
   ;; ("C-c M-f" describe-function-at-point)
   ;; ("C-M-<f3>" describe-face-at-point)
   ("S-<f3>"   find-symbol-at-point)
   ;; ("C-c C-h" find-symbol-go-back)
   ;; ("C-c M-V" find-symbol-var-at-point)
   ;; ("C-c M-F" find-symbol-fun-at-point)
   ;; ("C-c M-S" find-symbol-face-at-point)
   ("C-S-<f3>" where-is-at-point)))

;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x C-k" describe-key-sb)
;;    ("C-x C-m" describe-mode)
;;    ("C-x / A" describe-face)
;;    ("C-x / a" apropos)
;;    ("C-x A"   apropos-command)
;;    ("C-x C-d" find-symbol-sb)
;;    ("C-x K"   find-symbol-fun-on-key-sb)
;;    (,(if window-system "C-x C-/" "C-x C-_") describe-symbol-sb)))



;;;; log
;;*** mwe-log-commands ;;NOTE: it is very old and I am using a fork
                       ;;      `command-log-mode.el' of it.
;; This add-on can be used to demo Emacs to an audience.  When
;; activated, keystrokes get logged into a designated buffer, along
;; with the command bound to them.
;; To enable, use e.g.:
;;   (add-hook 'LaTeX-mode-hook (function mwe:log-keyboard-commands))
;; To see the log buffer, call M-x mwe:open-command-log-buffer.
;; To start logging, call M-x mwe:log-keyboard-commands

(autoload 'command-log-mode "command-log-mode" "\
Toggle keyboard command logging of current buffer.

\(fn &optional ARG)" t nil)

(autoload 'global-command-log-mode "command-log-mode" "\
Toggle keyboard command logging of whole emacs.

\(fn &optional ARG)" t nil)

;; ;;;; alert ;; NOTE: not very useful
;; (when (try-require 'alert)
;;   (alert-install-aliases)
;;   (alert "important message")
;;   (with-message-logonly
;;    (do-something-noisy)))



;;; language environment

;; Use clipboard with x-window system
(setq x-select-enable-clipboard t)

;; Time string format
(setq system-time-locale "C")

;; 设置 sentence-end 可以识别中文断句。
(setq sentence-end
      "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*") 
(setq sentence-end-double-space nil)

;; 支持中文分词的M-f与M-b
(try-require 'ws)



;;;; encodings
(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8-unix)

;; NOTE: `default-buffer-file-coding-system' is an obsolete variable
;; (as of Emacs 23.2); use `buffer-file-coding-system'
;; instead.
;; (setq default-buffer-file-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)

;; NOTE: Old coding system auto-detection
;; (let ((code (or file-name-coding-system default-file-name-coding-system)))
;;   (setq default-process-coding-system (cons code code))))

(Windows

 ;; NOTE: gbk-dos 是中文版 Windows 下文件名，命令行和原生 Windows 程序
 ;; 内码的默认编码。`default-file-name-coding-system',
 ;; `default-terminal-coding-system' 和
 ;; `default-process-coding-system' 应该都设置成 gbk-dos。但是默认处理
 ;; utf-8 编码文件的包如 `magit', `diff-git' 等调用 Windows 版本的 git，
 ;; 中文显示会乱码。为了和 Linux 统一使用 utf-8-unix 编码，就强制设置了。
 ;; magit 具体解决方法参见 magit 。

 (setq default-file-name-coding-system 'gbk-dos)
 (setq default-terminal-coding-system 'gbk-dos) ;; 'utf-8-unix)
 (setq default-process-coding-system '(gbk-dos . gbk-dos)))

(GNULinux
  (setq default-file-name-coding-system 'utf-8-unix)
  (setq default-terminal-coding-system 'utf-8-unix)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))

;;;; unicad
;; File encoding auto detection
;; BUG: session files generated by `session.el' could not be saved in
;; UTF-8 encoding.
;; BUG: cause `o-blog' error when exporting blog
;; (when (try-require 'unicad)
;;   (unicad-enable)
;;   ;; (add-hook 'kill-emacs-hook
;;   ;;           'unicad-disable) ;; fix conflict with ido, as unicad said
;;   )



;;;; input method
;; NOTE: 现在 Emacs 下没什么好的中文输入法，还是用操作系统自带的输入法。
;;       除非不在图形系统下，才用 Emacs 内置的输入法或 eim。

;;*** eim
;; another Emacs input-method
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/InputMethods" :display "emacswiki")
;;   Basic usage:
;;   - `M-x set-input-method': switch to a new input method.
;;   - `C-h C-\' or `C-h I': describe the current input method.
;;   - `C-\': toggle the input method on and off
;;   To activate the input method on a per-buffer basis.
;;   1. Put the following lines in the .emacs:
;;      (set input-activate nil)
;;      (add-hook 'find-file-hook
;;        (lambda ()(if (eq input-activate t) (toggle-input-method))))
;;   2. Then put the following line at the beginning of a file:
;;       -*- input-activate: t -*-
;;   3. The input method will be activated for this file as soon loaded.
;;   如何輸入繁體:
;;      把 py.txt, otherpy.txt,  pychr.txt 用軟件轉成了繁體，然後重新
;;   打開 emacs。這樣使用軟件自動轉換肯定是不精確的，有些地方會出現錯
;;   誤。比如"碼表"被搞成了"碼錶"。 
(eval-after-load "eim"
  '(progn
     (eim-postload)
     (when (require 'eim-extra nil 'noerror)
       (global-set-key ";" 'eim-insert-ascii))))
(try-require 'eim)
;; (global-set-key "C-\\" 'toggle-input-method))

;;*** ibus-el
;; IBus client for GNU Emacs
;; REF:  (@url :file-name "http://www11.atwiki.jp/s-irie/pages/21.html" :display "Source")
;; NOTE: Dead :-(
;; (GNULinux
;;  (when (try-require 'ibus)
;;    ;; ;; Turn on ibus-mode automatically after loading .emacs
;;    (add-hook 'after-init-hook 'ibus-mode-on)
;;    ;; ;; If you use the client-server mode of emacs, replace the
;;    ;; after-init-hook line by this:
;;    ;; (add-hook 'after-make-frame-functions
;;    ;;           (lambda (new-frame)
;;    ;;             (select-frame new-frame)
;;    ;;             (or ibus-mode (ibus-mode-on))))
;;    ;; Use C-SPC for Set Mark command
;;    ;; (ibus-define-common-key ?\C-\s nil)
;;    ;; Use C-/ for Undo command
;;    (ibus-define-common-key ?\C-/ nil)
;;    ;; Change cursor color depending on IBus status
;;    (setq ibus-cursor-color '("purple" "red" "blue"))
;;    (setq ibus-python-shell-command-name "python2.7")
;;    (setq ibus-agent-file-name "~/.emacs.d/bin/lin64/ibus-el-agent")
;;    ))



;;; lisp management

;;;; ELPA packages
;; BUG: Conflict with auctex's `style/url.el' and flim's `mailcap.el'
;;   "symbol's function definition is void: TeX-add-style-hook" error
;; One solution is:
;;    1. Move `style/url.el' out of load-path
;;    2. Install the package
;;    3. Move it back
;; Another solution:
;;    Change auctex's `style/url.el' to another name.
;;    (No bug found yet)
;; (autoload 'package-list-packages "package"
;;   "Display a list of packages.
;; Fetches the updated list of packages before displaying.
;; The list is displayed in a buffer named `*Packages*'." nil t)
(eval-after-load "package" '(package-postload))
(require 'package)
(global-set-key (kbd "<f2> p") 'list-packages)
;; (package-initialize)  ;; Activate all packages



;;;; auto-install
(eval-after-load "auto-install"
  '(progn
     (auto-install-postload)
     (eal-define-keys
      'dired-mode-map
      `(("C-i"    auto-install-from-dired)))))
;; (require 'auto-install) ;; NOTE: load it when you want to use it.



;;; emacs server

;; Emacs-21 和以前的版本要用 gnuserv 
;; (if is-before-emacs-21
;;     (progn
;;       ;; gnuserv
;;       (require 'gnuserv-compat)
;;       (gnuserv-start)
;;       ;; 在当前frame打开
;;       (setq gnuserv-frame (selected-frame))
;;       ;; 打开后让emacs跳到前面来
;;       (setenv "GNUSERV_SHOW_EMACS" "1")))



;; Emacs 22 or newer
(server-preload)
(eval-after-load "server" '(server-postload))
;; (server-start-if-not-exists) ;; BUG: cannot connect to server.
(server-start)



;; Emacs 23.2 以后还提供了 `Emacs --daemon' 模式，加快启动。
;; Windows 下使用我定义的 `xy/done' 函数也能达到类似的效果，
;; 用 `C-x C-c' 隐藏 Emacs frame
;; Define real exit-emacs
(global-set-key (kbd "C-x M-c") 'save-buffers-kill-emacs)
;; Redefine `C-x C-c'
(global-set-key (kbd "C-x C-c") 'xy/done)
;; Redefine the top-right `close' button of the frame.
(when window-system
  (define-key special-event-map [delete-frame] 'xy/done))



(provide 'xy-rcroot-env)
