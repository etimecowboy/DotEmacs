;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:02 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark+.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `bookmark+.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun bookmark+-settings ()
  "Settings of `bookmark+.el'."
  (setq bmkp-bmenu-commands-file
        (concat my-var-path "/emacs-bmk-bmenu-commands.el"))
  (setq bmkp-bmenu-state-file
        (concat my-var-path "/emacs-bmk-bmenu-state.el"))
  ;; BUG: bmkp auto write fail
  ;; NOTE: always uses the value of `bookmark-default-file' as the
  ;; initial bookmark file.
  (setq-default bmkp-last-as-first-bookmark-file nil)
                ;; (concat my-var-path "/bookmark-"
                ;;         user-login-name "@"
                ;;         system-name "@"
                ;;         system-configuration))
  ;; `bmkp-last-as-first-bookmark-file' value to emacs custom file.
  ;; Use a same bookmark file, in order to maitain the consistancy
  ;; among different OSs.
  ;; (unless (file-exists-p bmkp-last-as-first-bookmark-file)
  ;;   (shell-command (concat "touch " bmkp-last-as-first-bookmark-file)))
  (message "* ---[ bookmark+ configuration is complete ]---"))

(provide 'xy-rc-bookmark+)
