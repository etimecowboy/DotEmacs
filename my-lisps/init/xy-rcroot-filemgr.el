;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; time-stamp: <2012-11-18 sun 23:55 by xin on s13>
;;--------------------------------------------------------------------
;; file name:    `xy-rcroot-filemgr.el'
;; author:       xin yang
;; email:        xin2.yang@gmail.com
;; description:  file management packages settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)



;;* Buffer management

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)



;;** ibuffer
(eval-after-load "ibuffer" '(ibuffer-postload))
(global-set-key (kbd "C-x C-b") 'ibuffer)



;;** uniquify
;; 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
(eval-after-load "uniquify" '(uniquify-postload))
(require 'uniquify)



;;* File management

;;** dired
(eval-after-load "dired"
  '(progn
     (dired-postload)
     (eal-define-keys-commonly
      global-map
      `(("C-x d" dired-jump)))
     (eal-define-keys
      'dired-mode-map
      `(("C-c C-x 3" dired-two-columns)
        ;; ("M-b s"    dired-sort-by-size)
        ;; ("M-b x"    dired-sort-by-extension)
        ;; ("M-b t"    dired-sort-by-time)
        ;; ("M-b n"    dired-sort-by-name)
        ("M-o"       dired-omit-mode)
        ;; ("E"         dired-ediff)
        ;; ("C-M-/"     dired-undo
        ;; ("C-M-?"     dired-redo)
        ("C-M-k"     dired-do-delete)
        ("M-q"       ywb-dired-quickview)
        ;; ("/m"        ywb-dired-filter-regexp)
        ;; ("/."        ywb-dired-filter-extension)
        ;; ("M->"       wuxch-dired-goto-last-line)
        ;; ("M-<"       wuxch-dired-goto-first-line)
        ;; ("M-w"       wuxch-dired-copy)
        ;; ("C-y"       wuxch-dired-paste)
        ;; ("M-k"       wuxch-dired-cut
        ("X"         mrc-dired-do-command)
        ;; ("q"         kill-this-buffer) ;; BUG: cause `sunrise' error
        ))))

