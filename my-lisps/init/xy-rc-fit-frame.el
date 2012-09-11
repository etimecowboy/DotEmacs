;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-09-11 Tue 19:46 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-fit-frame.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `fit-frame.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun fit-frame-postload ()
  "Setting for `fit-frame' after it's been loaded."

  ;;  Add menu-bar items
  ;; (defvar menu-bar-frames-menu (make-sparse-keymap "Frames"))
  ;; (define-key global-map [menu-bar frames]
  ;;   (cons "Frames" menu-bar-frames-menu))
  ;; (define-key menu-bar-frames-menu [fit-frame]
  ;;   '("Fit This Frame" . fit-frame))
  ;; (add-hook 'after-make-frame-functions 'fit-frame)
  ;; (add-hook 'temp-buffer-show-hook
  ;;           'fit-frame-if-one-window 'append)
  ;; (global-set-key [vertical-line down-mouse-1]
  ;;                 'fit-frame-or-mouse-drag-vertical-line)

  (message "* ---[ fit-frame post-load configuration is complete ]---"))

(provide 'xy-rc-fit-frame)
