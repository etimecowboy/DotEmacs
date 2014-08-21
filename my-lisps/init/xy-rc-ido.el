;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-08-21 Thu 16:38 by xy12g13 on UOS-208326>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-ido.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `ido.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; NOTE: NEVER use both icy-mode and ido/smex. They are different in the
;;way of using minibuffer, and conflicts with each other.
;;;###autoload
(defun xy/ido-start ()
  "Start ido completion."
  (interactive)
  (when (featurep 'icicles)
    (icy-mode -1))
  (require 'ido)
  (ido-mode 1))

;;;###autoload
(defun ido-up-directory-clean-text ()
  "Run C-u `ido-up-directory'."
  (interactive)
  (ido-up-directory t))

;;;###autoload
(defun ido-clean-text ()
  "Clean `ido-text'."
  (interactive)
  (if (= (minibuffer-prompt-end) (point))
      (ido-up-directory t)
    (delete-region (minibuffer-prompt-end) (point-max))))

;;;###autoload
(defun ido-goto-home ()
  (interactive)
  "Go to home directory when use `ido-find-file'"
  (ido-set-current-home)
  (setq ido-exit 'refresh)
  (exit-minibuffer))

;;;###autoload
(defun ido-goto-root ()
  (interactive)
  "Go to root directory when use `ido-find-file'"
  (ido-set-current-directory "/")
  (setq ido-exit 'refresh)
  (exit-minibuffer))

;;;###autoload
(defun ido-postload ()
  "Settings for `ido' after it's been loaded."

  ;; (If is-before-emacs-21
  ;;     (setq read-buffer-function 'ido-read-buffer)
  ;;   (ido-everywhere t)
  ;;   (setq ido-define-mode-map-hook 'ido-setup-hook))

  ;; (setq ido-save-directory-list-file
  ;;               (concat my-var-path "/ido-last-"
  ;;                         user-login-name "-"
  ;;                         system-name "-"
  ;;                         system-configuration))

  ;; NOTE: no need to have different ido-last files on different
  ;;       machines.
  (setq ido-save-directory-list-file
        (concat my-var-path "/ido-last-"
                user-login-name "-"
                system-name "-"
                system-configuration))
  (unless (file-exists-p ido-save-directory-list-file)
    (shell-command (concat "touch " ido-save-directory-list-file)))
  (setq ido-everywhere t)
  (setq ido-enable-last-directory-history t) ; remember last used dirs
  (setq ido-max-work-directory-list 50)      ; should be enough
  (setq ido-max-work-file-list      50)      ; remember many
  (setq ido-max-directory-size 1000000)
  ;; (setq ido-ignore-buffers ;; ignore these guys
  ;;         '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido"
  ;;           "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*" "^\*"))
  (setq ido-case-fold  t)              ; be case-insensitive
  (setq ido-use-filename-at-point 'guess)
  (setq ido-use-url-at-point t)
  (setq ido-enable-flex-matching t)
  (setq ido-max-prospects 8)
  (setq ido-confirm-unique-completion t)
  (setq ido-create-new-buffer 'always)
  (setq ido-default-buffer-method  (quote selected-window))
  (setq confirm-nonexistent-file-or-buffer t)
  (setq ido-max-dir-file-cache 0) ;; 不让缓存目录,否则目录改变他也不知道
  (setq ido-enable-regexp t)      ;; 可以用正则表达式找文件

  (defmacro def-ido-enter-command (command)
    "Make definition of command which execute some command in ido."
    `(defun ,(am-intern "ido-enter-" command) ()
       ,(concat "Drop into `" command "' from file switching.")
       (interactive)
       (setq ido-exit (quote ,(intern command)))
       (exit-minibuffer)))

  (add-hook 'org-mode-hook
            '(lambda ()
               (setq org-completion-use-ido t)))
  
  (message "* ---[ ido post-load configuration is complete ]---"))

(provide 'xy-rc-ido)
