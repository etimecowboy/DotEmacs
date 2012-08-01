;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-28 Sat 08:18 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ediff.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ediff.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun ediff-startup-settings ()
  "Settings of ediff startup."
  (ediff-next-difference)
  (xy/smart-maximize-frame))

;;;###autoload
(defun ediff-variable-settings ()
  (setq ediff-highlight-all-diffs nil
        ediff-highlighting-style 'face))

;;;###autoload
(defun xy/max-and-split-horizontally ()
  "Maximize current frame and split the window horizontally."
  (interactive)
  (if window-system
      (if (try-require 'maxframe)
          (progn
            (maximize-frame)
            (split-window-horizontally))
        (split-window-horizontally)
    (split-window-horizontally))))

;;;###autoload
(defun ediff-settings ()
  "settings for `ediff'."
  (add-hook 'ediff-startup-hook 'ediff-startup-settings)
  (add-hook 'ediff-prepare-buffer-hook 'turn-off-hideshow)
  (add-hook 'ediff-mode-hook 'ediff-variable-settings)
  ;; 用ediff比较的时候在同一个frame中打开所有窗口
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; 全屏水平分割显示ediff结果 BUG: NOT working
  ;; (setq ediff-split-window-function 'xy/max-and-split-horizontally)
  (setq ediff-split-window-function 'split-window-horizontally)
  ;; (require 'ediff+)
  ;; (ediff+-set-actual-diff-options))
  (message "* ---[ ediff configuration is complete ]---"))

;; ;;;###autoload
;; (defun ediff-face-settings ()
;;   "Face settings for `ediff'."
;;   (if is-before-emacs-21
;;       (progn
;;         (custom-set-faces
;;          '(ediff-current-diff-face-B
;;            ((((class color) (background dark)) (:background "yellow")))))
;;         (set-face-foreground 'ediff-fine-diff-face-A "white")
;;         (set-face-background 'ediff-fine-diff-face-A "blue")
;;         (set-face-foreground 'ediff-current-diff-face-B "red")
;;         (set-face-foreground 'ediff-fine-diff-face-B "red")
;;         (set-face-background 'ediff-fine-diff-face-B "blue"))
;;     (custom-set-faces
;;      '(ediff-current-diff-A
;;        ((((type tty)) :background "yellow" :foreground "blue")
;;         (t :background "DarkSeaGreen3" :foreground "blue violet"))))
;;     (custom-set-faces
;;      '(ediff-fine-diff-A
;;        ((((type tty)) :background "blue" :foreground "white")
;;         (t :background "gold1" :foreground "red"))))
;;     (custom-set-faces
;;      '(ediff-current-diff-B
;;        ((((type tty)) :background "yellow" :foreground "black")
;;         (t :background "DodgerBlue1" :foreground "gray11"))))
;;     (custom-set-faces
;;      '(ediff-fine-diff-B
;;        ((((type tty)) :background "cyan" :foreground "red")
;;         (t :background "chocolate2" :foreground "dark slate blue"))))))

(provide 'xy-rc-ediff)
