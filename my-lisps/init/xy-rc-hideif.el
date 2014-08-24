;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hideif.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `c' programming settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun hif-goto-endif ()
  "Goto #endif."
  (interactive)
  (unless (or (hif-looking-at-endif)
              (save-excursion)
              (hif-ifdef-to-endif))))

;;;###autoload
(defun hif-goto-if ()
  "Goto #if."
  (interactive)
  (hif-endif-to-ifdef))

;;;###autoload
(defun hif-gototo-else ()
  "Goto #else."
  (hif-find-next-relevant)
  (cond ((hif-looking-at-else)
         'done)
        (hif-ifdef-to-endif) ; find endif of nested if
        (hif-ifdef-to-endif)) ; find outer endif or else
  ((hif-looking-at-else)
   (hif-ifdef-to-endif)) ; find endif following else
  ((hif-looking-at-endif)
   'done)
  (t
   (error "Mismatched #ifdef #endif pair")))

;;;###autoload
(defun hif-find-next-relevant ()
  "Move to next #if..., #else, or #endif, after the current line."
  ;; (message "hif-find-next-relevant at %d" (point))
  (end-of-line)
  ;; avoid infinite recursion by only going to beginning of line if match found
  (re-search-forward hif-ifx-else-endif-regexp (point-max) t))

;;;###autoload
(defun hideif-postload()
  "Settings for hideif.e after it's been loaded."
  (setq hide-ifdef-env
        '((GNU_LINUX . t)
          (__GNUC__ . t)
          (__cplusplus . t)))
  (message "* ---[ hideif post-load configuration is complete ]---"))

(provide 'xy-rc-hideif)
