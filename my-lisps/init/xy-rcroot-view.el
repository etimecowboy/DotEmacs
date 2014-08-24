;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-view.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Viewing files in Emacs
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;* View files

;; Allow to view read-only files
(setq view-read-only t)
;; (toggle-read-only t)



;;** view-mode settings
(eval-after-load "view"
  '(progn
     (view-mode-postload)
     ;; (eal-define-keys
     ;;  'view-mode-map
     ;;  `(("U"           View-scroll-page-backward)
     ;;    ("/"           describe-symbol-at-point)
     ;;    ("\C-j"        goto-line)
     ;;    ("'"           switch-to-other-buffer)
     ;;    ("m"           back-to-indentation)
     ;;    ("p"           previous-line-or-backward-button)
     ;;    ("Q"           delete-current-window)
     ;;    ("L"           count-brf-lines)
     ;;    ("1"           delete-other-windows)
     ;;    ("t"           sb-toggle-keep-buffer)
     ;;    ("<backspace>" c-electric-backspace)
     ;;    ("u"           View-scroll-half-page-backward)
     ;;    ("S-SPC"       View-scroll-half-page-backward)
     ;;    ("SPC"         View-scroll-half-page-forward)
     ;;    ("w"           scroll-down)
     ;;    ("d"           scroll-up)
     ;;    (","           find-symbol-go-back)
     ;;    ("1"           delete-other-windows)
     ;;    ("2"           split-window-vertically)
     ;;    ("3"           split-window-horizontally)
     ;;    ("B"           eval-buffer)))
     ))



;;** doc-view
(eval-after-load "doc-view" '(doc-view-postload))
;; REF: (@url :file-name "http://www.idryman.org/blog/2013/05/20/emacs-and-pdf/" :display "Blog post: \"Emacs and PDF\"")
;; Navigate the pages while your cursor is in another window
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)



;;** log-view



;;** hexl-mode
(add-to-list 'auto-mode-alist
             '("\\.\\(exe\\|vsd\\|so\\|dll\\)$" . hexl-mode))



;;** centered-cursor-mode
(autoload 'centered-cursor-mode "centered-cursor-mode" nil t)
(autoload 'global-centered-cursor-mode "centered-cursor-mode" nil t)
(eval-after-load "centered-cursor-mode" '(centered-cursor-mode-postload))
(global-set-key (kbd "<f6> m") 'centered-cursor-mode)
(global-set-key (kbd "<f6> M") 'global-centered-cursor-mode)



;;* Compare buffers/files

;;** diff
(eval-after-load "diff-mode"
  '(progn
     (diff-postload)
     ;; (eal-define-keys
     ;;  'diff-mode-map
     ;;  `(("C-k" diff-hunk-kill)
     ;;    ("SPC" scroll-up)
     ;;    ("'"   switch-to-other-buffer)
     ;;    ("Q"   kill-this-buffer)
     ;;    ("u"   View-scroll-half-page-backward)))
     ;; (eal-define-keys
     ;;  'diff-mode-shared-map
     ;;  `(("k" previous-line)
     ;;    ("K" roll-up)))
     ))



;;** ediff
;; (global-set-key (kbd "<f6> d") 'ediff)
(eval-after-load "ediff"
  '(progn
     (ediff-postload)
     ;; (defun ediff-keys ()
     ;;   (interactive)
     ;;   "`ediff-mode'的按键设置"
     ;;   (define-prefix-command 'ediff-R-map)
     ;;   (define-key-list
     ;;     ediff-mode-map
     ;;     `(("# w" ediff+-toggle-ignore-whitespace)
     ;;       ("u"   ediff-update-diffs)
     ;;       ("/"   ediff-toggle-help)
     ;;       ("c"   ediff-inferior-compare-regions)
     ;;       ("f"   ediff-jump-to-difference)
     ;;       ("j"   ediff+-previous-line)
     ;;       ("k"   ediff-scroll-vertically)
     ;;       ("R"   ediff-R-map)
     ;;       ("R a" ediff-toggle-read-only)
     ;;       ("R b" ediff-toggle-read-only)
     ;;       ("o"   other-window)
     ;;       ("A"   ediff+-goto-buffer-a)
     ;;       ("B"   ediff+-goto-buffer-b))))
     ;; (add-hook 'ediff-keymap-setup-hook 'ediff-keys)
     ))



;;* Grep related settings

;;** Use grep in Emacs
  (eal-define-keys-commonly
   global-map
   `(("C-x G f"   find-grep-in-current-dir)
     ("C-x G F"   find-grep-in-dir)
     ("C-x M-f"   find-grep-current-word-in-current-dir)
     ("C-x M-F"   find-grep-current-word)))
;;   (eal-define-keys
;;    'grep-mode-map
;;    `(("q"     bury-buffer)
;;      ("Q"     kill-this-buffer)
;;      ("1"     delete-other-windows)
;;      ("<"     beginning-of-buffer)
;;      (">"     end-of-buffer)
;;      ("'"     switch-to-other-buffer)
;;      ("u"     scroll-down)
;;      ("S-SPC" Global-scroll-half-page-backward)
;;      ("SPC"   View-scroll-half-page-forward)
;;      ("/"     describe-symbol-at-point)
;;      ("t"     sb-toggle-keep-buffer)
;;      ("N"     select-buffer-forward)
;;      ("P"     select-buffer-backward)
;;      ("L"     count-brf-lines))))
;; (eval-after-load "grep" `(grep-postload))



;;** full-ack
;; ack is a tool like grep, designed for programmers with large trees
;; of heterogeneous source code.
;; ack is written purely in Perl, and takes advantage of the power of
;; Perl's regular expressions.
;; (require 'full-ack)
;; (eal-define-keys
;;  'ack-mode-map
;;  `(("j"   next-line)
;;    ("k"   previous-line)
;;    ("h"   backward-char)
;;    ("l"   forward-char)
;;    ("u"   View-scroll-half-page-backward)
;;    ("SPC" View-scroll-page-forward)
;;    ("o"   other-window)
;;    ("g"   beginning-of-buffer)
;;    ("G"   end-of-buffer)
;;    (">"   end-of-buffer)
;;    ("<"   beginning-of-buffer)
;;    ("1"   delete-other-windows)
;;    ("'"   switch-to-other-buffer)
;;    ("Q"   kill-this-buffer)))
;; (eval-after-load "full-ack" `(full-ack-postload))



;;** ack-and-a-half
;; provides a simple compilation mode for the perl grep-a-like ack
;; (http://petdance.com/ack/).
;; (defalias 'ack 'ack-and-a-half)
;; (defalias 'ack-same 'ack-and-a-half-same)
;; (defalias 'ack-find-file 'ack-and-a-half-find-file)
;; (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)



;;** ack-menu



;;** color-moccur
;; With color-moccur, you can search a regexp in all buffers. And you
;; can search files like grep(-find) without grep (and find) command.
(autoload 'moccur-grep-find "color-moccur" nil t)
(eval-after-load "color-moccur" '(moccur-postload))
(global-set-key (kbd "<f7> g") 'moccurd)
(global-set-key (kbd "<f7> f") 'moccur-grep-find)

;;*** moccur-edit
;; moccur-edit provides to edit moccur buffer of color-moccur.el and
;; to apply the changes to the file.
;; You can start editing the names of the files by typing "C-c C-i" or
;; "C-x C-q".
;; Use C-c C-f when finished or C-c C-k to abort or C-c C-r to remove
;; the changes in the region.
(eval-after-load "moccur-edit" '(moccur-edit-postload))



;;** ioccur
;; This package provide similar functionality as occur but is
;; incremental, (without `anything')
;; REF: (@url :file-name "http://mercurial.intuxication.org/hg/ioccur" :display "Source")
(autoload 'ioccur "ioccur" "Incremental occur" t)
(global-set-key (kbd "<f7> s") 'ioccur)



(provide 'xy-rcroot-view)
