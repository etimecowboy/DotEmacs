;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-05-28 Thu 10:01 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-history.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Save editor information between Emacs sessions
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;; Save editing information

;;;; Winpoint
;; When two windows view the same buffer at the same time, and one
;; window is switched to another buffer and back, point is now the
;; same as in the other window, not as it was before we switched away.
;; This mode tries to work around this problem by storing and
;; restoring per-window positions for each buffer.
(eval-after-load "winpoint" '(winpoint-postload))
(autoload 'window-point-remember-mode "winpoint" nil t)
(window-point-remember-mode 1)



;;;; Bookmark
;; * ‘C-x r m’ – set a bookmark at the current location (e.g. in a file)
;; * ‘C-x r b’ – jump to a bookmark
;; * ‘C-x r l’ – list all of your bookmarks
;; * ‘M-x bookmark-delete’ – delete a bookmark by name
;; Some keys in `*Bookmark List*’:
;; * ‘a’ – show annotation for the current bookmark
;; * ‘A’ – show all annotations for your bookmarks
;; * ‘d’ – mark various entries for deletion
;;         (‘x’ – to delete them)
;; * ‘e’ – edit the annotation for the current bookmark
;; * ‘m’ – mark various entries for display and other operations,
;;         (‘v’ – to visit)
;; * ‘o’ – visit the current bookmark in another window,
;;         keeping the bookmark list open
;; * ‘C-o’ – switch to the current bookmark in another window
;; * ‘r’ – rename the current bookmark
(bookmark-preload)
(eval-after-load "bookmark" '(bookmark-postload))

;;;;; Bookmark+
(bookmark+-preload)
(eval-after-load "bookmark+" '(bookmark+-postload))

;;;;; bm
;; provides visible, buffer local, bookmarks and the ability
;; to jump forward and backward to the next bookmark.
(autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
(autoload 'bm-next     "bm" "Goto bookmark."                     t)
(autoload 'bm-previous "bm" "Goto previous bookmark."            t)
(eal-define-keys-commonly
 global-map
 `(;; M$ Visual Studio key setup.
   ("S-<f2>"   bm-toggle)
   ("C-<f2>"   bm-next)
   ("M-<f2>"   bm-previous)
   ;; Click on fringe to toggle bookmarks, and use mouse wheel to move
   ;; between them. If you would like the markers on the right fringe
   ;; instead of the left, add the following to line:
   ;; (setq bm-marker 'bm-marker-right)
   ("<left-fringe> <mouse-5>"   bm-next-mouse)
   ("<left-fringe> <mouse-4>"   bm-previous-mouse)
   ("<left-fringe> <mouse-1>"   bm-toggle-mouse)))



;;; Save Emacs session information

;;;; recentf
;; Save recent openned files
(recentf-preload)
(eval-after-load "recentf" '(recentf-postload))
(recentf-mode 1)
;; (global-set-key (kbd "C-x y") 'undo-kill-buffer) ;; BUG:
(global-set-key (kbd "C-x C-l") 'recentf-open-files)



;;;; save-place
;; Save point places in buffers
(saveplace-preload)
(eval-after-load "saveplace" '(saveplace-postload))



;;;; savehist
(savehist-preload)
(eval-after-load "savehist" '(savehist-postload))
(if window-system        ;BUG: cause error in terminal ---
    (savehist-mode 1)    ;(wrong-type-argument listp ido-file-history)
  (savehist-mode -1))



;;;; filecache
(eval-after-load "filecache" '(filecache-postload))



;;;; windows and revive
;; NOTE: ;; Workspace store and recover. Heavy weight, cannot used with emacs daemon
;; (revive-preload)
;; (eval-after-load "revive" '(revive-postload))
;; (when (try-require 'revive)
;;   ;; (add-hook 'delete-frame-functions 'save-current-configuration)
;;   ;; (add-hook 'kill-emacs-hook 'save-current-configuration)
;;   (global-set-key (kbd "C-c w s") 'save-current-configuration)
;;   (global-set-key (kbd "C-c w r") 'resume)
;;   (global-set-key (kbd "C-c w k") 'wipe))
;;   ;; NOTE: C-u (num) to specify the window name

;; (windows-preload)
;; (eval-after-load "windows" '(windows-postload))
;; (when (try-require 'windows)
;;   (when window-system
;;     (win:startup-with-window)))

;;;; `elscreen.el'
;; NOTE: old versions are based on APEL, current version is not.
(eval-after-load "elscreen" '(elscreen-postload))
(elscreen-start)
;; (global-set-key (kbd "<f2> s") 'elscreen-start)



;;;; `winring.el'
;; ;; (eval-after-load "winring" '(winring-postload))
;; (when (try-require 'winring)
;;   (add-hook 'after-init-hook 'winring-initialize)
;;   (define-key winring-map "o" 'winring-next-configuration))



;;;; session
;; session.el can remember more information.
;; NOTE: C-x C-/ 'session-jump-to-last-change
;; (eval-after-load "session" '(session-postload))
;; (when (try-require 'session)
;;   (add-hook 'after-init-hook 'session-initialize))



;; `psession.el'
;; (autoload 'psession-mode "psession.el")
(eval-after-load "psession" '(psession-postload))
(psession-mode 1)
(add-hook 'delete-frame-functions 'psession-save-winconf)
(global-set-key (kbd "C-c w s") 'psession-save-winconf)
(global-set-key (kbd "C-c w r") 'psession-restore-winconf)



;;;; `desktop.el'
;; (eval-after-load "desktop" '(desktop-postload))
;; (desktop-save-mode 1)
;; NOTE: Cannot remember window layout


;;;; `wcy-desktop.el', light weight version `desktop.el'
;; (when (try-require 'wcy-desktop)
;;   (add-hook 'after-init-hook 'wcy-desktop-init))



;;;; `wcy-escreen.el' by 王纯业(wcy), based on `session.el'
;; (when (try-require 'wcy-escreen)
;;   (add-hook 'after-init-hook 'wcy-escreen-install))



(provide 'xy-rcroot-history)

;; NOTE: This is the last root configuration file loaded
