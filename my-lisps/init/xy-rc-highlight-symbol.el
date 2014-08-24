;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-24 Sun 03:48 by xin on ubuntu>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-highlight-symbol.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `highlight-symbol.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;;###autoload
(defun highlight-symbol-mode-on ()
  "Turn on function `highlight-symbol-mode'."
  (if window-system
      (highlight-symbol-mode 1)))

;;;###autoload
(defun highlight-symbol-mode-off ()
  "Turn off function `highlight-symbol-mode'."
  (highlight-symbol-mode -1))

;;;###autoload
(define-globalized-minor-mode global-highlight-symbol-mode
  highlight-symbol-mode highlight-symbol-mode-on)

;;;###autoload
(defun highlight-symbol-settings-4-emaci ()
  "`highlight-symbol' settings for `emaci'."
  (emaci-add-key-definition "n" 'highlight-symbol-next)
  (emaci-add-key-definition "p" 'highlight-symbol-prev))


;;;###autoload
(defun highlight-symbol-jump (dir)
  "Jump to the next or previous occurence of the symbol at point.
DIR has to be 1 or -1."
  (let ((symbol (highlight-symbol-get-symbol)))
    (if symbol
        (let* ((case-fold-search nil)
               (bounds (bounds-of-thing-at-point 'symbol))
               (offset (- (point) (if (< 0 dir) (cdr bounds) (car bounds)))))
          (unless (eq last-command 'highlight-symbol-jump)
            (push-mark))
          (let ((target
                 (save-excursion
                   ;; move a little, so we don't find the same instance again
                   (goto-char (- (point) offset))
                   (re-search-forward symbol nil t dir))))
            (if target
                (goto-char (+ target offset))
              (message (format "Reach %s" (if (> dir 0) "bottom" "top"))))
            (setq this-command 'highlight-symbol-jump)))
      (error "No symbol at point"))))

;;;###autoload
(defun highlight-symbol-postload ()
  "Settings for `highlight-symbol' after it's been loaded."
  (setq highlight-symbol-idle-delay 0.5)
  ;; I bind "C-x w" to `copy-sexp'
  (eal-define-keys
   'hi-lock-map
   `(("C-x w" nil)))

  (eal-define-keys
   'emaci-mode-map
   `(("p" emaci-p)))

  (eval-after-load "emaci" '(highlight-symbol-settings-4-emaci))

  (when window-system
    (am-add-hooks
     '(emacs-lisp-mode-hook
       lisp-interaction-mode-hook java-mode-hook
       c-mode-common-hook text-mode-hook ruby-mode-hook
       html-mode-hook sh-mode-hook Info-mode-hook perl-mode-hook)
     'highlight-symbol-mode-on))

  (message "* ---[ highlight-symbol post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun highlight-symbol-face-settings ()
;;   "Face settings for `highlight-symbol'."
;;   (custom-set-faces
;;    '(highlight-symbol-face
;;      ((((type tty))
;;        :background "white" :foreground "black")
;;       (((class color) (background dark))
;;        :background "gray30" :foreground "#AD0DE2FAFFFF")
;;       (((class color) (background light))
;;        :background "gray90")))))

(provide 'xy-rc-highlight-symbol)
