;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-12 Sun 21:20 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-anything.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `anything.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; TODO: write an anything function to find emacs config files

;;;###autoload
(defun xy/my-anything ()
  "My anything."
  (interactive)
  (require 'anything)
  (anything-other-buffer
   '(;; Bookmark:
     anything-c-source-bookmarks
     ;; Buffer:
     anything-c-source-buffers
     ;; anything-c-source-buffer-not-found
     ;; File:
     anything-c-source-file-name-history
     anything-c-source-recentf
     anything-c-source-files-in-current-dir+
     ;; anything-c-source-file-cache
     anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     ;; anything-c-source-locate  ;; BUG: 慢，还可能出问题
     ;; Command:
     ;; anything-c-source-minibuffer-history ;; BUG: Conflicts with `session.el'
     anything-c-source-emacs-commands
     ;; Buffer Contents:
     anything-c-source-imenu
     anything-c-source-occur
     ;; System:
     ;; BUG: Conflicts with `session.el'. Error when
     ;; running`xy/my-anything'
     ;; anything-c-source-kill-ring
     anything-c-source-emacs-process
     )
   "*my-anything*"))

;;;###autoload
(defun anything-postload ()
  "Settings for `anything' after it's been loaded."
  ;;NOTE: anything-config will use <f5> as the prefix key, this
  ;; conflicts with your own emacs <f5> key bindings.
  ;; The following 6 are included in `anything-startup'
  (require 'anything-config)
  (require 'anything-startup)
  ;; (require 'anything-auto-install) ;; BUG: NOT work in Emacs 24
  (require 'descbinds-anything)
  (require 'anything-gtags)
  (require 'anything-menu)
  (require 'anything-show-completion)
  ;; (require 'anything-grep)
  ;; (require 'anything-match-plugin)
  ;; (try-require 'anything-ipa)

  ;; NOTE: a workaround to fix the Emacs crash with `anything' (not
  ;; tested yet)
  ;; REF: (@url :file-name "http://permalink.gmane.org/gmane.emacs.anything/256" :display "Mail-list post")
  ;; (setq anything-idle-delay 1.1)
  ;; (setq anything-input-idle-delay 1.1)

  (setq anything-c-adaptive-history-file
        (concat my-var-path "/anything-c-adaptive-history"))
  (unless (file-exists-p anything-c-adaptive-history-file)
    (shell-command (concat "touch " anything-c-adaptive-history-file)))

  ;; (setq anything-grep-alist
  ;;     '(("buffers" ("egrep -Hin %s $buffers" "/"))
  ;;       ;; ("org files" ("ack-grep -af | xargs egrep -Hin %s" "~/emacs/org/source"))
  ;;       ;; ("lisps"
  ;;       ;;  ("ack-grep -af | xargs egrep -Hin %s *.el" "~/.emacs.d/lisps/")
  ;;       ;;  ("ack-grep -af | xargs egrep -Hin %s *.el" "~/.emacs.d/my-lisps/"))
  ;;       ))

  ;; (global-set-key (kbd "C-x b")
  ;;         (lambda() (interactive)
  ;;           (anything
  ;;            :prompt "Switch to: "
  ;;            :candidate-number-limit 10
  ;;            :sources
  ;;            '( anything-c-source-buffers
  ;;               anything-c-source-recentf
  ;;               ;; anything-c-source-file-cache ;; BUG: 容易出问题
  ;;               anything-c-source-bookmarks
  ;;               anything-c-source-files-in-current-dir+
  ;;               anything-c-source-locate))))

  ;; BUG: windows locate32 not working!, console mode chinese encoding error.

  ;; (global-set-key (kbd "C-<f1>")  ;; i -> info
           ;; (lambda () (interactive)
             ;; (anything
              ;; :prompt "Info about: "
              ;; :candidate-number-limit 3
              ;; :sources
              ;; '( ;; anything-c-source-info-libc          ;; glibc docs
                 ;; anything-c-source-man-pages             ;; man pages
                 ;; anything-c-source-info-emacs))))        ;; emacs

  (add-hook 'emacs-lisp-mode-hook
           (lambda()
             ;; other stuff...
             ;; ...
             ;; put useful info under C-c i
             (local-set-key (kbd "S-<f1>")
                            (lambda() (interactive)
                              (anything
                               :prompt "Info about: "
                               :candidate-number-limit 5
                               :sources
                               '( anything-c-source-emacs-functions
                                  anything-c-source-emacs-variables
                                  anything-c-source-info-elisp
                                  anything-c-source-emacs-commands
                                  anything-c-source-emacs-source-defun
                                  anything-c-source-emacs-lisp-expectations
                                  anything-c-source-emacs-lisp-toplevels
                                  anything-c-source-emacs-functions-with-abbrevs
                                  anything-c-source-info-emacs))))))

  (message "* ---[ anything post-load configuration is complete ]---"))

