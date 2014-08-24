;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hi-lock.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hi-lock.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; Show all the hi-lock-ed lines
;; I use this snippet to analyze complex log files. It is colored
;; multiple `occur' in a sense. – rubikitch
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/HiLock"
;; :display "emacswiki")
;; ;;;###autoload
;; (defun hi-lock-show-all ()
;;   "Show all lines in the current buffer containing a overlay of hi-lock."
;;   (interactive)
;;   (let ((newbuf (format "*hi-lock:%s*" (buffer-name)))
;;         (hide-start (point-min)))
;;     (when (get-buffer newbuf) (kill-buffer newbuf))
;;     (clone-indirect-buffer-other-window newbuf t)
;;     (with-current-buffer newbuf
;;       (goto-char (point-min))
;;       (dolist (bol (save-excursion
;;                      (sort
;;                       (mapcar (lambda (ov)
;;                                 (goto-char (overlay-start ov))
;;                                 (point-at-bol))
;;                               ;; BUG: `ee-flatten'???
;;                               (ee-flatten (overlay-lists))) '<)))
;;         (goto-char bol)
;;         (outline-flag-region hide-start bol t)
;;         (forward-line 1)
;;         (setq hide-start (point))))
;;     (outline-flag-region hide-start (point-max) t)
;;     (goto-char (point-min))
;;     (view-mode 1)))
;; ;;;###autoload
;; (defun hi-lock-overlay-p (overlay)
;;   "Return the overlay if overlay is a hi-lock overlay."
;;   (if (and (overlayp overlay)
;;            (eq (overlay-get overlay 'hi-lock-overlay) t))
;;       overlay
;;     nil))

;;;###autoload
(defun hi-lock-postload ()
  "Settings of `hi-lock.el' after it's been loaded."
  (setq hi-lock-file-patterns-policy 'ask) ;; default

  ;; Fix problem with `hl-line'
  ;; hl-line (see HighlightCurrentLine) overrides the background of
  ;; hi-lock'ed text. This is annoying if you have dark-on-light
  ;; hi-lock faces and a dark background hl-line face (or vice-versa).
  ;; The following works around this issue:
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/HiLock" :display "emacswiki")
  (defadvice hi-lock-set-pattern (around use-overlays activate)
    (let ((font-lock-fontified nil))
      ad-do-it))

  (message "* ---[ hi-lock post-load configuration is complete ]---"))



(provide 'xy-rc-hi-lock)
