;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-06 Fri 09:44 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-yasnippet.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `yasnippet.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun xy/yas-start ()
;;   "Start yasnippet."
;;   (interactive)
;;   (require 'yasnippet)
;;   ;; BUG: if (yas/minor-mode-on), there will be a conflict between
;;   ;; `xy/yas-start' and `xy/ac-start' functions
;;   (yas/minor-mode 1))

;;;###autoload
(defun yasnippet-unbind-trigger-key ()
  "Unbind `yas/trigger-key'."
  (let ((key yas/trigger-key))
    (setq yas/trigger-key nil)
    (yas/trigger-key-reload key)))

;; ;;;###autoload
;; (defun yasnippet-reload-after-save ()
;;   (let* ((bfn (expand-file-name (buffer-file-name)))
;;          (root (expand-file-name yas/root-directory)))
;;     (when (string-match (concat "^" root) bfn)
;;       (yas/load-snippet-buffer))))

;;;###autoload
(defun yasnippet-settings ()
  "settings for `yasnippet'."
  ;; 2011-07-29 yasnippet. Make the “yas/minor-mode”'s expansion
  ;; behavior to take input word including hyphen.
  ;; (setq yas/key-syntaxes '("w_" "w_." "^ ")) ; default is '("w" "w_"
  ;;                                       ; "w_." "^ ") as of 2011-07-29
  ;; (setq yas/root-directory
  ;;       (concat my-emacs-path "/yasnippet/snippets"))

  ;; (add-to-list 'yas/snippet-dirs "~/emacs/yasnippet/snippets")
  ;; (add-to-list 'yas/snippet-dirs
  ;; "~/.emacs.d/elpa/yasnippet-20120605/snippets")

  ;; ;; A workaround is to inhibit flyspell overlays
  ;; ;; while the snippet is active:
  ;; (add-hook 'flyspell-incorrect-hook
  ;;           #'(lambda (dummy1 dummy2 dymmy3)
  ;;               (and yas/active-field-overlay
  ;;                    (overlay-buffer yas/active-field-overlay))))

  ;; ;; (yasnippet-unbind-trigger-key)
  ;; (add-hook 'after-save-hook 'yasnippet-reload-after-save)
  ;; (yas/load-directory yas/root-directory)

  (setq yas/also-auto-indent-first-line t
        yas/choose-keys-first t
        yas/snippet-dirs '("~/emacs/yasnippet/snippets")
        yas/snippet-revival t
        yas/trigger-symbol " =>"
        yas/use-menu 'abbreviate)

  (message "* ---[ yasnippet configuration is complete ]---"))

(provide 'xy-rc-yasnippet)

;;------------------------------------------------------------------
;; NOTE: I changed `yas/trigger-key', this hack is not used now
;; org-mode TAB binding problem hack
;; (add-hook 'org-mode-hook
;;           #'(lambda ()
;;               (setq yas/fallback-behavior
;;                     `(apply ,(lookup-key org-mode-map [tab])))
;;               (local-set-key [tab] 'yas/expand)))
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-set-local 'yas/trigger-key "<tab>")
;;             (define-key yas/keymap "<tab>"
;;                   'yas/next-field-group)))
;;------------------------------------------------------------------
