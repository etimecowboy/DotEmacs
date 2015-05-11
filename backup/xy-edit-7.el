;;; xy-edit-7.el --- Xin Yang's utilities for editing

;; Copyright (C) 2011-2012, Xin Yang, all rights reserved.

;; Author: Xin Yang <xin2.yang@gmail.com>
;; Created: 28 Jan 2011
;; Time-stamp: <2015-04-27 Mon 21:40 by xin on zbox.soton.ac.uk>
;; Keywords: auto install lisp load-path autoloads
;; Compatibility: Only tested on GNU Emacs 24.2

;;; Commentary:

;; Collected various functions to assist edting.
;; Emacs-Prelude

;;; Code:

(eval-when-compile (require 'cl))

(require 'thingatpt)

;;* REF: `prelude-core.el'

;; ;;;###autoload
;; (defun prelude-open-with (arg)
;;   "Open visited file in default external program.
;; When in dired mode, open file under the cursor.

;; With a prefix ARG always prompt for command to use."
;;   (interactive "P")
;;   (let* ((current-file-name
;;           (if (eq major-mode 'dired-mode)
;;               (dired-get-file-for-visit)
;;             buffer-file-name))
;;          (open (pcase system-type
;;                  (`darwin "open")
;;                  ((or `gnu `gnu/linux `gnu/kfreebsd) "xdg-open")))
;;          (program (if (or arg (not open))
;;                       (read-shell-command "Open current file with: ")
;;                     open)))
;;     (start-process "prelude-open-with-process" nil program current-file-name)))

;; ;;;###autoload
;; (defun prelude-open-with ()
;;   "Simple function that allows us to open the underlying
;; file of a buffer in an external program."
;;   (interactive)
;;   (when buffer-file-name
;;     (shell-command (concat
;;                     (if (eq system-type 'darwin)
;;                         "open"
;;                       (read-shell-command "Open current file with: "))
;;                     " "
;;                     buffer-file-name))))

;; ;;;###autoload
;; (defun prelude-google ()
;;   "Googles a query or region if any."
;;   (interactive)
;;   (browse-url
;;    (concat
;;     "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
;;     (url-hexify-string (if mark-active
;;                            (buffer-substring (region-beginning) (region-end))
;;                          (read-string "Google: "))))))

;; ;;;###autoload
;; (defun prelude-indent-rigidly-and-copy-to-clipboard (begin end indent)
;;   "Copy the selected code region to the clipboard, indented according
;; to Markdown blockquote rules."
;;   (let ((buffer (current-buffer)))
;;     (with-temp-buffer
;;       (insert-buffer-substring-no-properties buffer begin end)
;;       (indent-rigidly (point-min) (point-max) indent)
;;       (clipboard-kill-ring-save (point-min) (point-max)))))

;; ;;;###autoload
;; (defun prelude-indent-blockquote-and-copy-to-clipboard (begin end)
;;   "Copy the selected code region to the clipboard, indented according
;; to markdown blockquote rules (useful to copy snippets to StackOverflow, Assembla, Github."
;;   (interactive "r")
;;   (prelude-indent-rigidly-and-copy-to-clipboard begin end 4))

;; ;;;###autoload
;; (defun prelude-indent-nested-blockquote-and-copy-to-clipboard (begin end)
;;   "Copy the selected code region to the clipboard, indented according
;; to markdown blockquote rules. Useful to add snippets under bullet points."
;;   (interactive "r")
;;   (prelude-indent-rigidly-and-copy-to-clipboard begin end 6))

;; ;;;###autoload
;; (defun prelude-insert-empty-line ()
;;   "Insert an empty line after the current line and positon
;; the curson at its beginning, according to the current mode."
;;   (interactive)
;;   (move-end-of-line nil)
;;   (open-line 1)
;;   (forward-line 1)
;;   (indent-according-to-mode))

;; ;; ;;;###autoload
;; ;; (defun prelude-move-line-up ()
;; ;;   "Move up the current line."
;; ;;   (interactive)
;; ;;   (transpose-lines 1)
;; ;;   (forward-line -2))

;; ;; ;;;###autoload
;; ;; (defun prelude-move-line-down ()
;; ;;   "Move down the current line."
;; ;;   (interactive)
;; ;;   (forward-line 1)
;; ;;   (transpose-lines 1)
;; ;;   (forward-line -1))

;; ;;;###autoload
;; (defun prelude-indent-buffer ()
;;   "Indents the entire buffer."
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; ;;;###autoload
;; (defun prelude-indent-region-or-buffer ()
;;   "Indents a region if selected, otherwise the whole buffer."
;;   (interactive)
;;   (save-excursion
;;     (if (region-active-p)
;;         (progn
;;           (indent-region (region-beginning) (region-end))
;;           (message "Indented selected region."))
;;       (progn
;;         (prelude-indent-buffer)
;;         (message "Indented buffer.")))))

;; ;; ;;;###autoload
;; ;; (defun prelude-annotate-todo ()
;; ;;   "Put fringe marker on TODO: lines in the curent buffer."
;; ;;   (interactive)
;; ;;   (save-excursion
;; ;;     (goto-char (point-min))
;; ;;     (while (re-search-forward "TODO:" nil t)
;; ;;       (let ((overlay (make-overlay (- (point) 5) (point))))
;; ;;         (overlay-put overlay
;; ;;                      'before-string
;; ;;                      (propertize (format "A")
;; ;;                                  'display '(left-fringe right-triangle)))))))
;; ;;;###autoload
;; (defun prelude-copy-file-name-to-clipboard ()
;;   "Copy the current buffer file name to the clipboard."
;;   (interactive)
;;   (let ((filename (if (equal major-mode 'dired-mode)
;;                       default-directory
;;                     (buffer-file-name))))
;;     (when filename
;;       (kill-new filename)
;;       (message "Copied buffer file name '%s' to the clipboard." filename))))

;; ;; ;;;###autoload
;; ;; (defun prelude-duplicate-current-line-or-region (arg)
;; ;;   "Duplicates the current line or region ARG times.
;; ;; If there's no region, the current line will be duplicated. However, if
;; ;; there's a region, all lines that region covers will be duplicated."
;; ;;   (interactive "p")
;; ;;   (let (beg end (origin (point)))
;; ;;     (if (and mark-active (> (point) (mark)))
;; ;;         (exchange-point-and-mark))
;; ;;     (setq beg (line-beginning-position))
;; ;;     (if mark-active
;; ;;         (exchange-point-and-mark))
;; ;;     (setq end (line-end-position))
;; ;;     (let ((region (buffer-substring-no-properties beg end)))
;; ;;       (-dotimes arg
;; ;;                 (lambda ()
;; ;;                   (goto-char end)
;; ;;                   (newline)
;; ;;                   (insert region)
;; ;;                   (setq end (point))))
;; ;;       (goto-char (+ origin (* (length region) arg) arg)))))

;; ;; TODO doesn't work with uniquify
;; ;; ;;;###autoload
;; ;; (defun prelude-rename-file-and-buffer ()
;; ;;   "Renames current buffer and file it is visiting."
;; ;;   (interactive)
;; ;;   (let ((name (buffer-name))
;; ;;         (filename (buffer-file-name)))
;; ;;     (if (not (and filename (file-exists-p filename)))
;; ;;         (message "Buffer '%s' is not visiting a file!" name)
;; ;;       (let ((new-name (read-file-name "New name: " filename)))
;; ;;         (cond ((get-buffer new-name)
;; ;;                (message "A buffer named '%s' already exists!" new-name))
;; ;;               (t
;; ;;                (rename-file name new-name 1)
;; ;;                (rename-buffer new-name)
;; ;;                (set-visited-file-name new-name)
;; ;;                (set-buffer-modified-p nil)))))))

;; ;; ;;;###autoload
;; ;; (defun prelude-delete-file-and-buffer ()
;; ;;   "Kills the current buffer and deletes the file it is visiting"
;; ;;   (interactive)
;; ;;   (let ((filename (buffer-file-name)))
;; ;;     (when filename
;; ;;       (delete-file filename)
;; ;;       (message "Deleted file %s" filename)))
;; ;;   (kill-buffer))

;; ;; ;;;###autoload
;; ;; (defun prelude-exchange-point-and-mark ()
;; ;;   "Identical to `exchange-point-and-mark' but will not activate the region."
;; ;;   (interactive)
;; ;;   (exchange-point-and-mark)
;; ;;   (deactivate-mark nil))

;; 

;; ;;* REF: `prelude-programming.el'

;; ;;;###autoload
;; (defun prelude-ido-goto-symbol (&optional symbol-list)
;;   "Refresh imenu and jump to a place in the buffer using Ido."
;;   (interactive)
;;   (unless (featurep 'imenu)
;;     (require 'imenu nil t))
;;   (cond
;;    ((not symbol-list)
;;     (let ((ido-mode ido-mode)
;;           (ido-enable-flex-matching
;;            (if (boundp 'ido-enable-flex-matching)
;;                ido-enable-flex-matching t))
;;           name-and-pos symbol-names position)
;;       (unless ido-mode
;;         (ido-mode 1)
;;         (setq ido-enable-flex-matching t))
;;       (while (progn
;;                (imenu--cleanup)
;;                (setq imenu--index-alist nil)
;;                (prelude-ido-goto-symbol (imenu--make-index-alist))
;;                (setq selected-symbol
;;                      (ido-completing-read "Symbol? " symbol-names))
;;                (string= (car imenu--rescan-item) selected-symbol)))
;;       (unless (and (boundp 'mark-active) mark-active)
;;         (push-mark nil t nil))
;;       (setq position (cdr (assoc selected-symbol name-and-pos)))
;;       (cond
;;        ((overlayp position)
;;         (goto-char (overlay-start position)))
;;        (t
;;         (goto-char position)))))
;;    ((listp symbol-list)
;;     (dolist (symbol symbol-list)
;;       (let (name position)
;;         (cond
;;          ((and (listp symbol) (imenu--subalist-p symbol))
;;           (prelude-ido-goto-symbol symbol))
;;          ((listp symbol)
;;           (setq name (car symbol))
;;           (setq position (cdr symbol)))
;;          ((stringp symbol)
;;           (setq name symbol)
;;           (setq position
;;                 (get-text-property 1 'org-imenu-marker symbol))))
;;         (unless (or (null position) (null name)
;;                     (string= (car imenu--rescan-item) name))
;;           (add-to-list 'symbol-names (substring-no-properties name))
;;           (add-to-list 'name-and-pos (cons (substring-no-properties name) position))))))))

(provide 'xy-edit-7)

;;; xy-edit-7.el ends here
