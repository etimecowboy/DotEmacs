;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:38 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun woman-settings ()
  "Settings for `woman-mode'."
  (add-to-list 'woman-manpath my-local-man-path)
  (setq woman-cache-filename (concat my-var-path "/wmncach"))
  (unless (file-exists-p woman-cache-filename)
    (shell-command (concat "touch " woman-cache-filename)))
  (setq woman-use-own-frame t)
  (setq woman-fill-column 100)

  (defun woman-mode-hook-settings ()
    "Settings for `woman-mode'."
    (setq truncate-lines nil))
  (am-add-hooks 'woman-mode-hook 'woman-mode-hook-settings)

  (message "* ---[ woman configuration is complete ]---"))

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
