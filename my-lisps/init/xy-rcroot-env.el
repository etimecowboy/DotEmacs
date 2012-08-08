;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-08 Wed 22:16 by xin on XIN-PC>
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


;;* User information

(setq user-full-name "Xin Yang")
(setq user-mail-address "xin2.yang@gmail.com")


;;* Debug Emacs init

;; Set a large message log file for checking
(setq message-log-max 100000)

;; Debug errors
;; M-x toggle-debug-on-quit使用这条命令后，每次卡住后，马上按C-g，就会
;; 打出当前执行函数的调用栈，是哪个函数造成的卡住，也就一目了然了。然后
;; 根据这个造成卡住的函数属于哪个扩展包，再分别想解决办法。

(setq debug-on-error t)
;; (setq debug-on-quit t) ;; 平时太烦人

;; Compilation message
;; (setq compilation-auto-jump-to-first-error t)
;; (setq compilation-scroll-output t)

(setq max-specpdl-size 80000)  ;; BUG: in nw mode, Emacs 23.3 report a
;; error in spite of how large the value is. It may related to an
;; Emacs bug. Moreover, if the size set too large, it cause a error in
;; Windows.
(setq max-lisp-eval-depth 40000)

;; try to improve slow performance on windows.
(Windows (setq w32-get-true-file-attributes nil))

;; Change default major mode of *scratch* buffer
;; (setq initial-major-mode 'text-mode)
;; Change default text in the *scratch* buffer

;; NOTE: a warnning message is nessary for emacs fans like me
(setq initial-scratch-message "\
;;           Welcome to the Emacs Operating System!

;;                        CITATIONS
;;
;;- \"Show me your ~/.emacs and I'll tell you who you are.\"
;;                                         [Bogdan Maryniuk]
;;
;;- \"Emacs is like a laser guided missile. It only has to
;;   be slightly mis-configured to ruin your whole day.\"
;;                                            [Sean McGrath]
;;
;;- \"While any text editor can save your files,
;;   only Emacs can save your soul.\"
;;                                          [Per Abrahamsen]

")

;;- Emacs：    “只有你想不到，没有我做不到！”
;;- 我：       “太棒了！那就尽量多学一些吧！”
;;- Emacs：    “那交出你全部的时间吧！”
;;- 我：       “NO！那就只折腾我用的着的吧？”
;;- Emacs：    “你能经得起诱惑吗？”
;;



;; * Local custom file
;; Emacs generated customization, which overwrites settings above
(add-to-list 'load-path my-var-path)
(setq custom-file (expand-file-name
                   (concat my-var-path "/xy-rc-custom.el")))
;; user-login-name "@"
;; system-name "@"
;; system-configuration ".el")))
(load custom-file)


;;* Search pathes

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
 ;; (add-to-list 'exec-path (concat my-local-exec-path
 ;;                                 "/win32/aspell/bin"))
 (add-to-list 'exec-path (expand-file-name
                          (concat my-local-exec-path "/win32/hunspell")))
 (add-to-list 'exec-path (expand-file-name
                          (concat my-local-exec-path "/win32/stunnel"))))
