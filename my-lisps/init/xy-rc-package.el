;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-06 Mon 12:09 by xin on p5q>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; (defvar package-filter-function nil
;;   "Optional predicate function used to internally filter packages used by package.el.

;; The function is called with the arguments PACKAGE VERSION ARCHIVE, where
;; PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
;; ARCHIVE is the string name of the package archive.")

;; REF: (@url :file-name "https://github.com/purcell/emacs.d/blob/master/init-elpa.el" :display "Github Source")
;; On-demand installation of packages
;;;###autoload
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;;;###autoload
(defun package-postload ()
  "Settings of `package.el' after it's been loaded."

  (setq-default package-enable-at-startup nil) ;; NOTE: t will be slow
  (setq-default package-user-dir my-elpa-lisp-path)
  (setq package-archives
        '(("tromey" . "http://tromey.com/elpa/") ;; Original ELPA package.
          ("gnu" . "http://elpa.gnu.org/packages/") ;; Add the official packages
          ("marmalade" . "http://marmalade-repo.org/packages/")
          ("melpa" . "http://melpa.milkbox.net/packages/")
          ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

  ;; ;; NOTE: there is an enhancement lisp `melpa.el' for the
  ;; ;; `package.el' shipped by Emacs24. Provided by melpa.
  ;; ;; REF: (@url :file-name "http://melpa.milkbox.net/" :display "Site")
  ;; (require 'melpa)

  ;; REF: (@url :file-name "https://github.com/purcell/emacs.d/blob/master/init-elpa.el" :display "Github Source")
  ;; Patch up annoying package.el quirks
  (defadvice package-generate-autoloads (after close-autoloads (name pkg-dir) activate)
    "Stop package.el from leaving open autoload files lying around."
    (let ((path (expand-file-name (concat name "-autoloads.el") pkg-dir)))
      (with-current-buffer (find-file-existing path)
        (kill-buffer nil))))

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
  (package-initialize)  ;; Activate all packages

  ;; Generate archive folder
  (when (not package-archive-contents)
    (package-refresh-contents))

  (require-package 'ac-dabbrev)
  (require-package 'ace-jump-mode)
  (require-package 'ansi)
  (require-package 'ascii)
  (require-package 'auto-complete)
  (require-package 'autopair)
  (require-package 'bm)
  (require-package 'bookmark+)
  (require-package 'boxquote)
  (require-package 'browse-kill-ring)
  (require-package 'buffer-move)
  (require-package 'cal-china-x)
  (require-package 'caps-mode)
  (require-package 'cdlatex)
  (require-package 'c-eldoc)
  (require-package 'cmake-mode)
  (require-package 'columnify)
  (require-package 'cperl-mode)
  (require-package 'css-mode)
  (require-package 'ctags)
  (require-package 'desktop)
  (require-package 'dictionary)
  (require-package 'diff-hl)
  (require-package 'diff-git)
  (require-package 'diminish)
  (require-package 'dired+)
  (require-package 'doc-mode)
  (require-package 'emms)
  (require-package 'ert)
  (require-package 'ess)
  (require-package 'full-ack)
  (require-package 'fuzzy)
  (require-package 'gh)
  (require-package 'gist)
  (require-package 'git-blame)
  (require-package 'graphviz-dot-mode)
  (require-package 'google-maps)
  (require-package 'highlight-parentheses)
  (require-package 'highlight-symbol)
  (require-package 'htmlize)
  (require-package 'hungry-delete)
  (require-package 'ibuffer-vc)
  (require-package 'ido-ubiquitous)
  (require-package 'ioccur)
  (require-package 'isearch+)
  (require-package 'iy-go-to-char)
  (require-package 'json)
  (require-package 'kill-ring-search)
  (require-package 'light-symbol)
  (require-package 'logito)
  (require-package 'magit)
  (require-package 'magithub)
  (require-package 'markdown-mode)
  (require-package 'mediawiki)
  (require-package 'melpa)
  (require-package 'modeline-posn)
  (require-package 'mouse+)
  (require-package 'multi-term)
  (require-package 'openwith)
  (require-package 'org)
  (require-package 'org-mime)
  (require-package 'org-table-comment)
  (require-package 'outline-magic)
  (require-package 'pcache)
  (require-package 'popup)
  (require-package 'rw-hunspell)
  (require-package 'rw-ispell)
  (require-package 'smarter-compile)
  (require-package 'smex)
  (require-package 'sunrise-commander)
  (require-package 'tabbar)
  (require-package 'tabbar-ruler)
  (require-package 'texdrive)
  (require-package 'twittering-mode)
  (require-package 'undo-tree)
  (require-package 'wcheck-mode)
  (require-package 'weblogger)
  (require-package 'window-number)
  (require-package 'windresize)
  (require-package 'winpoint)
  (require-package 'xml-rpc)
  (require-package 'yasnippet)

  (message "* ---[ package post-load configuration is complete ]---"))

(provide 'xy-rc-package)
