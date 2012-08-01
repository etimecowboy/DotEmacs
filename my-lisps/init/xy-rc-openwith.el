;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:32 by xin on XIN-PC>
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

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun openwith-settings ()
  "Settings of `openwith.el'."
  (GNULinux
   (setq openwith-associations
         '(
           ("\\.pdf\\'" "acroread" (file))
           ;; ("\\.mp3\\'" "xmms" (file))
           ("\\.\\(?:mpe?g\\|avi\\|wmv\\|mkv\\|rm\\|rmvb\\)\\'" "smplayer" (file))
           ;; ("\\.\\(?:jp?g\\|png\\)\\'" "display" (file))
           ("\\.jar\\'" "java -jar" (file))
           )))
  (message "* ---[ openwith configuration is complete ]---")
)

(provide 'xy-rc-openwith)
