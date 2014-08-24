;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-xcscope.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `xcscope.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; Fix the bug of `cscope-bury-buffer'
;; ;;;###autoload
;; (defun cscope-bury-buffer ()
;;   "Clean up cscope, if necessary, and bury the buffer."
;;   (interactive)
;;   (other-window 1)
;;   (delete-other-windows))

;;;###autoload
(defun cscope-bury-buffer ()
  "Clean up cscope, if necessary, and bury the buffer."
  (interactive)
  (let ()
    (if overlay-arrow-position
        (set-marker overlay-arrow-position nil))
    ;; (setq overlay-arrow-position nil
    ;;       overlay-arrow-string nil)
    ;; (bury-buffer (get-buffer cscope-output-buffer-name))
    (bury-buffer)
    (delete-window)))

;;;###autoload
(defun xcscope-postload ()
  "Settings of `xcscope' after it's been loaded."

  (setq cscope-database-file "cscope.out"
        cscope-index-file "cscope.files"
        cscope-index-recursively t
        cscope-indexing-script "cscope-indexer"
        cscope-program "cscope"
        cscope-truncate-lines t
        cscope-use-face t)
  (GNULinux
   (setq cscope-indexing-script "cscope-indexer"))
  (Windows
   (setq cscope-indexing-script
         "cscope-indexer.bat"))
  ;; (define-key cscope-list-entry-mode-map (kbd "q") 'xy/cscope-quit)

  (message "* ---[ xcscope post-load configuration is complete ]---"))

(provide 'xy-rc-xcscope)
