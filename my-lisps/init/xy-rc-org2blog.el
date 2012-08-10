;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-10 Fri 17:38 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-org2blog.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `org2blog.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun org2blog-postload ()
  "Settings of `org2blog.el' after it's been loaded."
  (setq org2blog/wp-blog-alist
        '(("etimecowboy.wordpress.com"
           :url "http://etimecowboy.wordpress.com/xmlrpc.php"
           :username "etimecowboy"
           :default-title "New Post"
           :default-categories ("Uncategorized")
           :tags-as-categories nil
           ;; :keep-new-lines t
           :confirm t
           ;; :wp-code nil
           )
          ("etimecowboy.sinaapp.com"
           :url "http://etimecowboy.sinaapp.com/xmlrpc.php"
           :username "etimecowboy"
           :default-title "新博文"
           :default-categories ("未分类")
           :tags-as-categories nil
           ;; :keep-new-lines t
           :confirm t
           ;; :wp-code nil
           )
          ))

  (setq org2blog/wp-buffer-template "# -*- mode: org -*-
# Time-stamp:<>
#
#+OPTIONS: toc:nil num:nil todo:nil pri:nil tags:nil ^:nil
#+OPTIONS: TeX:nil LaTeX:nil
#+STARTUP: content showstars oddeven align indent
#+STARTUP: lognotestate hideblocks
#+DATE:    %s
#+CATEGORY: %s
#+TAGS:
#+PERMALINK:
#+PARENT:
#
#+TITLE:  %s
#+AUTHOR: Xin Yang
#+EMAIL:  xin2.yang@gmail.com
#+DESCRIPTION:
")

  ;; fix original function
  (defun ob-get-entry-text ()
    "Return entry text from point with not properties.

Please note that a blank line _MUST_ be present between entry
headers and body."
    (save-excursion
      (save-restriction
        (save-match-data
          (org-narrow-to-subtree)
          (let ((text (buffer-string)))
            (with-temp-buffer
              (insert text)
              (goto-char (point-min))
              (org-mode)
              (while (<= 2 (save-match-data (funcall outline-level)))
                (org-promote-subtree))
              (run-hooks 'o-blog-html-plugins-hook)
              (goto-char (point-min))
              (when (search-forward-regexp "^\\s-*$" nil t)
                (goto-char (match-end 0)))
              (save-excursion
                ;; HACK: add    ^:{}
                (insert "#+OPTIONS: H:7 num:nil  toc:nil d:nil todo:nil <:nil pri:nil tags:nil ^:{}\n\n"))
              (buffer-substring-no-properties (point) (point-max))))))))

  (message "* ---[ org2blog post-load configuration is complete ]---"))

(provide 'xy-rc-org2blog)
