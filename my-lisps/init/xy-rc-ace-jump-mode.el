;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:26 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ace-jump-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ace-jump-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; By  grayfox(灰狐狸)@newsmth
;;    用的时候以C-s开始，如果重复匹配少，isearch一下就能定位；反之，就
;;    按M-a，调用ace-jump，不用一直C-s下去了。
;;;###autoload
(defun sl-isearch-ace-jump ()
  "use ace-jump within isearch."

  (interactive)
  (require 'ace-jump-mode)
  (let ((string isearch-string)
        (result isearch-success))
    (flet ((signal (x y) nil))
      (isearch-cancel))
    (and result
         (> (length string) 0)
         (ace-jump-do string))))

;;;###autoload
(defun ace-jump-mode-postload ()
  "Settings of `ace-jump-mode.el' after it's been loaded."

  (if window-system
      (custom-set-faces
       '(ace-jump-face-foreground
         ((t (:foreground "red" :box nil :weight ultra-bold))))
       '(ace-jump-face-background ((t (:foreground "gray40")))))
    (custom-set-faces
     '(ace-jump-face-foreground
       ((t (:foreground "red" :weight ultra-bold))))
     '(ace-jump-face-background ((t (:foreground "gray40"))))))

  (message "* ---[ ace-jump-mode post-load configuration is complete ]---"))

(provide 'xy-rc-ace-jump-mode)
