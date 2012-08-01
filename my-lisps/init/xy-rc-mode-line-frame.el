;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:14 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mode-line-frame.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mode-line-frame.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

(defvar current-mode-line-format mode-line-format
  "Current mode-line description")
(defvar temp-mode-line-format mode-line-format
  "Temperate mode-line description")

;;;###autoload
(defun xy/show-mode-line ()
  "Show the mode-line for this frame."
  (interactive)
  (setq mode-line-format temp-mode-line-format
        current-mode-line-format mode-line-format))
  ;; (custom-set-faces '(mode-line ((t (:height 5)))))) ;; recover

;;;###autoload
(defun xy/kill-mode-line ()
  "Create a single mode-line frame."
  (interactive)
  ;; (message "NOTICE: Your mode-line is killed FOREVER!")
  (setq temp-mode-line-format current-mode-line-format)
  (setq mode-line-format nil)
  (setq-default mode-line-format nil)
  (setq current-mode-line-format mode-line-format)
  (setq-default ;; Display mode-line the same in non-selected windows
    mode-line-in-non-selected-windows nil))

;;;###autoload
(defun xy/separate-mode-line-frame ()
  "Create a single mode-line frame."
  (interactive)
  (require 'mode-line-frame)
  (mode-line-frame-create)
  (xy/kill-mode-line))
  ;; (custom-set-faces '(mode-line ((t (:height 0.4)))))) ;; look better

;; REF: (@url :file-name "http://stackoverflow.com/questions/3050011/is-it-possible-to-move-the-emacs-minibuffer-to-the-top-of-the-screen" :display "Post")
;;;###autoload
(defun xy/mode-line-on-top ()
  "Make the mode line be on top: use header-line instead"
  (interactive)
  (setq-default ;; NOTE: NOT as usefull as the real mode-line
    header-line-format mode-line-format)
  (xy/kill-mode-line))
  ;; (custom-set-faces '(mode-line ((t (:height 0.2)))))) ;; look better

;;;###autoload
(defun mode-line-frame-settings ()
  "Settings of `mode-line-frame.el'."
  (setq mode-line-frame-format mode-line-format)
  (setq mode-line-frame-parameters '((title . "mode-line")
                                     (name . "mode-line-frame")
                                     (cursor-type . nil)
                                     (minibuffer . 1)
                                     (mode-line . 1)
                                     (width . 100)
                                     (height . 10)))
  (message "* ---[ mode-line-frame configuration is complete ]---"))

(provide 'xy-rc-mode-line-frame)
