;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-06 Mon 17:13 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-openwith.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `openwith.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun openwith-postload ()
  "Settings of `openwith.el' after it's been loaded."

  (setq openwith-associations
        '(("\\.pdf\\'" "okular" (file))
          ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|rm\\|rmvb\\)\\'" "vlc" (file))
          ("\\.jar\\'" "java -jar" (file))))

  (setq openwith-confirm-invocation t)

  (message "* ---[ openwith post-load configuration is complete ]---"))

(provide 'xy-rc-openwith)
