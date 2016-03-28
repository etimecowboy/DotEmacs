;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:41 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-helm-flyspell.el'
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
;; REF:
;; http://emacs.stackexchange.com/questions/14909/how-to-use-flyspell-to-efficiently-correct-previous-word
;; With helm-flyspell you can choose from the list of corrections
;; efficiently. I use the following code to jump to the errors and
;; correct them with it, it saves the position of the point to the
;; mark-ring so you can jump back to the position where you started or
;; corrected words previously:
;;;###autoload
(defun flyspell-goto-previous-error (arg)
  "Go to arg previous spelling error."
  (interactive "p")
  (while (not (= 0 arg))
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto beginning of buffer
                (progn
                  (message "Restarting from end of buffer")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the next error
      (while (and (> pos min)
                  (let ((ovs (overlays-at pos))
                        (r '()))
                    (while (and (not r) (consp ovs))
                      (if (flyspell-overlay-p (car ovs))
                          (setq r t)
                        (setq ovs (cdr ovs))))
                    (not r)))
        (backward-word 1)
        (setq pos (point)))
      ;; save the current location for next invocation
      (setq arg (1- arg))
      (setq flyspell-old-pos-error pos)
      (setq flyspell-old-buffer-error (current-buffer))
      (goto-char pos)
      (if (= pos min)
          (progn
            (message "No more miss-spelled word!")
            (setq arg 0))))))

;;;###autoload
(defun check-previous-spelling-error ()
  "Jump to previous spelling error and correct it"
  (interactive)
  (push-mark-no-activate)
  (flyspell-goto-previous-error 1)
  (call-interactively 'helm-flyspell-correct))

;;;###autoload
(defun check-next-spelling-error ()
  "Jump to next spelling error and correct it"
  (interactive)
  (push-mark-no-activate)
  (flyspell-goto-next-error)
  (call-interactively 'helm-flyspell-correct))

;;;###autoload
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
 Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

;;;###autoload
(defun helm-flyspell-postload ()
  "Settings of `helm-flyspell.el' after it's been loaded."

  (message "* ---[ helm-flyspell post-load configuration is complete ]---"))

(provide 'xy-rc-helm-flyspell)
