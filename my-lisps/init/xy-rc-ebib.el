;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-13 Wed 16:32 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ebib.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ebib.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun ebib-postload ()
  "Settings of `ebib.el' after it's been loaded."

  (setq ebib-autogenerate-keys t)
  (setq ebib-bibtex-extensions '(".bib" ".bibtex" ".BIB" ".BIBTEX"))
  (setq ebib-citation-commands
    (quote
     ((any
       (("cite" "\\cite%<[%A]%>{%K}")))
      (org-mode
       (("~cite" "\\nbsp[[cite:%K]]")
        ("ebib" "[[ebib:%K][%D]]")))
      (markdown-mode
       (("text" "@%K%< [%A]%>")
        ("paren" "[%(%<%A %>@%K%<, %A%>%; )]")
        ("year" "[-@%K%< %A%>]"))))))
  (setq ebib-create-backups t)
  (setq ebib-file-associations
    (quote
     (("pdf" . "mupdf")
      ("ps"  . "gv")
      ("xoj" . "xournal"))))
  (setq ebib-hide-cursor nil)
  (setq ebib-print-multiline t)
  (setq ebib-index-window-size 35)
  (setq ebib-index-display-fields '("type"))
  (setq ebib-hidden-fields '("addendum" "afterword" "annotator"
  "bookauthor" "booksubtitle" "booktitleaddon" "chapter" "commentator"
  "editora" "editorb" "editorc" "eid" "eprint" "eprintclass"
  "eprinttype" "eventdate" "eventtitle" "foreword" "holder"
  "howpublished" "introduction" "isrn" "issn" "issuesubtitle"
  "issuetitle" "journalsubtitle" "language" "location" "mainsubtitle"
  "maintitle" "maintitleaddon" "month" "origlanguage" "pagetotal"
  "part" "remark" "subtitle" "timestamp" "titleaddon" "translator"
  "urldate" "venue" "version"))

  (setq ebib-layout (quote custom))
  (setq ebib-width 75)

  (message "* ---[ ebib post-load configuration is complete ]---"))

(provide 'xy-rc-ebib)
