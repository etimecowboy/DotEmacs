;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:29 by xin on p5q>
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
  (GNULinux
   (setq openwith-associations
         '(
           ("\\.pdf\\'" "acroread" (file))
           ;; ("\\.mp3\\'" "xmms" (file))
           ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|rm\\|rmvb\\)\\'" "smplayer" (file))
           ;; ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file))
           ("\\.jar\\'" "java -jar" (file))
           )))
  (message "* ---[ openwith post-load configuration is complete ]---"))

(provide 'xy-rc-openwith)
