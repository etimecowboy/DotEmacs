;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-05-30 Mon 02:04 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-write.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My writing packages' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)



;;; muse
;; (eval-after-load "muse-mode" '(muse-postload))



;;; org
(add-to-list 'auto-mode-alist
             '("\\.\\(org\\|org_archive\\)$" . org-mode))

(eval-after-load "org"
  '(progn
     (org-postload)
     ;; (org-google-agenda-maps-key-bindings)
     (eal-define-keys
      'org-mode-map
      `(;; ("C-c C"       xy/org-html-chinese-no-extra-space)
        ;; ("C-c o m"     org2blog/wp-mode)
        ;; ("C-c o l"     org2blog/wp-login)
        ;; ("c-c o t"     org2blog/wp-post-subtree)
        ;; ("C-c S"       org-export-as-html5presentation-and-open)
        ;; ("C-c M-c"     org-coordinates-google-geocode-set)
        ;; ("C-c M-L"     org-address-google-geocode-set)
        ;; ("C-c M-A"     org-address-google-geocode-set)
        ;; ("C-c M-l"     org-location-google-maps)
        ;; ("C-c G"       org-publish-blog) ;; o-blog v1
        ("C-c o p"       o-blog-publish) ;; o-blog v2
        ;; ("C-c o x"       xy/org-toggle-xelatex)
        ;; ("C-c o r"       xy/org-mode-reftex-setup)
        ("C-c o e"       org-toggle-link-display)
        ("C-c o ."       timestamp)
        ("C-c o h"       bh/hide-other)
        ("C-c o t"       org-todo)
        ;; ("C-c b"       ebib-insert-bibtex-key)
        ))
      (define-key org-mode-map (kbd "C-c C-t") nil)
     ))

(eval-after-load "org-agenda" '(org-postload))
(eval-after-load "org-capture" '(org-postload))
;; (global-set-key (kbd "<f12> <f12>") 'org-agenda)
(global-set-key (kbd "C-c o a")     'org-agenda)
;; (global-set-key (kbd "<f12> <f11>") 'org-capture)
(global-set-key (kbd "C-c o c")     'org-capture)
;; (global-set-key (kbd "<f12> <f10>") 'org-store-link)
(global-set-key (kbd "C-c o l")     'org-store-link)

;; (eal-define-keys-commonly
;;  global-map
;;  `(("<f12> <f12>"   org-agenda)
;;    ("<f12> <f11>"   org-capture)
;;    ("<f12> <f10>"   org-store-link)
;;    ;; ("C-c o"   org-ctags-find-tag-interactive)
;;    ;; ("<f12> b"       org-ido-switchb)
;;    ;; ("C-c n"   org2blog/wp-new-entry)
;;    ;; ("M-S-w"   tzz-copy-region-with-mode-property)
;;    ))

;; BUG: when use this to fix org-agenda/org-mobile-push error ((error
;;      function `appt-make-list') in Emacs24 ((@url :file-name "http://www.mail-archive.com/emacs-orgmode@gnu.org/msg47051.html" :display "REF")) .
;; (add-hook 'diary-hook (function appt-make-list))

;;;; `o-blog'
;; A stand-alone blog and publication tool for org-mode.
(eval-after-load "o-blog" '(o-blog-postload))

;;;; `org2blog'
;; use publish org to HTML then use xml-rpc to blog
(eval-after-load "org2blog" '(org2blog-postload))

;;;; `outshin'
(eval-after-load "outshine" '(outshine-postload))

;;;; `ox-s5'
(eval-after-load "ox-s5" '(ox-s5-postload))

;;;; `org-present'
(eval-after-load "org-present" '(org-present-postload))


;; NOTE: not very useful
;; ;;; deft
;; (eval-after-load "deft" '(deft-postload))
;; (global-set-key (kbd "<f6> d") 'deft)



;;; auctex
(eval-after-load "latex"
  '(progn
     (auctex-postload)
     ;; (eal-define-keys ;; BUG: not working
     ;;  'latex-mode-map
     ;;  `(("C-x `" TeX-next-error)))
     ;; (eal-define-keys ;; BUG: not working
     ;; 'LaTeX-mode-map
     ;; `(("C-c b" ebib-insert-bibtex-key)))
     )) ;; default C-c ` conflict with icy-mode
;; (global-set-key (kbd "<f6> t") 'xy/auctex-start)



;;;; reftex
;; reference
(eval-after-load "reftex" '(reftex-postload))
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" t)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)



;; ** ebib
;; reference
(eval-after-load "ebib" '(ebib-postload))
(global-set-key (kbd "<f6> b") 'ebib)



;;;; cdlatex, tex writing tools
(eval-after-load "cdlatex" '(cdlatex-postload))
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)



;;;; whizzytex-mode
;; A minor mode for incrementally viewing LATEX documents that you are
;; editing. It works under Unix with `gv' and `xdvi' viewers, but the
;; ActiveDVI `advi' viewer will provide much better visual effects and
;; offer more functionalities.
;; NOTE: - whizztex now only support latex engine, NOT pdflatex.
;;       - Chinese is not supported.
;; (eval-after-load "Whizzytex-mode" '(whizzytex-postload))
;; (global-set-key (kbd "<f6> w") 'xy/whizzytex-start)



;;;; wysiwyg-tex
;; REF: (@url :file-name "https://github.com/laysakura/WYSIWYG-TeX-el" :display "Source")
;; WYSIWYG (What You See Is What You Get) tex writitng mode using
;; `doc-view.el' and `doc-view-fit-page.el'
;; (autoload 'wysiwyg-tex-show-preview "wysiwyg-tex" nil t)
;; (autoload 'wysiwyg-tex-show-whole-preview "wysiwyg-tex" nil t)
;; (eval-after-load "wysiwyg-tex" '(wysiwyg-tex-postload))
;; (add-hook 'tex-mode-hook
;;           ;; key-binds for tex-mode
;;           (local-set-key "\C-c\C-t" ; Displays a page around cursor.
;;                          'wysiwyg-tex-show-preview)
;;           (local-set-key "\C-c\C-T" ; Displays the whole page.
;;                          'wysiwyg-tex-show-whole-preview))



;;; txt2tags
;; convert plain text files to various formats
(setq auto-mode-alist
      (append (list '("\\.t2t$" . t2t-mode))
              (if (boundp 'auto-mode-alist) auto-mode-alist)))
(autoload 't2t-mode "txt2tags-mode" "Txt2tags Mode" t)



;;; pdftools
;; Save current buffer as a pdf file
;; Should be used with `ps2pdf', which usually comes with a tex
;; distribution
(autoload 'pdf-save-buffer "pdftools.el"
  "Save buffer as a pdf file." t)
(autoload 'pdf-save-buffer-with-faces "pdftools.el"
  "Save buffer as a pdf file with faces." t)
(autoload 'pdf-save-region "pdftools.el"
  "Save region as a pdf file." t)
(autoload 'pdf-save-region-with-faces "pdftools.el"
  "Save region as a pdf file with faces." t)



;;; markdown-mode
;; major mode for editing [Markdown][]-formatted text files
;; REF: (@url :file-name "http://jblevins.org/projects/markdown-mode/" :display "Source")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))



;;; artbollecks-mode and words-to-avoid-mode
;; Highlight bad words for academic writings
;; REF: (@url :file-name "https://gitorious.org/robmyers/scripts/trees/master" :display "Git Source")
;; (require 'artbollocks-mode)
;; (add-hook 'text-mode-hook 'turn-on-artbollocks-mode)
;; (add-hook 'org-mode-hook 'turn-on-artbollocks-mode)
;; NOTE: artbollecks-mode uses key binding `C-c /' which blocks
;; org-mode sparse-tree-mode command, `C-c [' and `C-c ]' which block
;; reftex key bindings.
(autoload 'turn-on-artbollocks-mode "artbollocks-mode" nil t)
;; (am-add-hooks
;;  `(LaTeX-mode-hook latex-mode-hook)
;;  'turn-on-artbollocks-mode)

;; (require 'words-to-avoid-mode)
;; (add-hook 'text-mode-hook 'turn-on-words-to-avoid-mode)
;; (add-hook 'org-mode-hook 'turn-on-words-to-avoid-mode)

(provide 'xy-rcroot-write)
