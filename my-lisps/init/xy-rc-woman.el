;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:58 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-woman.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `woman' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun woman-postload ()
  "Settings for `woman-mode' after it's been loaded."

  (add-to-list 'woman-manpath my-local-man-path)
  (setq woman-cache-filename
        (concat my-var-path "/wmncach-"
                user-login-name "-"
                system-name "-"
                system-configuration))
  ;; (unless (file-exists-p woman-cache-filename)
  ;;   (shell-command (concat "touch " woman-cache-filename)))
  (setq woman-use-own-frame nil) ;; t have problem after close the man frame
  (setq woman-fill-column 100)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))
  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings)

  (message "* ---[ woman post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun woman-face-settings ()
;;   "Face settings for `woman'."
;;   (set-face-foreground 'woman-italic "green")
;;   (set-face-foreground 'woman-bold "red")
;;   (custom-set-faces
;;    '(woman-bold
;;      ((((class color)) :foreground "red" :bold nil))))
;;   (set-face-foreground 'woman-addition "yellow")
;;   (set-face-foreground 'woman-unknown "blue"))

(provide 'xy-rc-woman)
