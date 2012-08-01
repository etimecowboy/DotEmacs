;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:07 by xin on p5q>
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
(defun etags-settings ()
  "Settings of `etags.el'."
  (defadvice find-tag (before tags-file-name-advice activate)
    "Find TAGS file in ./ or ../ or ../../ dirs"
    (let ((list (mapcar 'expand-file-name '("./TAGS" "../TAGS" "../../TAGS"))))
      (while list
        (if (file-exists-p (car list))
            (progn
              (setq tags-file-name (car list))
              (setq list nil))
          (setq list (cdr list))))))
  (message "* ---[ etags configuration is complete ]---"))

(provide 'xy-rc-etags)
