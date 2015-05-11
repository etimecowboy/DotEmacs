;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;;--------------------------------------------------------------------
;; File name:    `init.el'
;; Time-stamp: <2015-05-05 Tue 14:40 by xin on zbox.soton.ac.uk>
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


(message "* ---[ Loading Emacs init file ...]---")

;;* Debug Emacs

;;** Debugging information
;; Enter debug mode on a error, now you should get a backtrace
;; NOTE: cause problem in emacs-snapshot version
;; (setq debug-on-error t)
;; (setq debug-on-quit t) ;; Too annoying
;; NOTE: M-x toggle-debug-on-quit使用这条命令后，每次卡住后，马上按C-g，
;; 就会打出当前执行函数的调用栈，是哪个函数造成的卡住，也就一目了然了。
;; 然后根据这个造成卡住的函数属于哪个扩展包，再分别想解决办法。

;; (setq max-specpdl-size 5) ;; Set max depth of dirctory. Default is 1000, reduce the backtrace level
(setq max-specpdl-size 80000)
;; BUG: in -nw mode, Emacs 23.3 report a error in spite of how large
;; the value is. It may related to an Emacs bug. Moreover, if the size
;; set too large, it cause a error in Windows.

(setq max-lisp-eval-depth 40000) ;; Set max depth of lisp evaluation
(setq message-log-max 100000) ;; Set a large message log file for checking

;;** Compilation message
(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)

;;** Measure the loading time
(defconst start-time (float-time))
(defvar last-time start-time)

(defun measure-time (txt)
  "Measures the loading time of the txt file."
  (message "* @@@[ %s loaded in %2.3f seconds, \
%2.3f seconds elapsed ]@@@"
           txt
           (- (float-time) last-time)
           (- (float-time) start-time))

  (when (and nil (eq system-type 'windows-nt))
    (with-temp-file (concat (getenv "TEMP") "/runningep.flg")
      (insert "Loaded ")
      (insert txt)))
  (setq last-time (float-time)))

;;*** Another way of measuring the loading time per file.
(defadvice load-time (around load-with-time-logging)
  "display the load time for each file."
  (let ((now (float-time)))
    ad-do-it
    (message "* @@@[ %2.3f seconds used ]@@@"
             (- (float-time) now))))
(ad-activate 'load-time)


;; Add `my-init-lisp-path' (defined in `xy-rc-util.el') to load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/my-lisps/init"))

;; NOTE: when using `require' in the init.el to load other setting files,
;; you have to restart Emacs.
;; When using `load', Emacs will load every setting files.

;; Load environment settings
;; (require 'xy-rcroot-env)
(load "xy-rcroot-env")
(measure-time "xy-rcroot-env.el")

;; Emacs apparence
;; (require 'xy-rcroot-look)
(load "xy-rcroot-look")
(measure-time "xy-rcroot-look.el")

;; Some enhancements
;; (require 'xy-rcroot-enhance)
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

;; Save history information between emacs sessions
;; Must be put at last to avoid failing
(load "xy-rcroot-history")
(measure-time "xy-rcroot-history.el")

(measure-time "init.el")
(message "* ---[ Emacs is ready!]---" (getenv "USER"))
