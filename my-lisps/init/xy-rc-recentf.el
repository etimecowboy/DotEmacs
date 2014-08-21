;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-21 Thu 16:33 by xy12g13 on UOS-208326>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-recentf.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `recentf.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun recentf-preload ()
  "Settings of `recentf.el' before it's been loaded."
   (setq-default recentf-save-file
                 (concat my-var-path "/recentf-"
                         user-login-name "-"
                         system-name "-"
                         system-configuration))
   ;; (unless (file-exists-p recentf-save-file)
   ;;   (shell-command (concat "touch " recentf-save-file))))
   (message "* ---[ recentf pre-load configuration is complete ]---"))

;; BUG: NOT working
;; ;;;###autoload
;; (defun undo-kill-buffer (arg)
;;   "Re-open the last buffer killed. With ARG, re-open the nth buffer."
;;   (interactive)
;;   (let ((recently-killed-list (copy-sequence recentf-list))
;;         (buffer-files-list
;;          (delq nil (mapcar (lambda (buf)
;;                              (when (buffer-file-name buf)
;;                                (expand-file-name (buffer-file-name buf))))
;;                            (buffer-list)))))
;;     (mapc
;;      (lambda (buf-file)
;;        (setq recently-killed-list
;;              (delete buf-file recently-killed-list)))
;;      buffer-files-list)
;;     (find-file (nth (- arg 1) recently-killed-list))))

;;;###autoload
(defun recentf-postload ()
  "Settings of `recentf.el' after it's been loaded."
  (setq recentf-exclude '("bbdb" "gnus" "mew" "w3m" "gtd" "/temp/"
                          "/ssh:" "loaddefs"))
  (setq recentf-menu-open-all-flag t)
  (setq recentf-max-saved-items 100)
  (setq recentf-max-menu-items 20)
  (setq recentf-menu-filter 'recentf-sort-basenames-ascending)
  (setq recentf-save-file-modes 5000)

  (defadvice recentf-track-closed-file (after push-beginning activate)
    "Move current buffer to the beginning of the recent list after killed."
    (recentf-track-opened-file))

  (message "* ---[ recentf post-load configuration is complete ]---"))

(provide 'xy-rc-recentf)
