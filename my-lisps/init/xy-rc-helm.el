;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-01 Fri 10:48 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun helm-postload ()
  "Settings of `helm.el' after it's been loaded."

  (require 'helm-config)

  (setq helm-split-window-default-side        'below
        ; open helm buffer inside current window, not occupy whole other window
        helm-split-window-in-side-p           t
        ; move to end or beginning of source when reaching top or bottom of source.
        helm-move-to-line-cycle-in-source     t
        ; search for library in `require' and `declare-function' sexp.
        helm-ff-search-library-in-sexp        t
        ; scroll 8 lines other window using M-<next>/M-<prior>
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

  (helm-autoresize-mode t)
  (setq helm-autoresize-max-height 50
        helm-autoresize-min-height 10)

  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)

  (setq helm-locate-fuzzy-match t)

  (setq helm-apropos-fuzzy-match t)

  (setq helm-lisp-fuzzy-completion t)

  (when (executable-find "ack-grep")
    (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
          helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))
  
  ;; helm-adaptive-mode
  ;; (helm-adaptive-mode 1)
  ;; (setq helm-adaptive-history-file
  ;;       (concat my-var-path "helm-adaptive-history"))

  ;;; `helm-bibtex'
  (try-require 'helm-bibtex)
  ;; (when (try-require 'helm-bibtex)
  ;;   (define-key helm-command-map (kbd "x") 'helm-bibtex))

  ;;; `helm-firefox'
  (try-require 'helm-firefox)

  ;;; `helm-c-yasnippet'
  (try-require 'helm-c-yasnippet)

  ;;; `helm-bm'
  ;; TODO: compare with `helm-firefox'
  ;; (try-require 'helm-bm)

  ;;; `helm-c-moccur'
  (setq helm-idle-delay nil)
  (try-require 'helm-c-moccur)

  ;;; `helm-projectile'
  (try-require 'helm-projectile)

  ;;; `helm-flyspell'
  (try-require 'helm-flyspell)
  
  (helm-mode 1)
  (message "* ---[ helm post-load configuration is complete ]---"))

(provide 'xy-rc-helm)
