;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:27 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-isearch.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `isearch.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;; TODO: add a function to switch to grep (moccur) words
;;       in the current file or directory
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; 在C-s进入incremental search的时候,按M-i,替换当前查找内容
;;;###autoload
(defun isearch-query-replace-current ()
  "Replace current searching string."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search)
    (from-string isearch-string))
    (if (string= from-string "")
    (isearch-update)
      (if (not isearch-success)
      (progn
        (message "Search string not found")
        (sleep-for 0.5)
        (isearch-update))
    (progn
      (isearch-done)
      (goto-char (min (point) isearch-other-end)))
    (perform-replace
     from-string
     (read-from-minibuffer
      (format "Query replace %s with: " from-string)
      "" nil nil query-replace-to-history-variable from-string t)
     t                                ; query flag
     isearch-regexp
     nil)))))

;;;###autoload
(defun toggle-case-fold-search-when-search ()
    "在搜索的时候执行`toggle-case-fold-search'."
    (interactive)
    (toggle-case-fold-search)
    (let ((str isearch-string))
      (goto-char isearch-opoint)
      (isearch-done)
      (let ((isearch-command
             (if isearch-forward
                 (if isearch-regexp 'isearch-forward-regexp 'isearch-forward)
               (if isearch-regexp 'isearch-backward-regexp 'isearch-backward))))
        (call-interactively isearch-command))
      (isearch-yank-string str)))

;;;###autoload
(defun isearch-cur-word (fun)
    "ISearch current word use function FUN."
    (let ((cur-word (current-word)))
      (if (not cur-word)
          (message "No word under cursor.")
        (call-interactively fun)
        (isearch-yank-string cur-word))))

;;;###autoload
(defun isearch-forward-cur-word (&optional backward)
    "`isearch-forward' current word."
    (interactive)
    (let ((fun (if backward 'isearch-backward 'isearch-forward)))
      (isearch-cur-word fun)))

;;;###autoload
(defun isearch-clean ()
    "Clean string in `iserch-mode'."
    (interactive)
    (goto-char isearch-opoint)
    (let ((isearch-command
           (if isearch-forward
               (if isearch-regexp 'isearch-forward-regexp 'isearch-forward)
             (if isearch-regexp 'isearch-backward-regexp 'isearch-backward))))
      (call-interactively isearch-command)))

;; Search back/forth for the symbol at point
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/SearchAtPoint" :display "EmacsWiki")
;;;###autoload
(defun isearch-yank-symbol ()
  "*Put symbol at current point into search string."
  (interactive)
  (let ((sym (symbol-at-point)))
    (if sym
        (progn
          (setq isearch-regexp t
                isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
                isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
                isearch-yank-flag t))
      (ding)))
  (isearch-search-and-update))

(define-key isearch-mode-map "\C-\M-w" 'isearch-yank-symbol)


;; REF: (@url :file-name "http://www.emacswiki.org/emacs/ZapToISearch" :display "EmacsWiki")
;;;###autoload
(defun zap-to-isearch (rbeg rend)
  "Kill the region between the mark and the closest portion of
the isearch match string. The behaviour is meant to be analogous
to zap-to-char; let's call it zap-to-isearch. The deleted region
does not include the isearch word. This is meant to be bound only
in isearch mode.  The point of this function is that oftentimes
you want to delete some portion of text, one end of which happens
to be an active isearch word. The observation to make is that if
you use isearch a lot to move the cursor around (as you should,
it is much more efficient than using the arrows), it happens a
lot that you could just delete the active region between the mark
and the point, not include the isearch word."
  (interactive "r")
  (when (not mark-active)
    (error "Mark is not active"))
  (let* ((isearch-bounds (list isearch-other-end (point)))
         (ismin (apply 'min isearch-bounds))
         (ismax (apply 'max isearch-bounds))
         )
    (if (< (mark) ismin)
        (kill-region (mark) ismin)
      (if (> (mark) ismax)
          (kill-region ismax (mark))
        (error "Internal error in isearch kill function.")))
    (isearch-exit)
    ))

;; REF: (@url :file-name "http://www.emacswiki.org/emacs/ZapToISearch" :display "EmacsWiki")
(defun isearch-exit-other-end (rbeg rend)
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive "r")
  (isearch-exit)
  (goto-char isearch-other-end))

;;;###autoload
(defun isearch-postload ()
  "Settings for `isearch' after it's been loaded."
  (setq-default case-fold-search t) ;; 搜索时不区分大小写
  (message "* ---[ isearch post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun isearch-face-settings ()
;;   "Face settings for `isearch'."
;;   (set-face-foreground 'isearch "red")
;;   (set-face-background 'isearch "blue")
;;   (when (not is-before-emacs-21)
;;     (set-face-foreground 'lazy-highlight "black")
;;     (set-face-background 'lazy-highlight "white"))
;;   (custom-set-faces '(isearch-fail ((((class color)) (:background "red"))))))

(provide 'xy-rc-isearch)