;; NOTE: Linux don't need it
(GNULinux
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


;;* Install additional lisp packages
;; NOTE: There is a (@url :file-name "https://github.com/emacsmirror" :display "Github site")
;;       which has a lot of emacs git sources. You can always check it.

;;** EmacsWiki lisps

;; NOTE: don't load all the emacswiki lisps, they might cause
;; conflictions with other lisps
;; ;; Download from emacswiki, via `auto-install'
(xy/load-autoloads my-emacswiki-lisp-path)


;;** Manually downloaded lisps
;; Packages with version numbers are stable releases, while
;; packages without version numbers are development versions

;;*** Single files

(xy/load-autoloads my-local-lisp-path)

;;*** ac-math
;; REF: (@url :file-name "http://code.google.com/p/ac-math/" :display "SVN Source")
(xy/load-autoloads (concat my-local-lisp-path "/ac-math"))

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
(setq load-path (remove
                 (expand-file-name "~/.emacs.d/lisps/auctex/style")
                 load-path))

;;*** cc-mode
;; REF:  (@url :file-name "http://cc-mode.sourceforge.net/" :display "Source")
(xy/load-autoloads (concat my-local-lisp-path "/cc-mode-5.32.3"))

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
(xy/load-autoloads (concat my-local-lisp-path "/command-log-mode"))

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
;; (xy/load-autoloads (concat my-local-lisp-path "/elib-1.0"))
;; (xy/load-autoloads (concat my-local-lisp-path "/mule-ucs-20061127-1/lisp"))
(xy/load-autoloads (concat my-local-lisp-path "/emacs-w3m/shimbun"))
(xy/load-autoloads (concat my-local-lisp-path "/emacs-w3m"))

;;*** google-weather-el (Inactive git source)
;; REF: (@url :file-name "http://git.naquadah.org/?p=google-weather-el.git;a=summary" :display "Git Source")
(xy/load-autoloads (concat my-local-lisp-path "/google-weather-el"))

;;*** hideshow-org (Inactive git source)
;; REF: (@url :file-name "https://github.com/secelis/hideshow-org" :display "Git Source")
(xy/load-autoloads (concat my-local-lisp-path "/hideshow-org"))

;;*** ibus-el
;; REF: (@url :file-name "https://launchpad.net/ibus.el" :display "Brz Source")
(xy/load-autoloads (concat my-local-lisp-path "/ibus-el-0.3.2"))

;;*** mailcrypt
;; ;; REF: (@url :file-name "http://mailcrypt.sourceforge.net/" :display "Source")
(xy/load-autoloads (concat my-local-lisp-path "/mailcrypt-3.5.8"))

;;*** matlab-emacs
;; REF: (@url :file-name "http://matlab-emacs.sourceforge.net/" :display "CVS Source")
(xy/load-autoloads (concat my-local-lisp-path "/matlab-emacs"))

;;*** mew
;; REF: (@url :file-name "http://www.mew.org/en/" :display "Source")
(xy/load-autoloads (concat my-local-lisp-path "/mew-6.5"))

;;*** org-html5presentation (Inactive git source. Many forks avaliable for tests)
;; HTML5 Presentation export for Org-mode
;; REF: (@url :file-name "https://gist.github.com/509761" :display "kinjo's original Git Source")

;;;*** mo-git-blame
;; REF: (@url :file-name "https://github.com/mbunkus/mo-git-blame" :display "Git Source")
(xy/load-autoloads (concat my-local-lisp-path "mo-git-blame"))

;;** Git submodules

;;*** anything-config
;; REF: (@url :file-name "http://repo.or.cz/w/anything-config.git" :display "Git Source")
(xy/load-autoloads (concat my-git-lisp-path "/anything-config"))
(xy/load-autoloads (concat my-git-lisp-path "/anything-config/extensions"))
(xy/load-autoloads (concat my-git-lisp-path "/anything-config/contrib"))

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
(xy/load-autoloads (concat my-git-lisp-path "/o-blog"))

;;*** org2blog
;; REF: (@url :file-name "https://github.com/punchagan/org2blog" :display "Git Source")
(xy/load-autoloads (concat my-git-lisp-path "/org2blog"))

;;*** google-maps (ELPA)
;; REF: (@url :file-name "http://git.naquadah.org/?p=google-maps.git;a=summary" :display "Git Source")
;; (xy/load-autoloads (concat my-git-lisp-path "/google-maps"))

;;*** whizzytex (NOT used)
;; REF: (@url :file-name "http://cristal.inria.fr/whizzytex/" :display "Source")
;; NOTE: NOT very useful, bad Chinese support
;; (xy/load-autoloads (concat my-local-lisp-path "/whizzytex/src"))

;;*** weibo (NOT used)

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

;; (xy/load-autoloads (concat my-local-lisp-path "/apel"))
;; (xy/load-autoloads (concat my-local-lisp-path "/flim"))
;; (xy/load-autoloads (concat my-local-lisp-path "/semi"))
;; (xy/load-autoloads (concat my-local-lisp-path "/wanderlust")))


;;** ELPA packages

;; Packages installed via `package.el'.

;; `package.el' is now part of GNU Emacs 24. You can get the
;; latest at http://bit.ly/pkg-el while the last version that's
;; compatible with Emacs 23 is at http://bit.ly/pkg-el23


;;** My own lisps
;; Include init files and my own hacks, make sure they are installed
;; at last to make my hacks work.
(xy/install-lisps my-own-lisp-path 'with-subdirs 'recursive)

;; (xy/load-autoloads (concat my-own-lisp-path "/alpha-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/auctex-11.86-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/cursor-change-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/ecb_snap-20110605-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/eval-after-load-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/google-maps-20120724-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/lookup-word-on-internet-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/recent-jump-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/session-2.2.1-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/sr-speedbar-0.1.8-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/todochiku-fixed"))
;; (xy/load-autoloads (concat my-own-lisp-path "/edit-utils"))
;; (xy/load-autoloads (concat my-own-lisp-path "/themes"))
;; (xy/install-lisps  (concat my-own-lisp-path "/init"))


;; NOTE: Another scheme for managing Emacs configurations
;; REF: - (@url :file-name "http://www.emacswiki.org/emacs/DotEmacsModular" :display "emacswiki")
;;      - (@url :file-name "http://www.emacswiki.org/emacs/elinstall" :display "emacswiki")
;; (autoload 'my-site-start "my-site-start" nil t)
;; (my-site-start "~/.emacs.d/site-start.d/")

;; NOTE: el-get is another apporach


;;* Emacs help system customisation

;;** Info
(eval-after-load "info"
  '(progn
     (info-postload)
     (eal-define-keys
      'Info-mode-map
      `(("j"         next-line)
        ("k"         previous-line)
        ("h"         backward-char)
        ("l"         forward-char)
        ;; ("J"         emaci-roll-down)
        ;; ("K"         emaci-roll-up)
        ("f"         am-forward-word-or-to-word)
        ("/"         describe-symbol-at-point)
        ("U"         Info-up)
        ("u"         View-scroll-half-page-backward)
        ("Q"         kill-this-buffer)
        ("o"         other-window)
        ;; ("S-SPC"     View-scroll-half-page-backward)
        ;; ("SPC"       View-scroll-half-page-forward)
        ("C-h"       Info-up)
        ("N"         Info-next-reference)
        ("P"         Info-prev-reference)
        ("."         find-symbol-at-point)
        ("<mouse-4>" mwheel-scroll)
        ("<mouse-5>" mwheel-scroll)
        ("<backspace>"   Info-history-back)
        ("<S-backspace>" Info-history-forward)))))
