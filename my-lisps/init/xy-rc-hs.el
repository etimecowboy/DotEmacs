;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-01 Wed 01:06 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-hs.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `hideshow.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun hs-minor-mode-settings ()
  "settings of `hs-minor-mode'."

  (defvar hs-headline-max-len 30 "*Maximum length of `hs-headline' to display.")
  (setq hs-isearch-open t)

  (defun hs-display-headline ()
    (let* ((len (length hs-headline))
           (headline hs-headline)
           (postfix ""))
      (when (>= len hs-headline-max-len)
        (setq postfix "...")
        (setq headline (substring hs-headline 0 hs-headline-max-len)))
      (if hs-headline (concat headline postfix " ") "")))

  (setq-default mode-line-format
                (append '((:eval (hs-display-headline))) mode-line-format))
  (setq hs-set-up-overlay 'hs-abstract-overlay)
  (defvar hs-overlay-map (make-sparse-keymap) "Keymap for hs minor mode overlay.")

  (eal-define-keys-commonly
   hs-overlay-map
   `(("<mouse-1>" hs-show-block)))

  (defun hs-abstract-overlay (ov)
    (let* ((start (overlay-start ov))
           (end (overlay-end ov))
           (str (format "<%d lines>" (count-lines start end))) text)
      (setq text (propertize str 'face 'hs-block-flag-face 'help-echo (buffer-substring (1+ start) end)))
      (overlay-put ov 'display text)
      (overlay-put ov 'pointer 'hand)
      (overlay-put ov 'keymap hs-overlay-map)))

  (defvar hs-hide-all nil "Current state of hideshow for toggling all.")
  (make-local-variable 'hs-hide-all)

  (defun hs-toggle-hiding-all ()
    "Toggle hideshow all."
    (interactive)
    (setq hs-hide-all (not hs-hide-all))
    (if hs-hide-all
        (hs-hide-all)
      (hs-show-all)))

  (defvar fold-all-fun nil "Function to fold all.")
  (make-variable-buffer-local 'fold-all-fun)
  (defvar fold-fun nil "Function to fold.")
  (make-variable-buffer-local 'fold-fun)

  (defun toggle-fold-all ()
    "Toggle fold all."
    (interactive)
    (if fold-all-fun
        (call-interactively fold-all-fun)
      (hs-toggle-hiding-all)))

  (defun toggle-fold ()
    "Toggle fold."
    (interactive)
    (if fold-fun
        (call-interactively fold-fun)
      (hs-toggle-hiding)))

  (defun hs-minor-mode-4-emaci-settings ()
    "Settings of `hs-minor-mode' for `emaci'."
    (eal-define-keys
     'emaci-mode-map
     `(("s" toggle-fold)
       ("S" toggle-fold-all))))

  (eval-after-load "emaci" '(hs-minor-mode-4-emaci-settings))

  ;; ELPA `hideshowvis.el'
  ;; Add little `+/-' displays to foldable regions in the
  ;; buffer and to folded regions.
  (when (try-require 'hideshowvis)
    (hideshowvis-minor-mode t))

  (message "* ---[ hideshow configuration is complete ]---"))

;; ;;;###autoload
;; (defun hs-minor-mode-face-settings ()
;;   "Face settings for `hideshow'."
;;   (defface hs-block-flag-face
;;     '((((type tty pc)) :foreground "white" :background "red")
;;       (t :foreground "#AF210000AF21" :background "lightgreen" :box (:line-width -1 :style released-button)))
;;     "Face of hs minor mode block flag."))

(provide 'xy-rc-hs)
