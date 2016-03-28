;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:58 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-zjl-hl.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `zjl-hl.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun zjl-hl-postload ()
  "Settings for `zjl-hl' after it's been loaded."

  (setq zjl-hl-c++-mode-enable-flag t)
  (zjl-hl-enable-global-all-modes)

  (custom-set-faces
   ;; '(zjl-elisp-hl-function-call-face
   ;;      ((((class grayscale) (background light))
   ;;        :foreground "LightGray" :weight bold)
   ;;       (((class grayscale) (background dark))
   ;;        :foreground "DimGray" :weight bold)
   ;;       (((class color) (min-colors 88) (background light))
   ;;        :foreground "Orchid")
   ;;       (((class color) (min-colors 88) (background dark))
   ;;        :foreground "cornflower blue")
   ;;       (((class color) (min-colors 16) (background light))
   ;;        :foreground "Orchid")
   ;;       (((class color) (min-colors 16) (background dark))
   ;;        :foreground "LightSteelBlue")
   ;;       (((class color) (min-colors 8))
   ;;        (:foreground "blue" :weight bold)) (t (:weight bold))))
   ;; '(zjl-elisp-hl-setq-face
   ;;      ((((class grayscale) (background light))
   ;;        :foreground "LightGray" :weight bold)
   ;;       (((class grayscale) (background dark))
   ;;        :foreground "DimGray" :weight bold)
   ;;       (((class color) (min-colors 88) (background light))
   ;;        :foreground "Orchid")
   ;;       (((class color) (min-colors 88) (background dark))
   ;;        :foreground "cornflower blue")
   ;;       (((class color) (min-colors 16) (background light))
   ;;        :foreground "Orchid")
   ;;       (((class color) (min-colors 16) (background dark))
   ;;        :foreground "LightSteelBlue")
   ;;       (((class color) (min-colors 8))
   ;;        (:foreground "blue" :weight bold)) (t (:weight bold))))
   '(zjl-hl-elisp-function-call-face
        ((((class color) (background dark)) (:foreground "cyan"))))
   '(zjl-hl-elisp-setq-face
     ((((class color) (background dark)) (:foreground "cyan"))))
   '(zjl-hl-font-lock-bracket-face
     ((((class color) (background dark))
       (:foreground "firebrick3" :weight bold :height 1.2))))
   '(zjl-hl-function-call-face ((t (:foreground "cyan"))))
   '(zjl-hl-local-variable-reference-face
     ((((class color) (background dark)) nil)))
   '(zjl-hl-number-face
     ((((class color) (background dark)) (:foreground "red"))))
   '(zjl-hl-operators-face
     ((((class color) (background dark))
       (:foreground "Green" :weight bold))))
   '(zjl-hl-parameters-reference-face
     ((((class color) (background dark))
       (:foreground "Yellow" :weight bold)))))

  ;; (custom-set-faces
  ;;  '(zjl-hl-function-call-face
  ;;    ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;     (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;     (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;     (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;     (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;     (t (:weight bold)))))

  ;; (custom-set-faces
  ;;  '(zjl-elisp-hl-function-call-face
  ;;      ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;       (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;       (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;       (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;       (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;       (t (:weight bold)))))

  ;; (custom-set-faces
  ;;  '(zjl-elisp-hl-setq-face
  ;;      ((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;       (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;       (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;       (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;       (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;       (t (:weight bold)))))

  ;; (setq zjl-hl-function-call-face
  ;;    '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;     (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;     (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;     (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;     (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;     (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;     (t (:weight bold))))

  ;; (setq zjl-elisp-hl-function-call-face
  ;;      '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;       (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;       (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;       (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;       (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;       (t (:weight bold))))

  ;; (setq zjl-elisp-hl-setq-face
  ;;      '((((class grayscale) (background light)) :foreground "LightGray" :weight bold)
  ;;       (((class grayscale) (background dark)) :foreground "DimGray" :weight bold)
  ;;       (((class color) (min-colors 88) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue")
  ;;       (((class color) (min-colors 16) (background light)) :foreground "Orchid")
  ;;       (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue")
  ;;       (((class color) (min-colors 8)) (:foreground "blue" :weight bold))
  ;;       (t (:weight bold))))

  ;; (setq zjl-hl-operators-face 'font-lock-type-face
  ;;       zjl-hl-local-variable-reference-face 'font-lock-variable-name-face
  ;;       zjl-hl-parameters-reference-face 'font-lock-variable-name-face
  ;;       zjl-hl-member-reference-face 'font-lock-variable-name-face
  ;;       zjl-elisp-hl-setq-face 'font-lock-keyword-face))

  (message "* ---[ zjl-hl post-load configuration is complete ]---"))

(provide 'xy-rc-zjl-hl)
