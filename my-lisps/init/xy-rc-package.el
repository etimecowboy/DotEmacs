;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-05-05 Fri 17:04 by xin on xinud>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-package.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My ELPA `package.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; REF: (@url :file-name "https://github.com/purcell/emacs.d/blob/master/init-elpa.el" :display "Github Source")

;; ;; When switching between Emacs 23 and 24, we always use the bundled package.el in Emacs 24
;; (let ((package-el-site-lisp-dir
;;        (expand-file-name "site-lisp/package" user-emacs-directory)))
;;   (when (and (file-directory-p package-el-site-lisp-dir)
;;              (> emacs-major-version 23))
;;     (message "Removing local package.el from load-path to avoid shadowing bundled version")
;;     (setq load-path (remove package-el-site-lisp-dir load-path))))

;; (require 'package)

;; ;;; Add support to package.el for pre-filtering available packages

;; (defvar package-filter-function nil
;;   "Optional predicate function used to internally filter packages used by package.el.

;; The function is called with the arguments PACKAGE VERSION ARCHIVE, where
;; PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
;; ARCHIVE is the string name of the package archive.")

;; (defadvice package--add-to-archive-contents
;;   (around filter-packages (package archive) activate)
;;   "Add filtering of available packages using `package-filter-function', if non-nil."
;;   (when (or (null package-filter-function)
;;             (funcall package-filter-function
;;                      (car package)
;;                      (package-desc-vers (cdr package))
;;                      archive))
;;     ad-do-it))


