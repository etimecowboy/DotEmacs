;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-23 Wed 13:02 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-magit.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `magit' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; Fixed in new version of `magit'
;; ;;;###autoload
;; (defun xy/magit-q ()
;;   "Quit magit buffer, and recover windows system coding system."

;;   (interactive)
;;   (Windows
;;    (setq default-process-coding-system
;;          '(gbk-dos . gbk-dos)))   ;; ==> `emms' and `everything.el' work! `magit' fails.
;;   (delete-window))

;; `magit-wip.el' need support of git-wip,
;; which uses WIP branches to save every edit
;; REF: (@url :file-name "https://github.com/bartman/git-wip" :display "official website")
;; REF: (@url :file-name "http://www.jukie.net/~bart/blog/save-everything-with-git-wip" :display "author's blog post")
;;;###autoload
(defun xy/magit-wip-start ()
  "Start using magit-wip to record every changes."
  (interactive)
  (when (try-require 'magit-wip)
    (shell-command "git wip")
    (global-magit-wip-save-mode 1)
  ))

;; Recover from a previous version
;; 1. git reflog show wip/master   or
;;    git log -g -p wip/master
;; 2. git checkout ref -- .
;;    ref could be a SHA1 or wip/master
;;    dot the file path
;; To review the differences between the last commit
;; git diff --cached

;;;###autoload
(defun xy/magit-wip-check-changes ()
  (interactive)
  (shell-command "git reflog show wip/master"))

;; FIXME: problem
;; ;;;###autoload
;; (defun xy/magit-wip-quick-recover (&optional depth)
;;   (interactive)
;;   (shell-command (concat "git checkout wip/"
;;                          (magit-get-current-branch)
;;                          "@{%d}"
;;                          buffer-file-truename ;; this is absolute path, must be changed to an relative path to the root of git repository
;;                          )))

;; TODO: write this function
;; Recover changes from wip shadow branch
;; ;;;###autoload
;; (defun xy/magit-wip-quick-recover (&optional file depth)
;;   (interactive)
;;   (shell-command (concat "git checkout wip/"
;;                          (magit-get-current-branch)
;;                          "@{%d}")))

;;;###autoload
(defun magit-postload ()
  "Settings of `magit' after it's been loaded."

  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))

  (setq magit-auto-revert-mode nil)
  ;; (setq magit-last-seen-setup-instructions "1.4.0")
  
  ;; (when (try-require 'magit-blame)
  ;;   (magit-blame-mode 1))
  ;; NOTE: key bindings for magit-blame
  ;;     (define-key map (kbd "l") 'magit-blame-locate-commit)
  ;;     (define-key map (kbd "RET") 'magit-blame-locate-commit)
  ;;     (define-key map (kbd "q") 'magit-blame-mode)
  ;;     (define-key map (kbd "n") 'magit-blame-next-chunk)
  ;;     (define-key map (kbd "p") 'magit-blame-previous-chunk)

  ;; (add-hook 'magit-mode-hook
  ;;           '(lambda ()
               ;; `magit-stgit.el' need support of stgit
               ;; pushing/popping patches to/from a stack,
               ;; but using Git instead of diff and patch
               ;; REF: (@url :file-name "http://www.procode.org/stgit/" :display "official website")
               ;; REF: (@url :file-name "http://www.procode.org/stgit/doc/tutorial.html" :display "stgit tutorial")
               ;; (magit-stgit-mode 1)
               ;; `magit-topgit.el' need support of topgit
               ;; A different patch queue manager,
               ;; which seems better than stgit.
               ;; REF: (@url :file-name "http://repo.or.cz/w/topgit.git" :display "official website")
               ;; (magit-topgit-mode 1)

  (add-hook 'magit-mode-hook
            '(lambda ()
               (Windows
                ;; (setq default-terminal-coding-system 'utf-8-unix)
                (setq default-process-coding-system
                      '(utf-8-unix . gbk-dos))))) ;; ==> `emms' and `magit' work! `everything' fails.


  ;; NOTE: current version of `magit' don't need this patch
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/Magit#toc3" :display "emacswiki")
  ;; Tramp under windows
  ;; Had to change magit-escape-for-shell To make it work on windows.
  (defun magit-escape-for-shell (str)
    (if (or (string= str "git")
            (string-match "^--" str))
        str
      (concat "'" (replace-regexp-in-string "'" "'\\''" str) "'")))

  ;; https://github.com/magit/magit/issues/1318
  (defadvice magit-expand-git-file-name
      (before magit-expand-git-file-name-cygwin activate)
    "Handle Cygwin directory names such as /cygdrive/c/*
by changing them to C:/*"
    ;; (when (string-match "^/cygdrive/\\([a-z]\\)/\\(.*\\)" filename)
    ;; HACK: for msys2
    (when (string-match "^/\\([a-z]\\)/\\(.*\\)" filename)
      (setq filename (concat (match-string 1 filename) ":/"
                             (match-string 2 filename)))))

  (message "* ---[ magit post-load configuration is complete ]---"))

(provide 'xy-rc-magit)
