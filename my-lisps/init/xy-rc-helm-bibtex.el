;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-13 Wed 15:31 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;; move to `bibtex-completion.el'
;; ;;;###autoload
;; (defun bibtex-completion-format-citation-ox-bibtex (keys)
;;   "Formatter for ox-bibtex references in org mode."
;;   (s-join ", "
;;           (--map (format "\\nbsp[[cite:%s]]" it) keys)))

;;;###autoload
(defun helm-bibtex-postload ()
  "Settings of `helm-bibtex.el' after it's been loaded."

  (setq bibtex-completion-additional-search-fields
        (quote ("Title" "Year" "Editor")))

  ;; BUG: error when loading bib file 2016-04-13
  ;; (setq bibtex-completion-pdf-field "File" t)

  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (call-process "mupdf" nil 0 nil fpath)))

  (setq bibtex-completion-format-citation-functions
        '((org-mode      . bibtex-completion-format-citation-ox-bibtex)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default)))
  
  ;; FIXME: change to use xournal notes (.xoj)
  ;; (defun bibtex-completion-open-annotated-pdf (key)
  ;;   (let ((pdf (car (bibtex-completion-find-pdf-in-library (s-concat key "-annotated")))))
  ;;     (if pdf
  ;;         (bibtex-completion-pdf-open-function pdf)
  ;;       (message "No annotated PDF found."))))
  ;; (helm-add-action-to-source "Open annotated PDF (if present)"
  ;;                            'bibtex-completion-open-annotated-pdf helm-source-bibtex 1)

  (message "* ---[ helm-bibtex post-load configuration is complete ]---"))

(provide 'xy-rc-helm-bibtex)
