;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-09-11 Tue 19:38 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-autofit-frame.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `autofit-frame.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/toggle-autofit-frame ()
  "Toggle the function of autofit frame."

  (interactive)
  (if (and window-system (not autofit-frames-flag))
      (progn
        (when (try-require 'autofit-frame)
          (setq autofit-frames-flag t)
          (add-hook 'after-make-frame-functions 'fit-frame)
          (add-hook 'temp-buffer-show-hook
                    'fit-frame-if-one-window 'append)))
    (setq autofit-frames-flag nil)))

;;;###autoload
(defun autofit-frame-postload ()
  "Setting for `autofit-frame' after it's been loaded."

  (setq autofit-frames-flag nil)

  (message "* ---[ autofit-frame post-load configuration is complete ]---"))

(provide 'xy-rc-autofit-frame)
