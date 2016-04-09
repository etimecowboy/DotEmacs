;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-07 Thu 09:00 by xin on zbox.soton.ac.uk>
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
;; (defun helm-bibtex-format-citation-ox-bibtex (keys)
;;   "Formatter for ox-bibtex references in org mode."
;;   (s-join ", "
;;           (--map (format "\\nbsp[[cite:%s]]" it) keys)))

;;;###autoload
(defun helm-bibtex-postload ()
  "Settings of `helm-bibtex.el' after it's been loaded."

  ;; new custom variables: from version-20160406
  ;; (cl-loop
  ;;  for var in '("bibliography" "library-path" "pdf-open-function"
  ;;               "pdf-symbol" "format-citation-functions" "notes-path"
  ;;               "notes-template-multiple-files"
  ;;               "notes-template-one-file" "notes-key-pattern"
  ;;               "notes-extension" "notes-symbol" "fallback-options"
  ;;               "browser-function" "additional-search-fields"
  ;;               "no-export-fields" "cite-commands"
  ;;               "cite-default-command"
  ;;               "cite-prompt-for-optional-arguments"
  ;;               "cite-default-as-initial-input" "pdf-field")
  
  (setq helm-bibtex-format-citation-functions
        '((org-mode      . helm-bibtex-format-citation-ox-bibtex)
          (latex-mode    . helm-bibtex-format-citation-cite)
          (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
          (default       . helm-bibtex-format-citation-default)))

  (message "* ---[ helm-bibtex post-load configuration is complete ]---"))

(provide 'xy-rc-helm-bibtex)
