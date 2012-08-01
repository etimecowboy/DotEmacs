;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:34 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pulse.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pulse.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun pulse-settings ()
  "Settings for `pulse'."
  (setq pulse-command-advice-flag t) ;; (if window-system 1 nil)
  ;; (pulse-toggle-integration-advice t)
  ;; (pulse-toggle-integration-advice (if window-system 1 -1))
  (defadvice goto-line (after pulse-advice activate)
    "Cause the line that is `goto'd to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice exchange-point-and-mark (after pulse-advice activate)
    "Cause the line that is `goto'd to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p)
               (> (abs (- (point) (mark))) 400))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice find-tag (after pulse-advice activate)
    "After going to a tag, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice tags-search (after pulse-advice activate)
    "After going to a hit, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice tags-loop-continue (after pulse-advice activate)
    "After going to a hit, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice pop-tag-mark (after pulse-advice activate)
    "After going to a hit, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice imenu-default-goto-function (after pulse-advice activate)
    "After going to a tag, pulse the line the cursor lands on."
    (when pulse-command-advice-flag
      (pulse-momentary-highlight-one-line (point))))
  (defadvice cua-exchange-point-and-mark (after pulse-advice activate)
    "Cause the line that is `goto'd to pulse when the cursor gets there."
    (when (and pulse-command-advice-flag (interactive-p)
               (> (abs (- (point) (mark))) 400))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice switch-to-buffer (after pulse-advice activate)
    "After switch-to-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice previous-buffer (after pulse-advice activate)
    "After previous-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice next-buffer (after pulse-advice activate)
    "After next-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice ido-switch-buffer (after pulse-advice activate)
    "After ido-switch-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (defadvice beginning-of-buffer (after pulse-advice activate)
    "After beginning-of-buffer, pulse the line the cursor lands on."
    (when (and pulse-command-advice-flag (interactive-p))
      (pulse-momentary-highlight-one-line (point))))
  (add-hook 'next-error-hook 'pulse-line-hook-function)
  (message "* ---[ pulse configuration is complete ]---"))

;;;###autoload
(defun pulse-face-settings ()
  "Face settings for `pulse'."
  (custom-set-faces
   '(pulse-highlight-start-face
     ((((class color) (min-colors 88) (background dark)) :background "#AAAA33")
      (((class color) (min-colors 88) (background light)) :background "#FFFFAA")
      (((class color) (min-colors 8)) :background "blue" :foreground "red")))))

(provide 'xy-rc-pulse)

;; (defadvice switch-to-buffer (after pulse-advice activate)
;;   "After switch-to-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice previous-buffer (after pulse-advice activate)
;;   "After previous-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice next-buffer (after pulse-advice activate)
;;   "After next-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice beginning-of-buffer (after pulse-advice activate)
;;   "After beginning-of-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice ido-switch-buffer (after pulse-advice activate)
;;   "After ido-switch-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice viss-bookmark-next-buffer (after pulse-advice activate)
;;   "After viss-bookmark-next-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice viss-bookmark-prev-buffer (after pulse-advice activate)
;;   "After viss-bookmark-prev-buffer, pulse the line the cursor lands on."
;;   (when (and pulse-command-advice-flag (interactive-p))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice exchange-point-and-mark-nomark (after pulse-advice activate)
;;   "Cause the line that is `goto'd to pulse when the cursor gets there."
;;   (when (and pulse-command-advice-flag (interactive-p)
;;              (> (abs (- (point) (mark))) 400))
;;     (pulse-momentary-highlight-one-line (point))))

;; (defadvice cua-exchange-point-and-mark (after pulse-advice activate)
;;   "Cause the line that is `goto'd to pulse when the cursor gets
;; there."
;;   (when (and pulse-command-advice-flag (interactive-p)
;;              (> (abs (- (point) (mark))) 400))
;;     (pulse-momentary-highlight-one-line (point))))

;; ;; (defadvice visit-.emacs (after pulse-advice activate)
;; ;;   "Cause the current line of .emacs buffer to pulse when the cursor gets there."
;; ;;   (when (and pulse-command-advice-flag (interactive-p))
;; ;;     (pulse-momentary-highlight-one-line (point))))
