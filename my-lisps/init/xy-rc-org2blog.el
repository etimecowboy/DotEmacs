;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
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

  (setq org2blog/wp-buffer-template "#   -*- mode: org; coding: utf-8-unix  -*-
# Time-stamp:<>
#+DATE:     %s
#+CATEGORY: %s
#+TAGS:
#+PERMALINK:
#+PARENT:
#+TITLE:  %s
#+AUTHOR: etimecowboy
#+EMAIL:  etimecowboy@gmail.com
#+DESCRIPTION:
* COMMENT Org mode settings
** COMMENT General options
#+OPTIONS: ,:t *:t -:t ::t <:t :nil ^:{} |:t
#+OPTIONS: arch:nil author:t c:nil creator:nil d:nil e:t email:nil
#+OPTIONS: f:t H:7 inline:nil num:nil p:nil pri:nil stat:nil
#+OPTIONS: tags:nil tasks:t timestamp:t toc:t todo:nil
#+OPTIONS: tex:imagemagick latex:t
#+STARTUP: overview noindent align noinlineimages nolatexpreview
#+STARTUP: showstars oddeven showblocks entitiesplain
#+EXPORT_SELECT_TAGS: export
#+EXPORT_EXCLUDE_TAGS: noexport
")

  (setq org2blog/wp-buffer-format-function 'org2blog/wp-format-buffer
        org2blog/wp-confirm-post t
        org2blog/wp-default-categories '("Uncategorized" "Hello")
        org2blog/wp-default-title "Hello, World"
        org2blog/wp-keep-new-lines nil
        org2blog/wp-keymap-prefix "C-c M-p"
        org2blog/wp-show-post-in-browser t
        org2blog/wp-use-tags-as-categories nil)
  
  (setq org2blog/wp-sourcecode-default-params "light=\"true\""
        org2blog/wp-sourcecode-langs
        '(;; "actionscript3"
          "bash"
          ;; "coldfusion"
          "cpp" "csharp"
          "css"
          ;; "delphi"
          ;; "erlang"
          ;; "fsharp"
          "diff"
          ;; "groovy"
          "javascript"
          "java"
          ;; "javafx"
          "matlab"
          "objc"
          "perl"
          "php"
          "text"
          "powershell"
          "python"
          "ruby"
          ;; "scala"
          "sql"
          "vb"
          "xml")
        org2blog/wp-use-sourcecode-shortcode t)
  
  (setq org2blog/wp-use-wp-latex t)

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
