;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:32 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-palette.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `palette.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun palette-quit-restore ()
  "Quite palette and restore face changed."
  (interactive)
  (palette-quit)
  (palette-face-restore))

;;;###autoload
(defun palette-quit-restore-bg-fg ()
  "Quite palette and restore face changed."
  (interactive)
  (palette-quit)
  (palette-face-restore-bg-fg))

;;;###autoload
(defun palette-face-restore ()
  "Restore face have changed."
  (interactive)
  (unless (or (string= facemenup-last-face-color palette-current-color)
              (string= (hexrgb-color-name-to-hex facemenup-last-face-color) palette-current-color))
    (if facemenup-palette-change-face-bg
        (facemenup-face-bg-restore)
      (facemenup-face-fg-restore))))

;;;###autoload
(defun palette-face-restore-bg-fg ()
  "Restore face background and foreground have changed."
  (interactive)
  (facemenup-face-bg-restore)
  (facemenup-face-fg-restore))

;;;###autoload
(defun palette-set-face-changed-to-foreground (&optional is-bg)
  "Set face change color to foreground."
  (interactive "P")
  (setq facemenup-palette-change-face-bg is-bg)
  (setq palette-action
        `(lambda ()
           ,(if is-bg
                `(set-face-background facemenup-last-face-changed palette-current-color)
              `(set-face-foreground facemenup-last-face-changed palette-current-color))))
  (message (concat "Change to " (if is-bg "back" "fore") "ground")))

;;;###autoload
(defun palette-set-face-changed-to-background (&optional is-fg)
  "Set face change color to background."
  (interactive "P")
  (palette-set-face-changed-to-foreground (not is-fg)))

;;;###autoload
(defun palette-disply-which-in-changine ()
  "Display which face in changing on palette."
  (interactive)
  (message (concat "Color changing is: %s's " (if facemenup-palette-change-face-bg "back" "fore") "ground") facemenup-last-face-changed))

;;;###autoload
(defun palette-copy-current-color ()
  "Copy current color."
  (interactive)
  (kill-new palette-current-color)
  (message "Color %s copied." palette-current-color))

;; ;; ###autoload
;; (defun blink-cursor-mode-disable ()
;;   "Disable `blink-cursor-mode'."
;;   (interactive)
;;   (blink-cursor-mode -1))

;;;###autoload
(defun kill-palette-buffers (frame)
  (when (get-buffer "Palette (Hue x Saturation)") (kill-buffer "Palette (Hue x Saturation)"))
  (when (get-buffer "Brightness") (kill-buffer "Brightness"))
  (when (get-buffer "Current/Original") (kill-buffer "Current/Original")))

;;;###autoload
(defun palette-postload ()
  "Settings of `palette' after it's been loaded."
  (require 'facemenu+)
  (defvar facemenup-palette-change-face-bg nil
    "Face background be changed or not.")
  (defvar facemenup-last-face-color nil
    "Last face color used.")
  ;; (add-hook 'palette-mode-hook
  ;;           (progn
  ;;             (link-cursor-mode -1)))

  (defmacro def-palette-move-command (move-command speed)
    "Make definition of command which palette move quickly."
    `(defun ,(am-intern move-command "-quickly") ()
       ,(concat move-command " quickly.")
       (interactive)
       (,(symbol-function (intern move-command)) ,speed)))

  (apply-args-list-to-fun
   'def-palette-move-command
   `(("palette-down"  7)
     ("palette-up"    7)
     ("palette-left"  7)
     ("palette-right" 7)))
  (add-to-list 'delete-frame-functions 'kill-palette-buffers)
  (message "* ---[ palette post-load configuration is complete ]---"))

(provide 'xy-rc-palette)

;; (if window-system
;;     (let ((font (car (x-list-fonts "-outline-Courier New-normal-normal-normal-mono-6-*-*-*-c-*-iso8859-1" nil nil 1))))
;;       (if font
;;           (setq palette-font font))))

;; (defvar facemenup-palette-change-face-bg nil "Face background be changed or not.")
;; (defvar facemenup-last-face-color nil "Last face color used.")
