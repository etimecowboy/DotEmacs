;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:17 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-etags.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `etags.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun etags-postload ()
  "Settings of `etags.el' after it's been loaded."
  (defadvice find-tag (before tags-file-name-advice activate)
    "Find TAGS file in ./ or ../ or ../../ dirs"
    (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
      (while list
        (if (file-exists-p (car list))
            (progn
              (setq tags-file-name (car list))
              (setq list nil))
          (setq list (cdr list))))))
  (message "* ---[ etags post-load configuration is complete ]---"))

(provide 'xy-rc-etags)
