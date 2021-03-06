;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-07-13 Wed 00:51 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-sunrise.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `sunrise.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun xy/sunrise ()
;;   "Start sunrise-commander in a maximized frame."

;;   (interactive)
;;   (xy/smart-maximize-frame)
;;   (sunrise))

;;;###autoload
(defun sunrise-postload ()
  "Settings of `sunrise.el' after it's been loaded."

  (try-require 'sunrise-x-popviewer) ;; not with x-buttons
  ;; (try-require 'sunrise-x-buttons) ;; not with x-popviewer
  ;; (try-require 'sunrise‐x‐tree)
  (try-require 'sunrise-x-checkpoints)
  (try-require 'sunrise-x-loop)
  (try-require 'sunrise-x-mirror)
  (try-require 'sunrise-x-modeline)
  (try-require 'sunrise-x-tabs)
  (try-require 'sunrise-x-w32-addons)
  
  (add-to-list 'auto-mode-alist '("\\.srvm\\'" . sr-virtual-mode))

  (setq sr-autoload-extensions t
        ;; sr-avfs-root "~/"
        sr-confirm-kill-viewer nil
        sr-fast-backup-extension ".bak"
        sr-history-length 100
        sr-kill-unused-buffers t
        sr-loop-debug nil
        sr-loop-timeout 20
        sr-loop-use-popups t
        sr-mirror-keep-backups t
        sr-modeline-use-utf8-marks t
        sr-popviewer-enabled t
        sr-popviewer-style 'single-dedicated-frame
        sr-show-file-attributes t
        sr-show-hidden-files t
        sr-tabs-follow-panes t
        sr-tabs-max-tabsize 40
        sr-traditional-other-window nil
        sr-terminal-kill-buffer-on-exit t
        sr-terminal-program "eshell"
        ;; sr-tree-explosion-ratio 3
        ;; sr-tree-isearch-always-sticky nil
        sr-w32-follow-shortcuts t
        sr-windows-default-ratio 65
        sr-windows-locked t
        sr-window-split-style 'horizontal
        sr-use-commander-keys nil)

  (sr-popviewer-mode t)
  
  ;; (setq sr-start-hook
  ;;       '(;; toggle-frame-maximized
  ;;         xy/set-font-prog ;; Use smaller fonts so that two columns can be displayed 
  ;;         ;; NOTE: the following codes has been added in autoloads
  ;;         ;; (sr-tree-menu-init)
  ;;         ;; (sr-tabs-start-once)
  ;;         ;; (sr-modeline-start-once)
  ;;       ))

  (message "* ---[ sunrise post-load configuration is complete ]---"))

(provide 'xy-rc-sunrise)

;; Keybindings
;; /, j .......... go to directory
;; p, n .......... move cursor up/down
;; M-p, M-n ...... move cursor up/down in passive pane
;; ^, J .......... go to parent directory
;; M-^, M-J ...... go to parent directory in passive pane
;; Tab ........... switch to other pane
;; C-Tab.......... switch to viewer window
;; C-c Tab ....... switch to viewer window (console compatible)
;; RET, f ........ visit selected file/directory
;; M-RET, M-f .... visit selected file/directory in passive pane
;; C-c RET ....... visit selected in passive pane (console compatible)
;; b ............. visit selected file/directory in default browser
;; F ............. visit all marked files, each in its own window
;; C-u F ......... visit all marked files in the background
;; o,v ........... quick visit selected file (scroll with C-M-v, C-M-S-v)
;; C-u o, C-u v .. kill quick-visited buffer (restores normal scrolling)
;; X ............. execute selected file
;; C-u X.......... execute selected file with arguments

;; + ............. create new directory
;; M-+ ........... create new empty file(s)
;; C ............. copy marked (or current) files and directories
;; R ............. rename marked (or current) files and directories
;; D ............. delete marked (or current) files and directories
;; S ............. soft-link selected file/directory to passive pane
;; Y ............. do relative soft-link of selected file in passive pane
;; H ............. hard-link selected file to passive pane
;; K ............. clone selected files and directories into passive pane
;; M-C ........... copy (using traditional dired-do-copy)
;; M-R ........... rename (using traditional dired-do-rename)
;; M-D ........... delete (using traditional dired-do-delete)
;; M-S............ soft-link (using traditional dired-do-symlink)
;; M-Y............ do relative soft-link (traditional dired-do-relsymlink)
;; M-H............ hard-link selected file/directory (dired-do-hardlink)
;; A ............. search marked files for regular expression
;; Q ............. perform query-replace-regexp on marked files
;; C-q ........... search occurrences of a string in marked files
;; C-c s ......... start a \"sticky\" interactive search in the current pane

;; M-a ........... move to beginning of current directory
;; M-e ........... move to end of current directory
;; M-y ........... go to previous directory in history
;; M-u ........... go to next directory in history
;; C-M-y ......... go to previous directory in history on passive pane
;; C-M-u ......... go to next directory in history on passive pane

;; g, C-c C-c .... refresh pane
;; s ............. sort entries (by name, number, size, time or extension)
;; r ............. reverse the order of entries in the active pane (sticky)
;; C-o ........... show/hide hidden files (requires dired-omit-mode)
;; C-Backspace ... hide/show file attributes in pane
;; C-c Backspace . hide/show file attributes in pane (console compatible)
;; y ............. show file type / size of selected files and directories.
;; M-l ........... truncate/continue long lines in pane
;; C-c v ......... put current panel in VIRTUAL mode
;; C-c C-v ....... create new pure VIRTUAL buffer
;; C-c C-w ....... browse directory tree using w3m

;; M-t ........... transpose panes
;; M-o ........... synchronize panes
;; C-c C-s ....... change panes layout (vertical/horizontal/top-only)
;; [ ............. enlarges the right pane by 5 columns
;;                 ] ............. enlarges the left pane by 5 columns
;; } ............. enlarges the panes vertically by 1 row
;; C-} ........... enlarges the panes vertically as much as it can
;; C-c } ......... enlarges the panes vertically as much as it can
;; { ............. shrinks the panes vertically by 1 row
;; C-{ ........... shrinks the panes vertically as much as it can
;; C-c { ......... shrinks the panes vertically as much as it can
;; \\ ............. restores the size of all windows back to «normal»
;; C-c C-z ....... enable/disable synchronized navigation

;; C-= ........... smart compare files (ediff)
;; C-c = ......... smart compare files (console compatible)
;; = ............. fast smart compare files (plain diff)
;; C-M-= ......... compare panes
;; C-x = ......... compare panes (console compatible)

;; C-c C-f ....... execute Find-dired in Sunrise VIRTUAL mode
;; C-c C-n ....... execute find-Name-dired in Sunrise VIRTUAL mode
;; C-u C-c C-g ... execute find-Grep-dired with additional grep options
;; C-c C-g ....... execute grep in Sunrise VIRTUAL mode
;; C-c C-l ....... execute Locate in Sunrise VIRTUAL mode
;; C-c C-r ....... browse list of Recently visited files (requires recentf)
;; C-c C-c ....... [after find, locate or recent] dismiss virtual buffer
;; C-c / ......... narrow the contents of current pane using fuzzy matching
;; C-c b ......... partial Branch view of selected items in current pane
;; C-c p ......... Prune paths matching regular expression from current pane
;;                                         ; ............. follow file (go to same directory as selected file)
;; M-; ........... follow file in passive pane
;; C-M-o ......... follow a projection of current directory in passive pane

;; C-> ........... save named checkpoint (a.k.a. \"bookmark panes\")
;; C-c > ......... save named checkpoint (console compatible)
;; C-.    ........ restore named checkpoint
;; C-c .  ........ restore named checkpoint

;; C-x C-q ....... put pane in Editable Dired mode (commit with C-c C-c)
;; @! ............ fast backup files (not dirs!), each to [filename].bak

;; C-c t ......... open new terminal or switch to already open one
;; C-c T ......... open terminal AND/OR change directory to current
;; C-c C-t ....... open always a new terminal in current directory
;; C-c M-t ....... open a new terminal using an alternative shell program
;; q, C-x k ...... quit Sunrise Commander, restore previous window setup
;; M-q ........... quit Sunrise Commander, don't restore previous windows

;; Additionally, the following traditional commander-style keybindings are provided
;; \(these may be disabled by customizing the `sr-use-commander-keys' option):

;; F2 ............ go to directory
;; F3 ............ quick visit selected file
;; F4 ............ visit selected file
;; F5 ............ copy marked (or current) files and directories
;; F6 ............ rename marked (or current) files and directories
;; F7 ............ create new directory
;; F8 ............ delete marked (or current) files and directories
;; F10 ........... quit Sunrise Commander
;; C-F3 .......... sort contents of current pane by name
;; C-F4 .......... sort contents of current pane by extension
;; C-F5 .......... sort contents of current pane by time
;; C-F6 .......... sort contents of current pane by size
;; C-F7 .......... sort contents of current pane numerically
;; S-F7 .......... soft-link selected file/directory to passive pane
;; Insert ........ mark file
;; C-PgUp ........ go to parent directory

;; Any other dired keybinding (not overridden by any of the above) can be used in
;; Sunrise, like G for changing group, M for changing mode and so on.

;; Some more bindings are available in terminals opened using any of the Sunrise
;; functions (i.e. one of: C-c t, C-c T, C-c C-t, C-c M-t):

;; C-c Tab ....... switch focus to the active pane
;; C-c t ......... cycle through all currently open terminals
;; C-c T ......... cd to the directory in the active pane
;; C-c C-t ....... open new terminal, cd to directory in the active pane
;; C-c ; ......... follow the current directory in the active pane
;; C-c { ......... shrink the panes vertically as much as possible
;; C-c } ......... enlarge the panes vertically as much as possible
;; C-c \\ ......... restore the size of all windows back to «normal»
;; C-c C-j ....... put terminal in line mode
;; C-c C-k ....... put terminal back in char mode

;; The following bindings are available only in line mode (eshell is considered to
;; be *always* in line mode):

;; M-<up>, M-P ... move cursor up in the active pane
;; M-<down>, M-N . move cursor down in the active pane
;; M-Return ...... visit selected file/directory in the active pane
;; M-J ........... go to parent directory in the active pane
;; M-G ........... refresh active pane
;; M-Tab ......... switch to passive pane (without leaving the terminal)
;; M-M ........... mark selected file/directory in the active pane
;; M-Backspace ... unmark previous file/directory in the active pane
;; M-U ........... remove all marks from the active pane
;; C-Tab ......... switch focus to the active pane

;; In a terminal in line mode the following substitutions are also performed
;; automatically:

;; %f - expands to the currently selected file in the left pane
;; %F - expands to the currently selected file in the right pane
;; %m - expands to the list of paths of all marked files in the left pane
;; %M - expands to the list of paths of all marked files in the right pane
;; %n - expands to the list of names of all marked files in the left pane
;; %N - expands to the list of names of all marked files in the right pane
;; %d - expands to the current directory in the left pane
;; %D - expands to the current directory in the right pane
;; %a - expands to the list of paths of all marked files in the active pane
;; %A - expands to the current directory in the active pane
;; %p - expands to the list of paths of all marked files in the passive pane
;; %P - expands to the current directory in the passive pane
;; %% - inserts a single % sign.
