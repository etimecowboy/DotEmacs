;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-09-13 Thu 09:52 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pp-c-l.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pp-c-l.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun pp-c-l-face ()
  "Face setttings of `pp-c-l.el'."
  (interactive)
  (if window-system
      (custom-set-faces
       '(pp^L-highlight ((t (:underline t :weight bold)))))
    (custom-set-faces '(pp^L-highlight ((t (:background "cyan")))))))

;;;###autoload
(defun pp-c-l-postload ()
  "Settings of `pp-c-l.el' after it's been loaded."

  (setq pp^L-^L-string-function (lambda (win)
                  (make-string
                   (1- (+ (window-width win) -10)) ? )))

  (message "* ---[ pp-c-l post-load configuration is complete ]---"))

(provide 'xy-rc-pp-c-l)