(provide 'xy-rc-anything)


;; ahei's settings

;; (setq anything-sources
;;       (list
;;         ;; ;; Buffer:
;;         ;; anything-c-source-buffers
;;         ;; anything-c-source-buffer-not-found
;;         ;; anything-c-source-buffers+
;;         ;; ;; File:
;;         ;; anything-c-source-file-name-history
;;         ;; anything-c-source-files-in-current-dir
;;         ;; anything-c-source-files-in-current-dir+
;;         ;; anything-c-source-file-cache
;;         ;; anything-c-source-locate
;;         ;; anything-c-source-recentf
;;         ;; anything-c-source-ffap-guesser
;;         ;; anything-c-source-ffap-line
;;         ;; ;; Help:
;;         ;; anything-c-source-man-pages
;;         ;; anything-c-source-info-pages
;;         ;; anything-c-source-info-elisp
;;         ;; anything-c-source-info-cl
;;         ;; ;; Command:
;;         ;; anything-c-source-complex-command-history
;;         ;; anything-c-source-extended-command-history
;;         ;; anything-c-source-emacs-commands
;;         ;; ;; Function:
;;         ;; anything-c-source-emacs-functions
;;         ;; anything-c-source-emacs-functions-with-abbrevs
;;         ;; ;; Variable:
;;         ;; anything-c-source-emacs-variables
;;         ;; ;; Bookmark:
;;         ;; anything-c-source-bookmarks
;;         ;; anything-c-source-bookmark-set
;;         ;; anything-c-source-bookmarks-ssh
;;         ;; anything-c-source-bookmarks-su
;;         ;; anything-c-source-bookmarks-local
;;         ;; ;; Library:
;;         ;; anything-c-source-elisp-library-scan
;;         ;; ;; Programming:
;;         ;; anything-c-source-imenu
;;         ;; anything-c-source-ctags
;;         ;; anything-c-source-semantic
;;         ;; anything-c-source-simple-call-tree-functions-callers
;;         ;; anything-c-source-simple-call-tree-callers-functions
;;         ;; anything-c-source-commands-and-options-in-file
;;         ;; ;; Color and Face:
;;         ;; anything-c-source-customize-face
;;         ;; anything-c-source-colors
;;         ;; ;; Search Engine:
;;         ;; anything-c-source-tracker-search
;;         ;; anything-c-source-mac-spotlight
;;         ;; ;; Kill ring:
;;         ;; anything-c-source-kill-ring
;;         ;; ;; Mark ring:
;;         ;; anything-c-source-global-mark-ring
;;         ;; ;; Register:
;;         ;; anything-c-source-register
;;         ;; ;; Headline Extraction:
;;         ;; anything-c-source-fixme
;;         ;; anything-c-source-rd-headline
;;         ;; anything-c-source-oddmuse-headline
;;         ;; anything-c-source-emacs-source-defun
;;         ;; anything-c-source-emacs-lisp-expectations
;;         ;; anything-c-source-emacs-lisp-toplevels
;;         ;; anything-c-source-org-headline
;;         ;; anything-c-source-eev-anchor
;;         ;; ;; Misc:
;;         ;; anything-c-source-evaluation-result
;;         ;; anything-c-source-calculation-result
;;         ;; anything-c-source-google-suggest
;;         ;; anything-c-source-call-source
;;         ;; anything-c-source-occur
;;         ;; anything-c-source-create
;;         ;; anything-c-source-minibuffer-history
;;         ;; ;; System:
;;         ;; anything-c-source-emacs-process
;;       ;; ;; auto-install elisps:
;;       ;; anything-c-source-auto-install-from-emacswiki
;;       ;; anything-c-source-auto-install-from-library
;;       ))

;; (unless mswin
;;   (add-to-list 'anything-sources 'anything-c-source-surfraw t)))
