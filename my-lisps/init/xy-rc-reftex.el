;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-reftex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `reftex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun reftex-settings ()
  "Settings of `reftex.el'."

  (setq reftex-default-bibliography
        (list "~/emacs/org/source/phd/bib/bio"
              "~/emacs/org/source/phd/bib/lyon"
              "~/emacs/org/source/phd/bib/meddis"
              "~/emacs/org/source/phd/bib/patterson"
              "~/emacs/org/source/phd/bib/manuals"))

  ;;;;;;设置更深层的目录;;;;;;;;;;;;;
  (setq reftex-section-levels
        '(("part" . 0)
          ("chapter" . 1)
          ("section" . 2)
          ("subsection" . 3)
          ("frametitle" . 4)
          ("subsubsection" . 4)
          ("paragraph" . 5)
          ("subparagraph" . 6)
          ("addchap" . -1)
          ("addsec" . -2)))

  ;;*toc*buffer 在左侧。
  ;; (setq reftex-toc-split-windows-horizontally t)
  ;;*toc*buffer 使用整个 frame 的比例。
  (setq reftex-toc-split-windows-fraction 0.4)

  (message "* ---[ reftex configuration is complete ]---"))

(provide 'xy-rc-reftex)
