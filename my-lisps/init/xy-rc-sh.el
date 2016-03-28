;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:52 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sh.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sh.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun sh-mode-postload ()
  "Settings for `sh-mode' after it's been loaded."
  (font-lock-add-keywords
   'sh-mode
   '(("\\<\\(local\\|let\\)\\>" . font-lock-keyword-face)))
  (message "* ---[ sh-mode post-load configuration is complete ]---"))

;; ;;;###autoload
;;   (defun sh-mode-face-settings ()
;;     "Face settings for `sh-mode'."
;;     (custom-set-faces
;;      '(sh-heredoc
;;        ((((min-colors 88) (class color)
;;           (background dark))
;;          (:foreground "deeppink"))
;;         (((class color)
;;           (background dark))
;;          (:foreground "deeppink"))
;;         (((class color)
;;           (background light))
;;          (:foreground "tan1" ))
;;         (t
;;          (:weight bold))))))

(provide 'xy-rc-sh)
