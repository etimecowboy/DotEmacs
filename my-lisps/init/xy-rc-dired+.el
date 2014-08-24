;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:47 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired+.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun dired+-postload ()
  "Settings for `dired+' after it's been loaded."
  (setq diredp-prompt-for-bookmark-prefix-flag nil)
  (setq diredp-prompt-for-bookmark-prefix-flag nil)
  (message "* ---[ dired+ post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun dired+-face-settings ()
;;   "Face settings for `dired+'."
;;   ;; (custom-set-faces
;;   ;;  '(diredp-display-msg
;;   ;;    ((((type tty)) :foreground "blue")
;;   ;;     (t :foreground "cornflower blue"))))
;;   ;; (custom-set-faces
;;   ;;  '(diredp-date-time
;;   ;;    ((((type tty)) :foreground "yellow")
;;   ;;     (t :foreground "goldenrod1"))))
;;   ;; (custom-set-faces
;;   ;;  '(diredp-dir-heading
;;   ;;    ((((type tty)) :background "yellow" :foreground "blue")
;;   ;;     (t :background "Pink" :foreground "DarkOrchid1"))))
;;   ;; (setq diredp-ignored-file-name 'green-face)
;;   ;; (setq diredp-file-name 'darkred-face)
;;   ;; (setq diredp-file-suffix 'magenta-face)
;;   ;; (setq diredp-exec-priv 'darkred-face)
;;   ;; (setq diredp-other-priv 'white-face)
;;   ;; (setq diredp-no-priv 'darkmagenta-face)
;;   ;; (setq diredp-write-priv 'darkcyan-face)
;;   ;; (setq diredp-read-priv 'darkyellow-face)
;;   ;; (setq diredp-link-priv 'lightblue-face)
;;   ;; (setq diredp-symlink 'darkcyan-face)
;;   ;; (setq diredp-rare-priv 'white-red-face)
;;   ;; (setq diredp-dir-priv 'beautiful-blue-face)
;;   ;; (setq diredp-compressed-file-suffix 'darkyellow-face))
;; )

(provide 'xy-rc-dired+)
