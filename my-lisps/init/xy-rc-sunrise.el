;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-15 Tue 00:05 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sunrise.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sunrise.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun sunrise-postload ()
  "Settings of `sunrise.el' after it's been loaded."

  (require 'frame-cmds)
  
  (setq ;; sr-avfs-root "~/"
        sr-history-length 100
        sr-show-file-attributes nil
        sr-show-hidden-files t
        sr-windows-default-ratio 60
        sr-window-split-style (quote horizontal))

  (setq sr-start-hook
        '(maximize-frame
          sr-tree-menu-init
          sr-tabs-start-once
          sr-modeline-start-once))

  (require 'sunrise-commander)
  (require 'sunrise-x-buttons) ;; cannot be used with popviewer
  (require 'sunrise-x-popviewer) ;; cannot be used with buttons
  (sr-popviewer-mode -1)
  (require 'sunrise-x-checkpoints)
  (require 'sunrise-x-loop)
  (require 'sunrise-x-mirror)
  (require 'sunrise-x-modeline)
  (require 'sunrise-x-tabs)
  (require 'sunrise-x-tree)
  (Windows
   (require 'sunrise-x-w32-addons))

  (message "* ---[ sunrise post-load configuration is complete ]---"))

(provide 'xy-rc-sunrise)
