;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `init.el'
;; Time-stamp: <2012-08-10 Fri 22:54 by xin on XIN-PC>
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My emacs init file
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

;; Enter debug mode on a error
;; (setq debug-on-error t)      ; now you should get a backtrace
;; Set max depth of dirctory
;; (setq max-specpdl-size 5)  ; default is 1000, reduce the backtrace level

(message "* ---[ Loading my Emacs init file ]---")

;; (defconst emacs-load-time-start (float-time))
;; (defvar emacs-last-time emacs-load-time-start)
;; (defun measure-time (txt)
;;   "*Emacs Time"
;;   (message "* ---[ Emacs %s loaded in %1f seconds, \
;; %1f seconds elapsed ]---"
;;            txt
;;            (- (float-time) emacs-last-time)
;;            (- (float-time) emacs-load-time-start))

;;   (when (and nil (eq system-type 'windows-nt))
;;     (with-temp-file (concat (getenv "TEMP") "/runningep.flg")
;;       (insert "Loaded ")
;;       (insert txt)))
;;   (setq emacs-last-time (float-time)))

;; measure the loading time per file.
;; (defadvice load-time (around load-with-time-logging)
;;   "display the load time for each file."
;;   (let ((now (float-time)))
;;     ad-do-it
;;     (message "* ---[ %2.3f seconds used ]---"
;;              (- (float-time) now))))
;; (ad-activate 'load-time)

;; Add ~/.emacs.d/my-lisp to Emacs lisp load path
;; (add-to-list 'load-path "~/.emacs.d/my-lisps")
(add-to-list 'load-path "~/.emacs.d/my-lisps/init")

;; Load environment settings
;; (require 'xy-rcroot-env)
(load "xy-rcroot-env")

;; Emacs apparence
;; (require 'xy-rcroot-app)
(load "xy-rcroot-app")

;; Some enhancements
;;(require 'xy-rcroot-enhance)
(load "xy-rcroot-enhance")

;; Editing settings
;; (require 'xy-rcroot-edit)
(load "xy-rcroot-edit")

;; Various abbrevations and auto-completions
;; (require 'xy-rcroot-complete)
(load "xy-rcroot-complete")

;; Viewing/Comparing files
;; (require 'xy-rcroot-view)
(load "xy-rcroot-view")

;; BUG: cause AC out of order.
;; File management
;; (require 'xy-rcroot-filemgr)
(load "xy-rcroot-filemgr")

;; Web application packages
;; (require 'xy-rcroot-net)
(load "xy-rcroot-net")

;; Various programming settings
;; (require 'xy-rcroot-prog)
(load "xy-rcroot-prog")

;; Document packages
;; (require 'xy-rcroot-write)
(load "xy-rcroot-write")

;; Save editor information between emacs sessions
;; Must be put at last to avoid failing
;; (require 'xy-rcroot-session)
(load "xy-rcroot-session")
