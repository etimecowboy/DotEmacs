;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-03 Sun 15:41 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-swoop.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-swoop.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun helm-swoop-postload ()
  "Settings of `helm-swoop.el' after it's been loaded."

  ;; ;; copy from github
  ;; ;; helm from https://github.com/emacs-helm/helm
  ;; (require 'helm)

  ;; ;; Locate the helm-swoop folder to your path
  ;; (add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
  ;; (require 'helm-swoop)

  ;; ;; Change the keybinds to whatever you like :)
  ;; (global-set-key (kbd "M-i") 'helm-swoop)
  ;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  ;; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  ;; (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

  ;; ;; When doing isearch, hand the word over to helm-swoop
  ;; (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; ;; From helm-swoop to helm-multi-swoop-all
  ;; (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  ;; ;; When doing evil-search, hand the word over to helm-swoop
  ;; ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

  ;; ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  ;; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; ;; Move up and down like isearch
  ;; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  ;; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  ;; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  ;; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save nil)

  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows t)

  ;; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)

  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color t)

  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)

  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; If you prefer fuzzy matching
  (setq helm-swoop-use-fuzzy-match t)

  ;; ;; If you would like to use migemo, enable helm's migemo feature
  ;; (helm-migemo-mode 1)

  ;; Configure pre-input search query

  ;; By default, helm-swoop uses search query at the cursor. You can
  ;; configure this behavior by setting helm-swoop-pre-input-function
  ;; on your own.

  ;; i.e.

  ;; ;; Use search query at the cursor  (default)
  ;; (setq helm-swoop-pre-input-function
  ;;       (lambda () (thing-at-point 'symbol)))

  ;; ;; Disable pre-input
  ;; (setq helm-swoop-pre-input-function
  ;;       (lambda () ""))
  ;; ;; Or, just use M-x helm-swoop-without-pre-input

  ;; ;; Match only for symbol
  ;; (setq helm-swoop-pre-input-function
  ;;       (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol))))

  ;; ;; Always use the previous search for helm. Remember C-<backspace> will delete entire line
  ;; (setq helm-swoop-pre-input-function
  ;;       (lambda () (if (boundp 'helm-swoop-pattern)
  ;;                      helm-swoop-pattern "")))

  ;; If there is no symbol at the cursor, use the last used words instead.
  (setq helm-swoop-pre-input-function
        (lambda ()
          (let (($pre-input (thing-at-point 'symbol)))
            (if (eq (length $pre-input) 0)
                helm-swoop-pattern ;; this variable keeps the last used words
              $pre-input))))
  
  (message "* ---[ helm-swoop post-load configuration is complete ]---"))

(provide 'xy-rc-helm-swoop)
