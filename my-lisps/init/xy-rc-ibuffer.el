;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-05-22 Mon 17:50 by xin on xinud>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ibuffer.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ibuffer.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun count-buffers ()
  "list the buffer numbers to see if you are hard working or not."
  (interactive)
  (setq l (buffer-list))
  (message "%d Buffers right now" (length l)))

;;;###autoload
(defun ibuffer-postload ()
  "Settings of `ibuffer' after it's been loaded."
  ;; ibuffer, advanced replacement for the `buffer-menu
  ;; (if is-before-emacs-21 (require 'ibuffer-for-21))

  ;; select-buffer,
  ;; 像linux系统下alt-tab那样选择buffer, 但是更直观, 更方便
  ;; (require 'select-buffer)

  (setq ibuffer-default-sorting-mode '(major-mode))

  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/IbufferMode" :display "emacswiki")
  ;; Use human readable Size column instead of original one
  ;; (define-ibuffer-column size-h
  ;;   (:name "Size" :inline t)
  ;;   (cond
  ;;    ((> (buffer-size) 1000) (format "%7.3fk" (/ (buffer-size) 1000.0)))
  ;;    ((> (buffer-size) 1000000) (format "%7.3fM" (/ (buffer-size) 1000000.0)))
  ;;    (t (format "%8d" (buffer-size)))))

  ;; Modify the default ibuffer-formats
  ;;
  ;; NOTE: not working in Emacs 25
  ;; ;; Explicitly require ibuffer-vc to get its column definitions, which
  ;; ;; can't be autoloaded
  ;; (require 'ibuffer-vc)
  ;; (setq ibuffer-formats
  ;;       '((mark modified read-only vc-status-mini " "
  ;;               (name 50 50 :right :elide)
  ;;               " | "
  ;;               (size  9 -1 :right)
  ;;               " | "
  ;;               (mode 10 10 :left :elide)
  ;;               " | "
  ;;               (vc-status 16 16 :left)
  ;;               ;; Not very useful
  ;;               ;; " | "
  ;;               ;; (filename-and-process 30 30 :left :elide)
  ;;               )))

  (setq ibuffer-formats
        '((mark modified read-only " "
                (name 50 50 :right :elide)
                " | "
                (size  9 -1 :right)
                " | "
                (mode 20 20 :left :elide)
                ;; Not very useful
                ;; " | "
                ;; (filename-and-process 30 30 :left :elide)
                )))
  
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("src" (or
                   (mode . matlab-mode)
                   (mode . c-mode)
                   (mode . cc-mode)
                   (mode . C++/lah)
                   (mode . python-mode)
                   (mode . ein:notebook-multilang-mode)
                   (mode . emacs-lisp-mode)
                   (mode . lisp-interaction-mode)
                   (mode . vhdl-mode)
                   (mode . verilog-mode)
                   ))

           ("org" (or
                   (mode . org-mode)
                   (name . "^\\*Org Agenda\\*$")
                   (name . "^\\*Org Select\\*$")
                   (name . "^\\*Capture\\*$")
                   (name . "^\\*Calendar\\*$")
                   (name . "^diary$")
                   ))
           
           ("tex" (or
                   (mode . latex-mode)
                   (mode . LaTeX-mode)
                   (mode . tex-mode)
                   (mode . TeX-mode)
                   (mode . text-mode)
                   ))

           ("dir" (mode . dired-mode))
           
           ("email" (or
                   (mode . mew-addrbook-mode)
                   (mode . mew-summary-mode)
                   (mode . mew-message-mode)
                   (mode . mew-draft-mode)
                   (mode . mew-header-mode)
                   (mode . mew-goto-msg-mode)
                   (mode . mew-visual-mode)
                   ;; gnus
                   (mode . message-mode)
                   ;; (mode . bbdb-mode)
                   (mode . mail-mode)
                   (mode . gnus-group-mode)
                   (mode . gnus-summary-mode)
                   (mode . gnus-article-mode)
                   (mode . gnus-article-edit-mode)
                   (mode . gnus-binary-mode)
                   (mode . gnus-browse-mode)
                   (mode . gnus-carpal-mode)
                   (mode . gnus-category-mode)
                   (mode . gnus-dead-summary-mode)
                   (mode . gnus-draft-mode)
                   (mode . gnus-mailing-list-mode)
                   (mode . gnus-message-citation-mode)
                   (mode . gnus-pick-mode)
                   (mode . gnus-score-mode)
                   (mode . gnus-sticky-article-mode)
                   (mode . gnus-topic-mode)
                   (mode . gnus-tree-mode)
                   (mode . gnus-undo-mode)
                   (name . "^\\.bbdb$")
                   (name . "^newsrc-dribble$")))
           ("emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^\\*Compile-Log\\*$")
                     (name . "^\\*Completions\\*$")
                     (name . "^\\*WoMan-Log\\*$")
                     (name . "^\\*Backtrace\\*$")
                     (mode . Custom-mode)
                     (mode . help-mode)
                     (mode . Info-mode)
                     (mode . woman-mode)
                     (mode . apropos-mode)))
           ;; ("emms" (or
           ;;          (mode . emms-playlist-mode)
           ;;          (mode . emms-browser-mode)))
           ;; ("vc"  (or
           ;;            (mode . egg-status)
           ;;            (mode . egg-log-msg-mode)
           ;;            (name .  "^\\*Egg:Select Action\\*$")))
           )))

  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-switch-to-saved-filter-groups "default")))

  (message "* ---[ ibuffer post-load configuration is complete ]---"))

(provide 'xy-rc-ibuffer)
