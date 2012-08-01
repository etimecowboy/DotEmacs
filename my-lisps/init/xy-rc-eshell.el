;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:07 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-eshell.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `eshell.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun eshell-settings ()
  "Settings for `term'."
  ;; (add-hook 'eshell-preoutput-filter-functions
  ;;           'ansi-color-filter-apply)

  ;; (defun eshell-handle-ansi-color ()
  ;;     (ansi-color-apply-on-region
  ;;      eshell-last-output-start
  ;;      eshell-last-output-end))
  ;; (add-to-list 'eshell-output-filter-functions
  ;;              'eshell-handle-ansi-color)

  (setq eshell-directory-name (concat my-emacs-path "/eshell")
  ;; (wrong) (setq eshell-ls-use-in-dired t nil (em-ls))

        eshell-cmpl-cycle-completions     nil
        eshell-save-history-on-exit       t
        eshell-scroll-show-maximum-output nil
        eshell-scroll-to-bottom-on-input  'this
        eshell-scroll-to-bottom-on-output 'this
        ;; eshell-cmpl-dir-ignore
        ;;   "\\`\\(\\.\\.?\\|CVS\\|\\.svn\\|\\.hg\\|\\.git\\|_darcs\\)/\\'"
        eshell-output-filter-functions
          '(eshell-handle-ansi-color
            eshell-handle-control-codes
            eshell-postoutput-scroll-to-bottom
            eshell-truncate-buffer
            eshell-watch-for-password-prompt))

  (eval-after-load 'esh-mode
    '(progn
       (require 'em-dirs)

       (defun eshell/cds ()
         "Change directory to the project's root."
         (eshell/cd (locate-dominating-file default-directory "src")))

       (defun eshell/find (dir &rest opts)
         (find-dired dir (mapconcat 'identity opts " ")))

       (setq eshell-visual-commands
             (append
              '("mutt" "vim" "screen" "tmux" "lftp" "mc" "ipython" "bpython"
                "telnet" "ssh" "tail" "most" "top" "htop" "iotop" "ncmpcpp"
                "newsbeuter" "alsamixer" "atop")
              eshell-visual-commands))

       (add-hook 'eshell-mode-hook
                 (lambda ()
                   (define-key eshell-mode-map (kbd "C-l")
                     (lambda ()
                       (interactive)
                       (goto-char (point-max))
                       (recenter-top-bottom 0)))))))

  (eval-after-load 'esh-opt
    '(progn
       (require 'em-prompt)
       (require 'em-term)
       (require 'em-cmpl)
       (setenv "PAGER" "cat")))

  (message "* ---[ eshell configuration is complete ]---"))

(provide 'xy-rc-eshell)
