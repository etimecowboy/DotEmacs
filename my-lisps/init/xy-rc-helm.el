;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-13 Sun 11:58 by xin on S13>
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

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/helm-prelude ()
  "Preconfigured `helm'."
  (interactive)
  (condition-case nil
      (if (projectile-project-root)
          ;; add project files and buffers when in project
          (helm-other-buffer '(helm-c-source-projectile-files-list
                               helm-c-source-projectile-buffers-list
                               helm-c-source-buffers-list
                               helm-c-source-recentf
                               helm-c-source-buffer-not-found)
                             "*helm prelude*")
        ;; otherwise fallback to helm-mini
        (helm-mini))
    ;; fall back to helm mini if an error occurs (usually in projectile-project-root)
    (error (helm-mini))))

;;;###autoload
(defun helm-postload ()
  "Settings of `helm.el' after it's been loaded."

  (require 'helm-config)
  (require 'helm-misc)

  ;; (helm-mode 1)

  (setq helm-candidate-number-limit          25
        helm-candidate-separator             "--------------------"
        helm-case-fold-search                'smart
        helm-completion-window-scroll-margin 3
        helm-display-source-at-screen-top    t
        helm-file-name-case-fold-search      t
        helm-full-frame                      nil
        helm-idle-delay                      0.5
        helm-input-idle-delay                0.5
        helm-never-delay-on-input            t
        helm-persistent-action-use-special-display nil
        helm-quick-update                    nil
        helm-reuse-last-window-split-state   nil
        helm-save-configuration-functions    '(set-window-configuration . current-window-configuration)
        helm-scroll-amount                   nil
        helm-sources-using-default-as-input  '(helm-c-source-imenu helm-c-source-info-elisp helm-c-source-etags-select)
        helm-split-window-default-side       'above
        helm-split-window-in-side-p           nil
        helm-split-window-preferred-function 'helm-split-window-default-fn)

  ;; (require 'helm-projectile)

  ;; (require 'helm-c-moccur)
  ;; (global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
  ;; (global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
  ;; (add-hook 'dired-mode-hook
  ;;          '(lambda ()
  ;;             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
  ;; (global-set-key (kbd "C-M-s") 'helm-c-moccur-isearch-forward)
  ;; (global-set-key (kbd "C-M-r") 'helm-c-moccur-isearch-backward)

  ;; here's my yasnippet's configuration
  ;; (require 'yasnippet)
  ;; (require 'helm-c-yasnippet)
  ;; (setq helm-c-yas-space-match-any-greedy t) ;[default: nil]
  ;; (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
  ;; (yas--initialize)
  ;; (yas-load-directory "<path>/<to>/snippets/")
  ;; (add-to-list 'yas-extra-mode-hooks 'ruby-mode-hook)
  ;; (add-to-list 'yas-extra-mode-hooks 'cperl-mode-hook)

  ;;; Commentary:
  ;; This package is a replacement of `describe-bindings'.

;;; Usage:
  ;; Add followings on your .emacs.
  ;;
  ;;   (require 'helm-descbinds)
  ;;   (helm-descbinds-install)
  ;;
  ;; Now, `describe-bindings' is replaced to `helm-descbinds'. Type
  ;; `C-h b', `C-x C-h' these run `helm-descbinds'.

;;; Commentary:
  ;;
  ;; It is necessary to Some Helm and gist.el Configurations.
  ;;

;;; Installation:
  ;;
  ;; Put the gist.el to your
  ;; load-path.
  ;; Add to .emacs:
  ;; (require 'helm-gist)
  ;;

  ;;; Commentary:
  ;;
  ;; Helm Git extension makes opening files from current Git repository
  ;; fast and easy. It uses Git binary (using magit) to get list of
  ;; project files so it's prety fast even for large projects with
  ;; thousands of files. It also takes into account .gitignore file so
  ;; that you only get real project files. Magit should also make it
  ;; usable on wide variety of OS.

  ;;; Commentary:

  ;; `helm-gtags.el' is GNU GLOBAL `helm' interface.
  ;; `helm-gtags.el' is not compatible `anything-gtags.el'

  ;;
  ;; To use this package, add these lines to your init.el or .emacs file:
  ;;     (require 'helm-config)
  ;;     (require 'helm-gtags)
  ;;
  ;;     (add-hook 'helm-gtags-mode-hook
  ;;               '(lambda ()
  ;;                  (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
  ;;                  (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
  ;;                  (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
  ;;                  (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

  ;;; Commentary:
  ;;
  ;; Migemo extension of `helm'. Use `helm-migemo' instead of
  ;; `helm'. If `helm-migemo' is invoked with prefix argument,
  ;; `helm' is migemo-ized. This means that pattern matching of
  ;; `helm' candidates is done by migemo-expanded `helm-pattern'.

;;; Commands:
  ;;
  ;; Below are complete command list:
  ;;
  ;;  `helm-migemo'
  ;;    `helm' with migemo extension.
  ;;
;;; Customizable Options:
  ;;
  ;; Below are customizable option list:
  ;;

  ;; If you want to use migemo search source-locally, add (migemo) to
  ;; the source. It sets match and search attribute appropriately for
  ;; migemo.

;;; Setting:

  ;; (require 'helm-migemo)
  ;; (define-key global-map [(control ?:)] 'helm-migemo)

  (message "* ---[ helm post-load configuration is complete ]---"))

(provide 'xy-rc-helm)
