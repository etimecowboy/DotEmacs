;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `init.el'
;; Time-stamp: <2012-08-14 Tue 09:14 by xin on XIN-PC>
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

;; measure the loading time
(defconst start-time (float-time))
(defvar last-time start-time)

(defun measure-time (txt)
  "Measures the loading time of the txt file."
  (message "* @@@[ %s loaded in %1f seconds, \
%1f seconds elapsed ]@@@"
           txt
           (- (float-time) last-time)
           (- (float-time) start-time))

  (when (and nil (eq system-type 'windows-nt))
    (with-temp-file (concat (getenv "TEMP") "/runningep.flg")
      (insert "Loaded ")
      (insert txt)))
  (setq last-time (float-time)))

(measure-time "init.el")

;; Another way of measuring the loading time per file.
;; (defadvice load-time (around load-with-time-logging)
;;   "display the load time for each file."
;;   (let ((now (float-time)))
;;     ad-do-it
;;     (message "* @@@[ %2.3f seconds used ]@@@"
;;              (- (float-time) now))))
;; (ad-activate 'load-time)

;; Add ~/.emacs.d/my-lisp to Emacs lisp load path
;; (add-to-list 'load-path "~/.emacs.d/my-lisps")
(add-to-list 'load-path "~/.emacs.d/my-lisps/init")

;; Load environment settings
;; (require 'xy-rcroot-env)
(load "xy-rcroot-env")
(measure-time "xy-rcroot-env.el")

;; Emacs apparence
;; (require 'xy-rcroot-app)
(load "xy-rcroot-app")
(measure-time "xy-rcroot-app.el")

;; Some enhancements
;;(require 'xy-rcroot-enhance)
(load "xy-rcroot-enhance")
(measure-time "xy-rcroot-enhance.el")

;; Editing settings
;; (require 'xy-rcroot-edit)
(load "xy-rcroot-edit")
(measure-time "xy-rcroot-edit.el")

;; Various abbrevations and auto-completions
;; (require 'xy-rcroot-complete)
(load "xy-rcroot-complete")
(measure-time "xy-rcroot-complete.el")

;; Viewing/Comparing files
;; (require 'xy-rcroot-view)
(load "xy-rcroot-view")
(measure-time "xy-rcroot-view.el")

;; BUG: cause AC out of order.
;; File management
;; (require 'xy-rcroot-filemgr)
(load "xy-rcroot-filemgr")
(measure-time "xy-rcroot-filemgr.el")

;; Web application packages
;; (require 'xy-rcroot-net)
(load "xy-rcroot-net")
(measure-time "xy-rcroot-net.el")

;; Various programming settings
;; (require 'xy-rcroot-prog)
(load "xy-rcroot-prog")
(measure-time "xy-rcroot-prog.el")

;; Document packages
;; (require 'xy-rcroot-write)
(load "xy-rcroot-write")
(measure-time "xy-rcroot-write.el")

;; Save editor information between emacs sessions
;; Must be put at last to avoid failing
;; (require 'xy-rcroot-session)
(load "xy-rcroot-session")
(measure-time "xy-rcroot-session.el")

(measure-time "init.el")
