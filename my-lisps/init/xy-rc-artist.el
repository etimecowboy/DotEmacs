;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:23 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-artist.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `artist.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun artist-mode-init-hook-settings ()
  "Settings for `artist-mode-init-hook'."

  (artist-select-op-rectangle)
  (setq hl-line-mode-active (hl-line-mode-active))
  (setq highlight-symbol-mode-active (highlight-symbol-mode-active))
  (when hl-line-mode-active
    (hl-line-mode -1))
  (when highlight-symbol-mode-active
    (highlight-symbol-mode -1)))

;;;###autoload
(defun artist-mode-exit-hook-settings ()
  "Settings for `artist-mode-exit-hook'."

  (when hl-line-mode-active
    (hl-line-mode 1))
  (when highlight-symbol-mode-active
    (highlight-symbol-mode 1)))

;;;###autoload
(defun artist-settings ()
  "Settings for `artist-mode'."

  (defvar hl-line-mode-active          nil "`hl-line-mode' active or not.")
  (defvar highlight-symbol-mode-active nil "`hlghlight-symbol-mode' active or not.")

  (make-variable-buffer-local 'hl-line-mode-active)
  (make-variable-buffer-local 'highlight-symbol-mode-active)

  (am-def-active-fun hl-line-mode hl-line-mode-active)
  (am-def-active-fun highlight-symbol-mode highlight-symbol-mode-active)

  (add-hook 'artist-mode-init-hook 'artist-mode-init-hook-settings)
  (add-hook 'artist-mode-exit-hook 'artist-mode-exit-hook-settings)

  (message "* ---[ artist configuration is complete ]---"))

(provide 'xy-rc-artist)
