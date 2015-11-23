;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-11-15 Sun 16:41 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-bibtex.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `helm-bibtex.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun helm-bibtex-postload ()
  "Settings of `helm-bibtex.el' after it's been loaded."

  ;; Add to `helm-bibtex.el' to use it.
  ;; (defun helm-bibtex-format-citation-ox-bibtex (keys)
  ;;   "Formatter for ox-bibtex references in org mode."
  ;;   (s-join ", "
  ;;           (--map (format "[[cite:%s]]" it) keys)))

  (setq helm-bibtex-format-citation-functions
        '((org-mode      . helm-bibtex-format-citation-ox-bibtex)
          (latex-mode    . helm-bibtex-format-citation-cite)
          (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
          (default       . helm-bibtex-format-citation-default)))

  (message "* ---[ helm-bibtex post-load configuration is complete ]---"))

(provide 'xy-rc-helm-bibtex)