;; ;; But don't take Melpa versions of certain packages
;; (setq package-filter-function
;;       (lambda (package version archive)
;;         (and
;;          (not (memq package '(eieio)))
;;          (or (not (string-equal archive "melpa"))
;;              (not (memq package '(slime)))))))

;;; On-demand installation of packages
;;;###autoload
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))



;; REF: (@url :file-name "https://github.com/daemianmack/emacs-prelude/blob/master/prelude-packages.el" :display "emacs-prelude@GitHub")
;; (defvar prelude-packages
;;   '(clojure-mode coffee-mode deft gist haml-mode
;;                  haskell-mode magit markdown-mode paredit
;;                  sass-mode scss-mode yaml-mode yari yasnippet)
;;   "A list of packages to ensure are installed at launch.")

;; (dolist (p prelude-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))



;; REF: (@url :file-name "http://www.newsmth.net/nForum/#!article/Emacs/104800" :display "bsxfun@newsmth")
;; NOTE: 用来设置代理（有时候直接下载包非常慢，翻墙则速度飞快） 
;; (when (not (string-equal http-proxy-address ""))
;;    (setq url-using-proxy t)
;;    (setq url-proxy-services  `(("http" . ,http-proxy-address)))
;;  )



;;;###autoload
(defun package-postload ()
  "Settings of `package.el' after it's been loaded."

  (setq-default package-enable-at-startup nil) ;; NOTE: t will be slow
  (setq-default package-user-dir my-elpa-lisp-path)
  (setq package-check-signature nil) ;; fix the epg problem (Emacs GnuPG interface)
  ;; (setq package-archives
  ;;       '(("tromey" . "http://tromey.com/elpa/") ;; Original ELPA package.
  ;;         ("gnu" . "http://elpa.gnu.org/packages/") ;; Add the official packages
  ;;         ("marmalade" . "http://marmalade-repo.org/packages/")
  ;;         ("melpa" . "http://melpa.org/packages/")
  ;;         ("org" . "http://orgmode.org/elpa/")
  ;;         ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")
  ;;         ))

  ;; TUNA mirrors of melpa (清华大学开源镜像站)
  ;; TODO: activate these mirrors when back to China
  (setq package-archives
        '(("gnu"          . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
          ("melpa"        . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ;; ("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
          ("org"          . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("marmalade"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
          ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")
    ))
  
  ;; ;; NOTE: there is an enhancement lisp `melpa.el' for the
  ;; ;; `package.el' shipped by Emacs24. Provided by melpa.
  ;; ;; REF: (@url :file-name "http://melpa.milkbox.net/" :display "Site")
  ;; (require 'melpa)

  ;; REF: (@url :file-name "https://github.com/purcell/emacs.d/blob/master/init-elpa.el" :display "Github Source")
  ;; Patch up annoying package.el quirks
  ;; (defadvice package-generate-autoloads (after close-autoloads (name pkg-dir) activate)
  ;;   "Stop package.el from leaving open autoload files lying around."
  ;;   (let ((path (expand-file-name (concat name "-autoloads.el") pkg-dir)))
  ;;     (with-current-buffer (find-file-existing path)
  ;;       (kill-buffer nil))))

  ;; ;; REF: (@url :file-name "https://github.com/purcell/emacs.d/blob/master/init-elpa.el" :display "Github Source")
  ;; ;; Add support to package.el for pre-filtering available packages
  ;; (defadvice package--add-to-archive-contents
  ;;   (around filter-packages (package archive) activate)
  ;;   "Add filtering of available packages using `package-filter-function', if non-nil."
  ;;   (when (or (null package-filter-function)
  ;;             (funcall package-filter-function
  ;;                      (car package)
  ;;                      (package-desc-vers (cdr package))
  ;;                      archive))
  ;;     ad-do-it))

  ;; ;; Don't take Melpa versions of certain packages
  ;; (setq package-filter-function
  ;;       (lambda (package version archive)
  ;;         (or (not (string-equal archive "melpa"))
  ;;             (not (memq package
  ;;                        '(
  ;;                          ruby-compilation
  ;;                          slime
  ;;                          color-theme-sanityinc-solarized
  ;;                          color-theme-sanityinc-tomorrow
  ;;                          elisp-slime-nav
  ;;                          findr))))))

  ;; Fire up package.el and ensure the following packages are installed.
  ;; (package-initialize) ;; Activate all packages

  ;; Generate archive folder
  (when (not package-archive-contents)
    (package-refresh-contents))

  ;; =======================================================
  ;; ELPA repositories
  ;; (require-package 'marmalade)
  ;; (require-package 'marmalade-test)
  ;; (require-package 'melpa) ;; not avaliable any more
  ;; =======================================================
  
  (require-package 'ace-jump-mode)
  ;; (require-package 'ace-jump-buffer)
  (require-package 'ace-window)
  ;; (require-package 'ace-pinyin)
  ;; (require-package 'ace-popup-menu)
  ;; (require-package 'ace-link)
  (require-package 'ag)
  
  (require-package 'buffer-move)
  (require-package 'windsize)
  ;; (require-package 'winpoint)

  ;; (require-package 'color-theme-sanityinc-solarized)
  (require-package 'solarized-theme)
  (require-package 'zenburn-theme)
  
  ;; (require-package 'ascii)  
  ;; (require-package 'auto-dim-other-buffers)
  (require-package 'autopair)
  ;; (require-package 'back-button) ;; use bm instead
  (require-package 'batch-mode)
  ;; (require-package 'visible-mark) ;; clear install required
  ;; (require-package 'nav-flash)
  ;; (require-package 'smartrep)
  ;; (require-package 'ucs-utils)
  ;; (require-package 'ucs-cmds)
  ;; (require-package 'persistent-soft)
  ;; (require-package 'pcache)
  ;; (require-package 'bash-completion)

  (require-package 'bm)
  (require-package 'bookmark+)

  ;; (require-package 'boxquote)  ;; rarely used
  ;; (require-package 'browse-kill-ring)

  (require-package 'cal-china-x)
  (require-package 'centered-cursor-mode)
  (require-package 'cl-lib)
  (require-package 'cmake-mode)
  (require-package 'col-highlight)
  (require-package 'color-moccur)
  ;; (require-package 'columnify) ;; never used
  ;; (require-package 'cperl-mode)
  (require-package 'css-mode)
  ;; (require-package 'ctags)
  ;; (require-package 'ctags-update)
  ;; (require-package 'cursor-chg)  ;; not very useful
  ;; (require-package 'dash)
  ;; (require-package 'deft)        ;; nerver used
  (require-package 'dictionary)
  ;; (require-package 'diff-git)
  (require-package 'diff-hl)
  (require-package 'diminish)
  (require-package 'dired+)
  (require-package 'dired-sort)
  ;; (require-package 'doc-mode)   ;; never used
  ;; (require-package 'dropbox)    ;; never used
  ;; (require-package 'edit-server);; I use firefox not chrome
  ;; (require-package 'eimp)
  (require-package 'elscreen)
  (require-package 'elscreen-buffer-group)
  ;; (require-package 'emms)       ;; not very useful
  ;; (require-package 'ess)        ;; not very useful

  (require-package 'ethan-wspace)
  ;; (require-package 'everything) ;; not very useful
  (require-package 'fic-mode)
  ;; (require-package 'fit-frame) ;; not very useful
  ;; (require-package 'flx-ido)
  ;; (require-package 'flx)
  ;; (require-package 'fold-this)
  ;; (require-package 'framesize)
  ;; (require-package 'furl)
  (require-package 'fuzzy)
  ;; (require-package 'gh)
  ;; (require-package 'gist)
  
  (require-package 'google-c-style)
  (require-package 'c-eldoc)

  ;; (require-package 'google-maps)
  ;; (require-package 'graphviz-dot-mode)
  ;; (require-package 'haskell-mode)  ;; don't want to learn haskell now

  (require-package 'highlight)
  (require-package 'highlight-parentheses)
  (require-package 'highlight-symbol)
  (require-package 'htmlize)
  ;; (require-package 'hungry-delete)

  ;; (require-package 'ibuffer-vc) ;; not working in Emacs 25

  ;; (require-package 'ido-ubiquitous)
  ;; (require-package 'ido-yes-or-no)
  ;; (require-package 'idomenu) ;; required by `elpy'
  (require-package 'elpy)

  (require-package 'info+)
  (require-package 'ioccur)
  (require-package 'isearch+)
  (require-package 'isearch-prop)
  ;; (require-package 'iy-go-to-char)
  ;; (require-package 'jira)
  ;; (require-package 'json)
  ;; (require-package 'key-chord)
  ;; (require-package 'kill-ring-search)
  (require-package 'hlinum)
  ;; (require-package 'list-utils)
  (require-package 'list-processes+)
  ;; (require-package 'logito)
  ;; (require-package 'mag-menu)
  ;; (require-package 'splitter) ;; just use basic split functions

  ;; (require-package 'git-commit-mode) ;; not supported by magit since 2015-07-10
  ;; (require-package 'git-rebase-mode) ;; not supported by magit since 2015-07-10
  (require-package 'magit)
  ;; (require-package 'magithub) ;; not useful
  
  (require-package 'markdown-mode)
  ;; (require-package 'maxframe)
  (require-package 'mew)
  (require-package 'elscreen-mew)
  (require-package 'mic-paren)
  (require-package 'mo-git-blame)
  (require-package 'modeline-posn)
  ;; (require-package 'mouse+)  ;; don't want to use mouse
  (require-package 'multi-term)
  (require-package 'multiple-cursors)

  (require-package 'oauth)
  ;; (require-package 'openwith)

  ;; (require-package 'org '(8)) ;; NOTE: install the latest version
  ;; (require-package 'org-cua-dwim)
  ;; (require-package 'org-mime)
  (require-package 'org-plus-contrib)
  (require-package 'gnuplot)
  ;; (require-package 'org-table-comment)  ;; nerver used by now
  ;; NOTE: one of the following 5 package is used to fold code as
  ;; org-mode, now I am using `outshine'
  ;; (require-package 'fold-dwim)
  ;; (require-package 'folder-dwim-org)
  ;; (require-package 'outline-magic) ;; out dated
  ;; (require-package 'hideshow-org) ;; out dated
  ;; NOTE: outshine suite (`outshine', `outorg', `navi-mode')
  (require-package 'outshine)
  (require-package 'outorg) ;; depend on `outshine'
  (require-package 'navi-mode)
  ;; (require-package 'ox-twiki) ;; depend on melpa `org'
  (require-package 'org2blog) ;; depend on melpa `org'
  ;; NOTE: package is not stable right now, use downloaded pacakge in
  ;; the lisps folder 
  ;; (require-package 'o-blog)
  ;; (require-package 'ox-reveal) ;; not working
  (require-package 'org-present)

  (require-package 'popup)
  (require-package 'popwin)
  (require-package 'pp-c-l)
  (require-package 'projectile)
  (require-package 'rect-mark)
  (require-package 'region-list-edit)
  (require-package 'revive)
  ;; (require-package 'rw-hunspell)
  ;; (require-package 'rw-ispell)
  ;; (require-package 's)
  (require-package 'shell-command)
  (require-package 'shell-here)
  (require-package 'shell-pop)
  ;; (require-package 'smarter-compile)
  ;; (require-package 'smex)
  ;; (require-package 'string-utils)

  (require-package 'sunrise-commander)
  ;; (require-package 'sunrise-x-buttons)
  (require-package 'sunrise-x-popviewer)
  (require-package 'sunrise-x-checkpoints)
  (require-package 'sunrise-x-loop)
  (require-package 'sunrise-x-mirror)
  (require-package 'sunrise-x-modeline)
  ;; (require-package 'sunrise-x-popviewer)
  (require-package 'sunrise-x-tabs)
  ;; (require-package 'sunrise-x-tree)
  (require-package 'sunrise-x-w32-addons)

  (require-package 'sr-speedbar)
  ;; (require-package 'strings)

  (require-package 'undo-tree)
  ;; (require-package 'redo+)

  (require-package 'vline)
  (require-package 'w32-browser)
  (require-package 'w3m)
  (require-package 'weblogger)
  ;; (require-package 'weather-metno) ;; not working
  (require-package 'wgrep)
  ;; (require-package 'wgrep-helm) ;; don't use helm
  (require-package 'whole-line-or-region)
  (require-package 'ws-trim)
  (require-package 'xcscope)
  (require-package 'xml-rpc)
  ;; (require-package 'zjl-hl)

  ;; =======================================================
  ;; New packages
  
  (require-package 'iedit)
  (require-package 'auctex)
  (require-package 'auctex-latexmk)
  (require-package 'cdlatex)
  ;; (require-package 'texdrive)
  ;; (require-package 'command-log-mode)
  ;; (require-package 'psvn)
  ;; (require-package 'ecb)
  (require-package 'ebib)
  (require-package 'psession)
  (require-package 'matlab-mode)
  (require-package 'flycheck)
  (require-package 'powerline)
  (require-package 'smart-mode-line)
  (require-package 'smart-mode-line-powerline-theme)
  ;; (require-package 'bash-completion)
  (require-package 'fcitx)
  (require-package 'imenu+)
  ;; (require-package 'imenu-anywhere)
  (require-package 'emamux)
  (require-package 'speck)
  (require-package 'flyspell-lazy)
  (require-package 'fzf)
  (require-package 'beacon)
  (require-package 'ranger)
  ;; Python ide
  (require-package 'ein)
  (require-package 'py-autopep8)
  ;; (require-package 'jedi) ;; use with auto-complete
  (require-package 'smartrep)
  (require-package 'jedi-core)
  (require-package 'virtualenvwrapper)
  
  
  ;; =======================================================
  ;; Completion system
  ;; 
  ;; NOTE: may switch to company in future
  ;; (require-package 'auto-complete)
  ;; (require-package 'ac-dabbrev)
  ;; (require-package 'ac-math)

  (require-package 'company)
  ;; (require-package 'anaconda-mode)
  ;; (require-package 'company-anaconda)
  (require-package 'company-flx)
  (require-package 'company-quickhelp)
  (require-package 'company-math)
  (require-package 'company-shell)
  (require-package 'company-tern)
  ;; (require-package 'company-try-hard)
  (require-package 'company-auctex)
  (require-package 'company-c-headers)
  (require-package 'company-jedi)

  (require-package 'yasnippet)
  (require-package 'ox-html5slide)
  
  (require-package 'helm)
  (require-package 'helm-bibtex)
  (require-package 'biblio)
  (require-package 'helm-firefox)
  (require-package 'helm-c-yasnippet)
  ;; (require-package 'helm-R)
  (require-package 'helm-c-moccur)
  (require-package 'helm-swoop)
  (require-package 'helm-descbinds)
  ;; (require-package 'helm-gist)
  ;; (require-package 'helm-git)
  ;; (require-package 'helm-gtags)
  ;; (require-package 'helm-ls-git)
  ;; (require-package 'helm-migemo)
  (require-package 'helm-projectile)
  ;; (require-package 'helm-themes)
  (require-package 'flyspell-correct)
  (require-package 'flyspell-correct-helm)
  
  (require-package 'ace-jump-helm-line)

  ;; (require-package 'ack-menu)  ;; ack is not used
  ;; (require-package 'ansi)  ;; never used
  ;; (require-package 'ahg) ;; hg (mecurial) is not in use
  ;; =======================================================

  (require-package 'runner)
  (require-package 'unify-opening)
  (require-package 'auto-install) ;; emacswiki auto install packages
  
  (message "* ---[ package post-load configuration is complete ]---"))

(provide 'xy-rc-package)
