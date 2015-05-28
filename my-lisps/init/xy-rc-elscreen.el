;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-28 Thu 10:21 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-elscreen.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `elscreen.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun elscreen-postload ()
  "Settings of `elscreen.el' after it's been loaded."

 (setq elscreen-display-screen-number t
       ;; elscreen-tab-display-control t
       ;; elscreen-tab-display-kill-screen t
       elscreen-display-tab nil
       elscreen-prefix-key (kbd "C-z"))

 ;; TODO: Keep settings in different frames
 ;; (remove-hook 'after-make-frame-functions 'elscreen-make-frame-confs)
 ;; (remove-hook 'delete-frame-functions 'elscreen-delete-frame-confs)

 (try-require 'elscreen-mew)
 
 (message "* ---[ elscreen post-load configuration is complete ]---"))

(provide 'xy-rc-elscreen)
