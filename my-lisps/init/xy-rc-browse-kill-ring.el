;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:25 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-browse-kill-ring.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `help' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;; browse-kill-ring navigation have bug when linum-mode is on
;;;###autoload
(defmacro def-without-linum-mode (command)
  `(defun ,(am-intern command "-without-linum-mode") ()
     ,(concat "Before call " command " , turn off `linum-mode' first.")
     (interactive)
     (let ((displn linum-mode))
       (linum-mode -1)
       (call-interactively ',(am-intern command))
       (linum-mode (if displn 1 -1)))))

;;;###autoload
(defun browse-kill-ring-settings ()
  "settings for `browse-kill-ring'."

  (browse-kill-ring-default-keybindings)
  (setq browse-kill-ring-maximum-display-length nil)
  (setq browse-kill-ring-highlight-current-entry t)
  (setq browse-kill-ring-highlight-inserted-item t)
  (setq browse-kill-ring-no-duplicates t)
  (setq browse-kill-ring-display-duplicates nil)
  (setq browse-kill-ring-recenter t)
  (setq browse-kill-ring-separator
    "************************************************************")

  ;; (add-hook 'browse-kill-ring-hook 'browse-kill-ring-my-keys)

  ;; browse-kill-ring navigation have bug when linum-mode is on
  ;; (defmacro def-without-linum-mode (command)
  ;;   `(defun ,(am-intern command "-without-linum-mode") ()
  ;;      ,(concat "Before call " command " , turn off `linum-mode' first.")
  ;;      (interactive)
  ;;      (let ((displn linum-mode))
  ;;        (linum-mode -1)
  ;;        (call-interactively ',(am-intern command))
  ;;        (linum-mode (if displn 1 -1)))))

  (def-without-linum-mode "browse-kill-ring-forward")
  (def-without-linum-mode "browse-kill-ring-previous")
  (message "* ---[ browse-kill-ring configuration is complete ]---")
)

;;;###autoload
(defun browse-kill-ring-face-settings ()
  "Face settings for `browse-kill-ring'."
  (setq browse-kill-ring-separator-face
        'font-lock-comment-delimiter-face))

(provide 'xy-rc-browse-kill-ring)
