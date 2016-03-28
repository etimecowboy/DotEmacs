;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:33 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;;;###autoload
(defun eshell-postload ()
  "Settings for `term' after it's been loaded."
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

  (message "* ---[ eshell post-load configuration is complete ]---"))

(provide 'xy-rc-eshell)
