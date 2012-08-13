;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-13 Mon 22:08 by xin on XIN-PC>
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

;; `magit-wip.el' need support of git-wip,
;; which uses WIP branches to save every edit
;; REF: (@url :file-name "https://github.com/bartman/git-wip" :display "official website")
;; REF: (@url :file-name "http://www.jukie.net/~bart/blog/save-everything-with-git-wip" :display "author's blog post")
;;
;;;###autoload
(defun xy/magit-wip-start ()
  "Start using magit-wip to record every changes."

  (interactive)
  (when (try-require 'magit-wip)
    (magit-wip-mode 1)
    (magit-wip-save-mode 1) ;; don't use the global mode.
  ))

;;;###autoload
(defun magit-postload ()
  "Settings of `magit' after it's been loaded."

  (setq magit-log-edit-mode-hook
        '(lambda ()
           (flyspell-mode 1)))

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

  ;; NOTE: current version of `magit' don't need this patch
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/Magit#toc3" :display "emacswiki")
  ;; Tramp under windows
  ;; Had to change magit-escape-for-shell To make it work on windows.
  (defun magit-escape-for-shell (str)
    (if (or (string= str "git")
            (string-match "^--" str))
        str
      (concat "'" (replace-regexp-in-string "'" "'\\''" str) "'")))

  (message "* ---[ magit post-load configuration is complete ]---"))

(provide 'xy-rc-magit)
