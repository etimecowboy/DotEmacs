;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:56 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `view mode' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun previous-line-or-backward-button ()
  "`major-mode'为`help-mode'时, 执行`backward-button', 否则执行`previous-line'."
  (interactive)
  (if (equal major-mode 'help-mode)
      (call-interactively 'backward-button)
    (call-interactively 'previous-line)))

;;;###autoload
(defun view-mode-postload ()
  "Settings for `view-mode' after it's been loaded."
  ;; (defface view-mode-mode-line-face
  ;;   '((((type tty pc)) :bold t :background "red" :foreground "white")
  ;;     (t (:background "red" :foreground "white")))
  ;;   "Face used highlight `view-mode-line-format'.")

  (defvar view-mode-line-format
    (propertize "View"
                'local-map mode-line-minor-mode-keymap
                'help-echo "mouse-3: minor mode menu"
                'face 'view-mode-mode-line-face)
    "*Mode line format of `view-mode'.")

  (put 'view-mode-line-format 'risky-local-variable t)

  (setq minor-mode-alist
        (append
         `((view-mode " ") (view-mode ,view-mode-line-format))
         (delq (assq 'view-mode minor-mode-alist) minor-mode-alist) ))

  (message "* ---[ view-mode post-load configuration is complete ]---"))

(provide 'xy-rc-view)
