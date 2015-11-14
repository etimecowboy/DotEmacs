;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2015-11-13 Fri 16:21 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-info.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `info' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun info-postload ()
  "Settings for `info' after it's been loaded."
  ;; (apply-args-list-to-fun
   ;; 'def-command-max-window `("info"))
  ;; With `info+.el', you can merge an Info node with its subnodes into
  ;; the same buffer, by calling `Info-merge-subnodes' (bound to `+'),
  ;; (require 'info+)
  (message "* ---[ info post-load configuration is complete ]---"))

(provide 'xy-rc-info)

;; Memo
;; | key            | binding                        | 
;; | m              | Info-menu                      |
;; | 1..9           | Menu                           |
;; | I              | Info-virtual-index             |
;; | q              | Info-exit                      |
;; | TAB            | Info-next-reference            |
;; | C-M-i          | Info-prev-reference            |
;; | RET            | Info-follow-nearest-node       |
;; | ESC            | Prefix                         |
;; | SPC            | Info-scroll-up                 |
;; | S-SPC          | Info-scroll-down               |
;; | DEL            | Info-scroll-down               |
;; | u              | Info-up                        |
;; | ^              | Info-up                        |
;; | n              | Info-next                      |
;; | p              | Info-prev                      |
;; | i              | Info-index                     |
;; | ,              | Info-index-next                |
;; | -              | negative-argument              |
;; | .              | beginning-of-buffer            |
;; | b              | beginning-of-buffer            |
;; | e              | end-of-buffer                  |
;; | <              | Info-top-node                  |
;; | t              | Info-top-node                  |
;; | >              | Info-final-node                |
;; | [              | Info-backward-node             |
;; | ]              | Info-forward-node              |
;; | g              | Info-goto-node                 |
;; | ?              | Info-summary                   |
;; | H              | describe-mode                  |
;; | L              | Info-history                   |
;; | l              | Info-history-back              |
;; | r              | Info-history-forward           |
;; | <XF86Back>     | Info-history-back              |
;; | <XF86Forward>  | Info-history-forward           |
;; | S              | Info-search-case-sensitively   |
;; | T              | Info-toc                       |
;; | c              | Info-copy-current-node-name    |
;; | d              | Info-directory                 |
;; | f              | Info-follow-reference          |
;; | h              | Info-help                      |
;; | j              | bmkp-info-jump                 |
;; | s              | Info-search                    |
;; | w              | Info-copy-current-node-name    |
;; | <backtab>      | Info-prev-reference            |
;; | <follow-link>  | mouse-face                     |
;; | <mouse-2>      | Info-mouse-follow-nearest-node |
;; | <down-mouse-2> | ignore                         |
;; | <remap>        | Prefix                         |
;; | M-n            | clone-buffer                   |
