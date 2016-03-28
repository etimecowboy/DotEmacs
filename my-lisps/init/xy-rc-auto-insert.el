;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:27 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-insert.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-insert.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;; NOTE: ahei's setttings
;; ;;;###autoload
;; (defun auto-insert-postload ()
;;   "Settings for `auto-insert' after it's been loaded."
;;   (setq auto-insert-query nil)
;;   (setq auto-insert-directory ;; my-emacs-templates-path)
;;         (list (concat my-emacs-path "/template/templates")))
;;           ;; (concat (my-emacs-path "/template/templates")))
;;   (define-auto-insert "build.properties" "build.properties.tpl")

;;   (defun expand-template (template)
;;     "Expand template."
;;     (template-expand-template ;; (concat my-emacs-templates-path template)))
;;             (concat (my-emacs-path "template/templates/temp"))))
;;   ;; (define-auto-insert
;;   ;;   '("\\.\\([Hh]\\|hh\\|hxx\\|hpp\\)$" . "C/C++ header")
;;   ;;   (lambda ()
;;   ;;     (expand-template "h.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.c$" . "C")
;;   ;;   (lambda ()
;;   ;;     (expand-template "c.tpl")))
;;   ;; (define-auto-insert
;;   ;;   '("\\.cpp$" . "Cpp")
;;   ;;   (lambda ()
;;   ;;     (expand-template "cpp.tpl")))

;;   (defun insert-headx-snippet ()
;;     "Insert headx snippet."
;;     (insert-snippet "headx"))

;;   (defun insert-abbrev (abbrev-name)
;;     "Insert abbrev ABBREV-NAME"
;;     (interactive "s")
;;     (insert abbrev-name)
;;     (expand-abbrev))

;;   (defun insert-snippet (snippet)
;;     "Insert snippet SNIPPET."
;;     (interactive "s")
;;     (insert snippet)
;;     (yas/expand))

;;   (mapc
;;    (lambda (suffix)
;;      (define-auto-insert (concat "\\." suffix "$") 'insert-headx-snippet))
;;    '("el" "sh" "org" "pl" "py" "htm\\(l\\)?")))

;;---------------------------------------------------------

;; NOTE: meteror's settings
;; ;; autoinsert
;; (auto-insert-mode 1)
;; ;; (setq auto-insert t)
;; ;; (setq auto-insert-query nil)
;; (setq auto-insert-directory
;;       (file-name-as-directory
;;        (expand-file-name "etc/templates"
;;                          (file-name-directory (or buffer-file-name
;;                                                   load-file-name)))))
;; (setq auto-insert-expansion-alist
;;       '(("(>>>DIR<<<)" . (file-name-directory buffer-file-name))
;;         ("(>>>FILE<<<)" . (file-name-nondirectory buffer-file-name))
;;         ("(>>>FILE_SANS<<<)" . (file-name-sans-extension
;;                                 (file-name-nondirectory buffer-file-name)))
;;         ("(>>>FILE_UPCASE<<<)" . (upcase
;;                                   (file-name-sans-extension
;;                                    (file-name-nondirectory buffer-file-name))))
;;         ("(>>>FILE_UPCASE_INIT<<<)" . (upcase-initials
;;                                        (file-name-sans-extension
;;                                         (file-name-nondirectory buffer-file-name))))
;;         ("(>>>FILE_EXT<<<)" . (file-name-extension buffer-file-name))
;;         ("(>>>FILE_EXT_UPCASE<<<)" . (upcase (file-name-extension buffer-file-name)))
;;         ("(>>>DATE<<<)" . (format-time-string "%d %b %Y"))
;;         ("(>>>TIME<<<)" . (format-time-string "%T"))
;;         ("(>>>VC_DATE<<<)" . (let ((ret ""))
;;                                (set-time-zone-rule "UTC")
;;                                (setq ret (format-time-string "%Y/%m/%d %T"))
;;                                (set-time-zone-rule nil)
;;                                ret))
;;         ("(>>>YEAR<<<)" . (format-time-string "%Y"))
;;         ("(>>>ISO_DATE<<<)" . (format-time-string "%Y-%m-%d"))
;;         ("(>>>AUTHOR<<<)" . (or user-mail-address
;;                                 (and (fboundp 'user-mail-address)
;;                                      (user-mail-address))
;;                                 (concat (user-login-name) "@" (system-name))))
;;         ("(>>>USER_NAME<<<)" . (or (and (boundp 'user-full-name)
;;                                         user-full-name)
;;                                    (user-full-name)))
;;         ("(>>>LOGIN_NAME<<<)" . (user-login-name))
;;         ("(>>>HOST_ADDR<<<)" . (or (and (boundp 'mail-host-address)
;;                                         (stringp mail-host-address)
;;                                         mail-host-address)
;;                                    (system-name)))))
;; (defun auto-insert-expand ()
;;   (dolist (val auto-insert-expansion-alist)
;;     (let ((from (car val))
;;           (to (eval (cdr val))))
;;       (goto-char (point-min))
;;       (replace-string from to))))
;; (define-auto-insert "\\.\\([Hh]\\|hh\\|hpp\\)\\'"
;;   ["h.tpl" auto-insert-expand])
;; (define-auto-insert "\\.\\([Cc]\\|cc\\|cpp\\)\\'"
;;   ["cpp.tpl" auto-insert-expand])
;; (define-auto-insert "\\.java\\'"
;;   ["java.tpl" auto-insert-expand])
;; (define-auto-insert "\\.py\\'"
;;   ["py.tpl" auto-insert-expand])


(provide 'xy-rc-auto-insert)
