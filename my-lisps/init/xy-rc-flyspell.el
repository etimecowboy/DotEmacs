;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-11 Mon 21:57 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-flyspell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `flyspell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun my-flyspell-ignore-uppercase (beg end &rest rest)
  (while (and (< beg end)
          (let ((c (char-after beg)))
        (not (= c (downcase c)))))
    (setq beg (1+ beg)))
  (= beg end))

;; ;; REF: https://www.emacswiki.org/emacs/FlySpell#toc5
;; ;; switch between two languages
;; ;;;###autoload
;; (defun fd-switch-dictionary()
;;   (interactive)
;;   (let* ((dic ispell-current-dictionary)
;;     	 (change (if (string= dic "deutsch8") "english" "deutsch8")))
;;     (ispell-change-dictionary change)
;;     (message "Dictionary switched from %s to %s" dic change)
;;     ))

;; ;; cycle through different languages
;; (let ((langs '("american" "francais" "brasileiro")))
;;   (setq lang-ring (make-ring (length langs)))
;;   (dolist (elem langs) (ring-insert lang-ring elem)))
;; ;;;###autoload
;; (defun cycle-ispell-languages ()
;;   (interactive)
;;   (let ((lang (ring-ref lang-ring -1)))
;;     (ring-insert lang-ring lang)
;;     (ispell-change-dictionary lang)))

;;TODO: try hunspell instead of aspell
;;;###autoload
(defun flyspell-postload ()
  "Settings of `flyspell.el' after it's been loaded."

  (setq flyspell-delay 0.5)
  (setq flyspell-issue-welcome-flag nil)
  ;; REF: https://www.emacswiki.org/emacs/FlySpell#toc3
  ;; I highly suggest setting `flyspell-issue-message-flag' to nil, as
  ;; printing messages for every word (when checking the entire
  ;; buffer) causes an enormous slowdown. - nschum
  (setq flyspell-issue-message-flag nil)
  ;; 令flyspell按照相近程度补齐
  (setq flyspell-sort-corrections t)
  ;; (add-hook 'flyspell-incorrect-hook 'my-flyspell-ignore-uppercase)

  (when (try-require 'flyspell-lazy)
    (flyspell-lazy-mode t))
  
  (message "* ---[ flyspell post-load configuration is complete ]---"))

(provide 'xy-rc-flyspell)