;;*** GNU Emacs features for dired
;; 对特定文件简略显示
(eval-after-load "dired-x" '(dired-x-postload))
;; (require 'dired-x)

;; 以文件形式修改dired buffer,  has been a part of GNU Emacs since 23
;; (require 'wdired)

;; 只对文件名isearch
;;   NOTE: Emacs 23 has builtin Isearch of filenames in Dired:
;;     M-s f C-s   – `dired-isearch-filenames'
;;     M-s f C-M-s – `dired-isearch-filenames-regexp'
;;     M-s a C-M-s – `dired-do-isearch-regexp'
;; (eval-after-load "dired-isearch" '(dired-isearch-postload))

;;*** Contrib features for dired
;; Use a single frame for visiting a sub-directory
;; (eval-after-load "dired-single" (dired-single-postload))
;; `T' 把目录压缩为.tar.gz文件
;; (require 'dired-tar)

;; open-with, open files in external applications
;; NOTE: it need to be patched in order to run on windows
;; NOTE: semms not work in Linux, `dired+' is better.
(eval-after-load "openwith" '(openwith-postload))
(GNULinux
 (when (try-require 'openwith) (openwith-mode 1)))

;; dired-details
;; 简略文件列表信息, BUG: not working properly
;; (eval-after-load "dired-details" '(dired-details-postload))
;; (require 'dired-details)
;; ;; (dired-details-install) ;; called in `dired-details+'
;; (setq dired-details-hide-link-targets nil
;;       dired-details-initially-hide t
;;       dired-details-hidden-string "")
;; (require 'dired-details+)
;; (setq dired-details-propagate-flag t) ;option added by
;;                                         ;`dired-details+'

;; TODO: do a research and add more configurations.
(eval-after-load "dired+" '(dired+-postload)) ;; dired大补
;; (require 'dired+)
;; (setq diredp-prompt-for-bookmark-prefix-flag nil)

;; BUG: NOT work
;; Pop up a sort menu when press `C-d' or `S-mouse2' in dired mode
;; (eval-after-load "dired-sort-menu" '(dired-sort-menu-postload))
(when window-system
  ;; image-dired
  (image-dired-preload)
  (eval-after-load "image-dired" '(image-dired-postload))
  ;; thumbs, Thumbnails previewer for images files
  (thumbs-preload)
  (eval-after-load "thumbs" '(thumbs-postload)))



;; ** w32-browser
(Windows
 (try-require 'w32-browser))



;;** Sunrise commander; file manager
;; FIXME: wrong color display
;; NOTE: It is not very useful, and it is very slow.
;; Check (@url :file-name "http://www.emacswiki.org/emacs/Sunrise_Commander_Tips" :display "emacswiki")
;; (eval-after-load "sunrise-commander" '(sunrise-postload))
;; (global-set-key (kbd "C-x J") 'sunrise)



;;** Speedbar and sr-speedbar
(eval-after-load "sr-speedbar" '(sr-speedbar-postload))
(autoload 'sr-speedbar-toggle "sr-speedbar"
  "Toggle sr-speedbar window." t)
(global-set-key (kbd "C-x D") 'sr-speedbar-toggle)
;; BUG: It seems cause error when using with `elscreen.el'


;;* File searching

;;** Use `everything.el' with `everything.exe' in Windows
;; NOTE: `everything' exe file must be `everything.exe', not
;; `everthing.1.2.xxx.exe'
;; (autoload 'everything "everything" "" t)
(eval-after-load "everything"
  '(progn
     (everything-postload)
     (Windows
      (eal-define-keys-commonly
       global-map
       `(("C-c e c" everything-toggle-case)
         ("C-c e w" everything-toggle-wholeword)
         ("C-c e p" everything-toggle-path))))))
(global-set-key (kbd "C-c e e") 'everything)
(global-set-key (kbd "<f7> e") 'everything)



;;* Version control settings

;;** Emacs internal version control
(setq make-backup-files t)
(setq version-control t)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backup")))
(setq kept-old-versions 5)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq vc-make-backup-files t)
(setq auto-revert-check-vc-info t)

;; Autosaved files
(setq auto-save-default nil)
(setq-default auto-save-list-file-prefix
              (concat my-var-path "/auto-save-list/auto-saves-"
                      user-login-name "@" system-name "@" system-configuration
                      "-"))



;;** git settings

;;*** git.el

;;*** egg
;; (eval-after-load "egg" '(egg-postload))

;;*** magit
(eval-after-load "magit"
  '(progn
     (magit-postload)
     (eal-define-keys-commonly
      magit-mode-map
      `(("M-n"   magit-show-commit-forward)
        ("M-p"   magit-show-commit-backward)
        ("q"     xy/magit-q)
        ("C-x 0" xy/magit-q)
        ("C-x K" xy/magit-q)
        ))))
(global-set-key (kbd "<f12> g") 'magit-status)
(global-set-key (kbd "<f12> w") 'xy/magit-wip-start)

;;*** diff-git
;; NOTE: magit is good enough
(eval-after-load "diff-git"
  '(progn
     (diff-git-postload)
     (eal-define-keys 'vc-prefix-map
                      `(("[" diff-git-diff-unstaged)
                        ("]" diff-git-diff-staged)))
     (eal-define-keys 'diff-mode-map
                      `(("C-c M-v" diff-git-buffer-stage)
                        ("C-c C-v" diff-git-diff-staged)))
     (define-key diff-mode-shared-map "g" 'diff-git-update-current-buffer)))
(global-set-key (kbd "<f12> u") 'diff-git-diff-unstaged)
(global-set-key (kbd "<f12> s") 'diff-git-diff-staged)

;;*** mo-git-blame
(eval-after-load "mo-git-blame" '(mo-git-blame-postload))
(global-set-key (kbd "<f12> c") 'mo-git-blame-current)
(global-set-key (kbd "<f12> f") 'mo-git-blame-file)


;;** diff-hl
;; Highlight vc diff section of current file
;;BUG: strange error after update to latest ELPA package, use old
;; package instead.
(when (try-require 'diff-hl) (global-diff-hl-mode 1))


(provide 'xy-rcroot-filemgr)
