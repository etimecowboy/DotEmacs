;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:29 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-diary.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `diary.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun diary-postload ()
  "Settings of `diary' after it's been loaded."
  (setq diary-file (concat my-emacs-path "/diary/diary"))
  ;; create an empty diary file (if it does not exist yet)
  (unless (file-exists-p diary-file)
    (shell-command (concat "touch " diary-file)))

  (setq view-diary-entries-initially t)
  (setq mark-diary-entries-in-calendar t)
  (setq number-of-diary-entries 1)

  ;; Use latex to print diary
  (setq cal-tex-diary t)
  (setq cal-tex-holidays nil)

  ;; Copy the diary entries into a special buffer (also display the diary
  ;; when I do `M-x diary')
  (add-hook 'diary-display-hook 'fancy-diary-display)

  (add-hook 'diary-display-hook 'sort-diary-entries)
  (add-hook 'list-diary-entries-hook 'sort-diary-entries t)

  ;; allow `#includes' in diary-file
  (add-hook 'list-diary-entries-hook 'include-other-diary-files)
  ;; Mark today when display
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
  ;; (add-hook 'diary-hook 'appt-make-list) ;; BUG: emacs24

  (message "* ---[ diary post-load configuration is complete ]---"))

(provide 'xy-rc-diary)
