;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-09-22 Sun 20:03 by xy12g13 on UOS-208326>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-dired.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `dired.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun his-dired-sort ()
  "List directories before files"
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

;; REF: (@url :file-name "http://superuser.com/questions/176627/in-emacs-dired-how-can-i-run-a-command-on-multiple-marked-files" :display "Post")
;;;###autoload
(defun mrc-dired-do-command (command)
  "Run COMMAND on marked files. Any files not already open will be
opened. After this command has been run, any buffers it's modified
will remain open and unsaved."
  (interactive "CRun on marked files M-x ")
  (save-window-excursion
    (mapc (lambda (filename)
            (find-file filename)
            (call-interactively command))
          (dired-get-marked-files))))

;;;###autoload
(defun dired-sort-by-size ()
  "sort by Size"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "S")))

;;;###autoload
(defun dired-sort-by-extension ()
  "sort by eXtension"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "X")))

;;;###autoload
(defun dired-sort-by-time ()
  "sort by Time"
  (interactive)
  (dired-sort-other (concat dired-listing-switches "t")))

;;;###autoload
(defun dired-sort-by-name ()
  "sort by Name"
  (interactive)
  (dired-sort-other dired-listing-switches))

;;;###autoload
(defun dired-postload ()
  "Settings for `dired' after it's been loaded."
  ;; (setq truncate-lines t)
  (setq dired-kept-versions 1)
  (setq dired-recursive-deletes 'top)  ; 询问是否递归的删除目录
  (setq dired-recursive-copies 'always)   ; 可以递归的进行拷贝
  ;; (define-prefix-command 'dired-slash-map)
  (setq dired-dwim-target t)
  ;; (add-hook 'dired-mode-hook
  ;;             (lambda ()
  ;;               (define-key dired-mode-map (kbd "<return>")
  ;;                 'dired-find-alternate-file)
  ;;               (define-key dired-mode-map (kbd "^")
  ;;                 (lambda () (interactive) (find-alternate-file "..")))))

  ;; (defun dired-mode-hook-settings ()
  ;;   "Settings for `dired-mode-hook'."
  ;;   ;; (dired-keys)
  ;;   (setq mode-line-buffer-identification
  ;;         (propertized-buffer-identification "%b")))
  ;; (add-hook 'dired-mode-hook 'dired-mode-hook-settings)

  (add-hook 'dired-after-readin-hook 'his-dired-sort)
  (add-hook 'dired-lood-hook 'his-dired-sort)
  ;; Auto-refresh dired on file change
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  ;; (def-redo-command dired-redo 'dired-redo 'dired-undo)

  ;;------------------------------------------------------------------
  (try-require 'dired+)
  ;; (try-require 'dired-sort-menu) ;; NOT work.

  ;; Press `T' in dired mode to compress a dir or decompress a .tar.gz
  ;; NOTE: not work in Windows
  ;; BUG: strange compile error.
  ;; (try-require 'dired-tar)

  ;; (try-require 'thumb)

  (message "* ---[ dired post-load configuration is complete ]---"))

(provide 'xy-rc-dired)

;; (require 'dired-x)
;; (require 'wdired)
;; (dired-omit-mode 1)
;; (try-require 'dired-details+)
;; (try-require 'dired-single)
;; (try-require 'dired-tar)
;; (when (try-require 'dired+)
;;   (define-key ctl-x-map   "d"
;;     'diredp-dired-files)
;;   (define-key ctl-x-4-map "d"
;;     'diredp-dired-files-other-window))
;; (when (try-require 'openwith) (openwith-mode 1))

;; (add-hook 'dired-load-hook
;;           (function (lambda ()
;;                       (require 'dired-x)
;;                       (require 'wdired))))
;; (add-hook 'dired-mode-hook
;;           (function (lambda ()
;;                       (dired-omit-mode 1))))
;; (add-hook 'dired-load-hook
;;           (function (lambda ()
;;                       (try-require 'dired-details+)
;;                       ;; (try-require 'dired-single)
;;                       (try-require 'dired-tar)
;;                       (when (try-require 'dired+)
;;                         (define-key ctl-x-map   "d"
;;                           'diredp-dired-files)
;;                         (define-key ctl-x-4-map "d"
;;                           'diredp-dired-files-other-window)))))
;; (add-hook 'dired-mode-hook
;;           (function (lambda ()
;;                       (when (featurep 'openwith)
;;                         (openwith-mode 1)))))

;; (add-hook 'dired-load-hook
;;           (function (lambda ()
;;                       (load "dired+")
;;                       (load "dired-x")
;;                       (load "wdired")
;;                       (load "dired-tar")
;;                       (load "dired-details+")
;;                       ;; (load 'dired-single)
;;                       (load "openwith")
;;                       )))

;; (add-hook 'dired-mode-hook
;;           (function (lambda ()
;;                       (dired-omit-mode 1)
;;                       ;; (dired-details-hide)
;;                       ;; (dired-details-toggle 1)
;;                       ;; (define-key ctl-x-map   "d"
;;                       ;;   'diredp-dired-files)
;;                       ;; (define-key ctl-x-4-map "d"
;;                       ;;   'diredp-dired-files-other-window)
;;                       )))

;;====================================================================

;; ;;;###autoload
;; (defun dired-scroll-half-page-backward ()
;;   "Scroll backward a \"half page\" lines in dired-mode.
;; See also `dired-scroll-half-page-forward'."
;;   (interactive)
;;   (call-interactively 'View-scroll-half-page-backward)
;;   (dired-move-to-filename))

;; ;;;###autoload
;; (defun dired-scroll-half-page-forward ()
;;   "Scroll forward a \"half page\" lines in dired-mode.
;; See also `dired-scroll-half-page-backward'."
;;   (interactive)
;;   (call-interactively 'View-scroll-half-page-forward)
;;   (dired-move-to-filename))

;; ;;;###autoload
;; (defun dired-scroll-up ()
;;   "Scroll up in dired-mode.
;; See also `dired-scroll-down'."
;;   (interactive)
;;   (call-interactively 'scroll-up)
;;   (dired-move-to-filename))

;; ;;;###autoload
;; (defun dired-scroll-down ()
;;   "Scroll down in dired-mode.
;; See also `dired-scroll-down'."
;;   (interactive)
;;   (call-interactively 'scroll-down)
;;   (dired-move-to-filename))

;; ;;;###autoload
;; (defun ywb-dired-filter-regexp (regexp &optional arg)
;;   "dired mode中只显示后缀名符合正则表达式的文件和目录"
;;   (interactive
;;    (list (dired-read-regexp
;;           (concat (if current-prefix-arg "只显示不" "只显示") "匹配的后缀名(regexp): "))
;;          current-prefix-arg))
;;   (dired-mark-files-regexp regexp)
;;   (or arg (if (fboundp 'dired-do-toggle) (dired-do-toggle) (dired-toggle-marks)))
;;   (dired-do-kill-lines))

;; ;;;###autoload
;; (defun ywb-dired-filter-extension (extension &optional arg)
;;   "dired mode中只显示后缀名为EXTENSION的文件和目录"
;;   (interactive
;;    (list (read-from-minibuffer
;;           (concat "只显示后缀名为" (if current-prefix-arg "" "") ": "))
;;          current-prefix-arg))
;;   (ywb-dired-filter-regexp (concat "\\." extension "\\'") arg))

;; ;;;###autoload
;; (defun ywb-dired-quickview ()
;;   "类似TC的一个命令,可以使用同一个buffer浏览多个文件，每次打开新文件就把前一个buffer关了"
;;   (interactive)
;;   (defvar ywb-dired-quickview-buffer nil)
;;   ;; (make-variable-buffer-local ywb-dired-quickview-buffer)
;;   (if (buffer-live-p ywb-dired-quickview-buffer)
;;       (kill-buffer ywb-dired-quickview-buffer))
;;   (setq ywb-dired-quickview-buffer
;;         (find-file-noselect (dired-get-file-for-visit)))
;;   (display-buffer ywb-dired-quickview-buffer))

;; ;;;###autoload
;; (defun dired-up-directory-same-buffer ()
;;   "Goto parent directory in the smae buffer."
;;   (interactive)
;;   (let* ((dir (dired-current-directory))
;;          (dir-file-name (directory-file-name dir))
;;          (mode dired-lis-mode))
;;     (unless (string= dir dir-file-name)
;;       (find-alternate-file "..")
;;       (dired-goto-file dir-file-name)
;;       (dired-lis-mode (if mode 1 -1)))))

;; ;;;###autoload
;; (defun dired-ediff (file)
;;   "Compare file at point with file FILE using `diff'.
;; FILE defaults to the file at the mark.  (That's the mark set by
;; \\[set-mark-command], not by Dired's \\[dired-mark] command.)
;; The prompted-for file is the first file given to `diff'.
;; With prefix arg, prompt for second argument SWITCHES,
;; which is options for `diff'."
;;   (interactive
;;    (let* ((current (dired-get-filename t))
;;           ;; Get the file at the mark.
;;           (file-at-mark (if (mark t)
;;                             (save-excursion (goto-char (mark t))
;;                                             (dired-get-filename t t))))
;;           ;; Use it as default if it's not the same as the current file,
;;           ;; and the target dir is the current dir or the mark is active.
;;           (default (if (and (not (equal file-at-mark current))
;;                             (or (equal (dired-dwim-target-directory)
;;                                        (dired-current-directory))
;;                                 mark-active))
;;                        file-at-mark))
;;           (target-dir (if default
;;                           (dired-current-directory)
;;                         (dired-dwim-target-directory)))
;;           (defaults (dired-dwim-target-defaults (list current) target-dir)))
;;      (require 'diff)
;;      (list
;;       (minibuffer-with-setup-hook
;;           (lambda ()
;;             (set (make-local-variable 'minibuffer-default-add-function) nil)
;;             (setq minibuffer-default defaults))
;;         (read-file-name
;;          (format "Diff %s with%s: " current
;;                  (if default (format " (default %s)" default) ""))
;;          target-dir default t)))))
;;   (let ((current (dired-get-filename t)))
;;     (when (or (equal (expand-file-name file)
;;                      (expand-file-name current))
;;               (and (file-directory-p file)
;;                    (equal (expand-file-name current file)
;;                           (expand-file-name current))))
;;       (error "Attempt to compare the file to itself"))
;;     (ediff-files file current)))

;; ;;;###autoload
;; (defun dired-two-columns ()
;;   "Display dired buffers in two columns to save spaces."
;;   (interactive)
;;   (split-window-horizontally)
;;   (follow-mode t))
