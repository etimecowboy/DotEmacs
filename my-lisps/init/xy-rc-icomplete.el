;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:30 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-icomplete.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `icomplete.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun icomplete-settings ()
  "Settings for `icomplete'."
  ;; There is a icomolete+ available, check it later.
  ;; Here I use ahei's hacked version of icomplete+.
  (require 'icomplete+)
  (message "* ---[ icomplete configuration is complete ]---"))

;; ;;;###autoload
;; (defun icomplete+-face-settings ()
;;   "Face settings for `icomplete+'."
;;   (custom-set-faces '(icompletep-nb-candidates
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (custom-set-faces '(icompletep-determined
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green"))))
;;   (custom-set-faces '(icompletep-choices
;;                       ((((type tty)) :bold t :foreground "yellow")
;;                        (t :foreground "yellow"))))
;;   (custom-set-faces '(icompletep-nb-candidates
;;                       ((((type tty)) :bold t :foreground "green")
;;                        (t :foreground "green")))))

(provide 'xy-rc-icomplete)