;; (require 'info+)
;; (apply-args-list-to-fun
 ;; 'def-command-max-window `("info"))
(global-set-key (kbd "C-<f1>") 'info)


;;** Man
(eval-after-load "man"
  '(progn
     (man-postload)
     (eal-define-keys
      'Man-mode-map
      `(("Q"     Man-kill)
        ("1"     delete-other-windows)
        ("2"     split-window-vertically)
        ("3"     split-window-horizontally)
        ("u"     View-scroll-half-page-backward)
        ("S-SPC" View-scroll-half-page-backward)
        ("SPC"   View-scroll-half-page-forward)
        ("w"     scroll-down)
        ("d"     scroll-up)
        ("f"     am-forward-word-or-to-word)
        ("b"     emaci-b)
        ("n"     emaci-n)
        ("p"     emaci-p)
        ("N"     Man-next-section)
        ("P"     Man-previous-section)
        ("m"     back-to-indentation)
        ("M-j"   Man-goto-section)
        ("."     set-mark-command)
        ("g"     emaci-g)
        ("'"     switch-to-other-buffer)))))
(global-set-key (kbd "S-<f1>") 'man-follow)
(eal-define-keys
 `(c-mode-base-map sh-mode-map)
 `(("C-c /" man-current-word)))

;;*** woman settings
(eval-after-load "woman" '(woman-postload))
(global-set-key (kbd "M-<f1>") 'woman)


;;** help
(eval-after-load "help-mode"
  '(progn
     (help-mode-postload)
     (eal-define-keys
      'help-mode-map
      `(("B"   help-go-back)
        ("F"   help-go-forward)
        ("f"   am-forward-word-or-to-word)
        ("d"   scroll-up)
        ("w"   scroll-down)
        ("C-h" help-go-back)
        ("C-;" help-go-forward)
        ("n"   forward-button)
        ("p"   backward-button)
        ("q"   delete-current-window)
        ("'"   switch-to-other-buffer)
        ("u"   View-scroll-half-page-backward)
        ("SPC" scroll-up)
        ("."   find-symbol-at-point)
        ("/"   describe-symbol-at-point)))))
;; (global-set-key (kbd "C-x H") 'goto-help-buffer)

;;*** help+
;; (require 'help+)
;;    `C-h u'      `manual-entry'
;;    `C-h C-a'    `apropos'
;;    `C-h C-l'    `locate-library'
;;    `C-h RET'    `help-on-click/key'
;;    `C-h M-a'    `apropos-documentation'
;;    `C-h M-o'    `pop-to-help-toggle'
;;    `C-h C-M-a'  `tags-apropos'
;;    [mouse-1]    `mouse-help-on-click' (non-mode-line)
;;    [mouse-1]    `mouse-help-on-mode-line-click' (mode-line)
(global-set-key (kbd "<f1>") 'help-on-click/key)

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
   ("M-<f3>"   find-symbol-at-point)
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


;;** log
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


;;* Language environment

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


;;** System encodings
(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8-unix)

;; NOTE: `default-buffer-file-coding-system' is an obsolete variable
;; (as of Emacs 23.2); use `buffer-file-coding-system'
;; instead.
(setq default-buffer-file-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-sendmail-coding-system 'utf-8-unix)

(Windows

 ;; NOTE: GBK是中文版Windows文件名，命令行和程序内码的默认编码。
 ;; `default-terminal-coding-system'和`default-process-coding-system'
 ;; 设置成gbk，处理utf-8编码文件的程序如`magit', `diff-git'等中文显示乱
 ;; 码。为了和Linux下一致地使用一些GNU工具和开源软件，只好强制设置这些
 ;; 编码为utf-8-unix。

 ;; NOTE: Old coding system auto-detection
 ;; (let ((code (or file-name-coding-system default-file-name-coding-system)))
 ;;   (setq default-process-coding-system (cons code code))))

 (setq default-file-name-coding-system 'gbk-dos) ;; 文件名当然还是gbk

  ;; (setq default-terminal-coding-system 'gbk-dos)
  (setq default-terminal-coding-system 'utf-8-unix)
  ;; (setq default-process-coding-system '(gbk-dos . gbk-dos)))
  ;; `emms' wroks in Windows! Great!
  (setq default-process-coding-system '(utf-8-unix . gbk-dos)))

(GNULinux
  (setq default-file-name-coding-system 'utf-8-unix)
  (setq default-terminal-coding-system 'utf-8-unix)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)))
  ;; (setq default-terminal-coding-system 'gbk-dos)
  ;; (setq default-process-coding-system '(gbk-dos . gbk-dos)))

;;** `unicad.el'
;; File encoding auto detection
;; BUG: session files generated by `session.el' could not be saved in
;; UTF-8 encoding.
(when (try-require 'unicad)
  (unicad-enable)
  (add-hook 'kill-emacs-hook
            'unicad-disable)) ;; fix conflict with ido, as unicad said


;;** Fonts
;; Use scalable fonts
(setq scalable-fonts-allowed t)

;;*** Default font
(xy/set-font-mix)

;; ;; NOTE: not working
;; ;; REF: (@url :file-name "http://att.newsmth.net/nForum/#!article/Emacs/101697" :display "Fengyuan42@newsmth")
;; ;; copy from Tux in newsmth.net
;; ;; http://dto.github.com/notebook/require-cl.html#sec-8
;; ;; http://stackoverflow.com/questions/5019724/in-emacs-what-does-this-error-mean-warning-cl-package-required-at-runtime
;; (let ((fonts
;;        (ecase system-type
;;          (gnu/linux '("DejaVu Sans Mono" "vera Sans YuanTi Mono" 15)))))
;;   (set-face-attribute 'default nil :font
;;                       (format "%s:pixelsize=%d" (car fonts) (caddr fonts)))
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font) charset
;;                       (font-spec :family (cadr fonts) :size nil))))

;;*** Emacs auto font selection for different OS
;; REF: (@url :file-name "http://emacser.com/torture-emacs.htm" :display "emacser")
;; (xy/set-font-write-big)

;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook cc-mode-hook c-mode-hook
;;    c++-mode-hook sh-mode-hook vhdl-mode-hook verilog-mode-hook
;;    matlab-mode-hook)
;;  'xy/set-font-prog)

;; (am-add-hooks
;;  `(LaTeX-mode-hook latex-mode-hook tex-mode-hook
;;    muse-mode-hook w3m-mode-hook Info-mode-hook
;;    ;; org-mode-hook ;; NOTE: not to bother me when capturing notes
;;    gnus-startup-hook mew-summary-mode-hook)
;;  'xy/set-font-write)

(global-set-key (kbd "C-x F d") 'xy/set-font-default)
(global-set-key (kbd "C-x F w") 'xy/set-font-write)
(global-set-key (kbd "C-x F m") 'xy/set-font-mix)
(global-set-key (kbd "C-x F p") 'xy/set-font-prog)
(global-set-key (kbd "C-x F D") 'xy/set-font-default-big)
(global-set-key (kbd "C-x F W") 'xy/set-font-write-big)
;; (global-set-key (kbd "C-x F M") 'xy/set-font-write-2)
(global-set-key (kbd "C-x F P") 'xy/set-font-prog-big)
(global-set-key (kbd "C-x F A") 'xy/daemon-after)

;;*** Font scale by mouse wheel
(GNULinux
 (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
 (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease))
(Windows
 (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
 (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease))


;;** Chinese input method
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
(GNULinux
 (when (try-require 'ibus)
   ;; Turn on ibus-mode automatically after loading .emacs
   (add-hook 'after-init-hook 'ibus-mode-on)
   ;; Use C-SPC for Set Mark command
   ;; (ibus-define-common-key ?\C-\s nil)
   ;; Use C-/ for Undo command
   (ibus-define-common-key ?\C-/ nil)
   ;; Change cursor color depending on IBus status
   (setq ibus-cursor-color '("purple" "red" "blue"))))


;;* Emacs lisp management中文设置无问题

;;** ELPA packages
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


;;** auto-install
(eval-after-load "auto-install"
  '(progn
     (auto-install-postload)
     (eal-define-keys
      'dired-mode-map
      `(("C-i"    auto-install-from-dired)))))
;; (require 'auto-install) ;; NOTE: load it when you want to use it.


;;* Emacs server

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


;;* Emacs key bindings
(require 'xy-rc-kbd)


(provide 'xy-rcroot-env)
