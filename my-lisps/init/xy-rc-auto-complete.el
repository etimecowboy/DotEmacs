;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:24 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-auto-complete.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `auto-complete.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun xy/ac-start ()
  "Start auto-complete"
  (interactive)
  (require 'yasnippet)
  (require 'auto-complete)
  ;; (require 'patch_yas0.7+ac1.4)
  ;; (ac-config-default)
  (yas/global-mode 1)
  (global-auto-complete-mode 1))

;;;###autoload
(defun auto-complete-settings ()
  "Settings for `auto-complete'."

  (require 'auto-complete-config)
  ;; (require 'auto-complete+)
  (require 'auto-complete-extension)
  (require 'auto-complete-etags)
  (require 'ac-dabbrev)
  ;; (require 'patch_yas0.7+ac1.4)

  (add-to-list 'ac-dictionary-directories
               (concat my-emacs-path "/auto-complete/ac-dict"))

  (add-to-list 'ac-dictionary-files "~/emacs/auto-complete/dict")

  (setq ac-use-comphist t)
  (setq ac-comphist-file
        (concat my-emacs-path "/auto-complete/ac-comphist"))
  (unless (file-exists-p ac-comphist-file)
    (shell-command (concat "touch " ac-comphist-file)))

  (setq ac-auto-show-menu t
        ac-auto-start t
        ac-dwim t
        ac-candidate-limit ac-menu-height
        ac-use-quick-help t
        ac-quick-help-delay 5.0
        ac-disable-faces nil)

  ;; (setq help-xref-following nil)

  (define-key ac-mode-map  [(control tab)] 'auto-complete)
  ;; (define-key ac-mode-map  [tab] 'auto-complete)
  ;; (ac-set-trigger-key "TAB")
  ;;--------------------------------------------------------------------------
  ;; ac setup for all modes
  ;; (defun my-ac-common-setup ()
  ;; ;(add-to-list 'ac-sources 'ac-source-filename)
  ;;   (setq ac-sources
  ;;         '(ac-source-semantic ;;-raw
  ;;           ac-source-yasnippet
  ;;           ac-source-dictionary
  ;;           ac-source-dabbrev
  ;;           ac-source-abbrev
  ;;           ac-source-words-in-buffer
  ;;           ac-source-words-in-same-mode-buffers
  ;;           ac-source-imenu
  ;;           ac-source-files-in-current-dir
  ;;           ac-source-filename)))

  ;; (add-hook 'auto-complete-mode-hook 'my-ac-common-setup)

  ;; ;; NOTE: can be also set via setting `ac-source' default value.
  (setq-default ac-sources
                '(ac-source-yasnippet
                  ;; ac-new-yas-source ;; Fix errors of yas source
                  ac-source-semantic ;;-raw
                  ac-source-dictionary
                  ac-source-dabbrev
                  ac-source-abbrev
                  ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-imenu
                  ac-source-files-in-current-dir
                  ac-source-filename))

  ;;------------------------------------------------------------------
  ;; emacs-lisp mode settings
  (defun my-ac-emacs-lisp-mode-setup ()
    (setq ac-sources
          (append '(ac-source-features ac-source-functions
                                       ac-source-variables
                                       ac-source-symbols)
                                       ;; ac-new-yas-source)
                  ac-sources)))

  (add-hook 'emacs-lisp-mode-hook 'my-ac-emacs-lisp-mode-setup)
 ;;-----------------------------------------------------------------------------
  ;; cc mode settings
  ;; Clang
  ;; The AC sources for Clang. Combine the power of AC, `Clang' and
  ;; `Yasnippet'.
  (require 'auto-complete-clang)
  (defun my-ac-cc-mode-setup ()
    (setq ac-sources
          (append 'ac-source-clang
                  ac-sources)))

  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'cc-mode-hook 'my-ac-cc-mode-setup)

  ;;------------------------------------------------------------------
  ;; text mode settings
  (add-to-list 'ac-modes 'text-mode)
  ;; (defun my-ac-text-mode-setup ()
  ;;   (setq ac-sources
  ;;         '(ac-source-semantic ;;-raw
  ;;           ac-source-yasnippet
  ;;           ;; ac-new-yas-source
  ;;           ac-source-dictionary
  ;;           ac-source-dabbrev
  ;;           ac-source-abbrev
  ;;           ac-source-words-in-buffer
  ;;           ac-source-words-in-same-mode-buffers
  ;;           ac-source-imenu
  ;;           ac-source-files-in-current-dir
  ;;           ac-source-filename)))
  ;; (add-hook 'text-mode-hook 'my-ac-text-mode-setup)
  ;; (ac-flyspell-workaround)
 ;;---------------------------------------------------------------------------
  ;; latex mode settings
  (add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of latex-mode
  (add-to-list 'ac-modes 'LaTeX-mode)   ; make auto-complete aware of latex-mode
  ;; ac-math:
  ;; provides three sources, one for LaTeX command completion, one for
  ;; LaTeX math symbols and the another one for Unicode input of math
  ;; characters.
  ;; REF: (@url :file-name "http://code.google.com/p/ac-math/" :display "Official website")
  (require 'ac-math)

  (defun my-ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
    (setq ac-sources
          (append '(ac-source-math-unicode ac-source-math-latex
                                           ac-source-latex-commands)
                  ac-sources)))

  (add-hook 'latex-mode-hook 'my-ac-latex-mode-setup)
  (add-hook 'LaTeX-mode-hook 'my-ac-latex-mode-setup)

  ;;------------------------------------------------------------------
  ;; org mode settings

  (add-to-list 'ac-modes 'org-mode)   ; make auto-complete aware of latex-mode

  (defun my-ac-org-mode-setup ()         ; add ac-sources to default ac-sources
    (setq ac-sources
          (append '(ac-source-math-unicode ac-source-math-latex
                                           ac-source-latex-commands)
                  ac-sources)))

  (add-hook 'org-mode-hook 'my-ac-org-mode-setup)

  (message "* ---[ auto-complete configuration is complete ]---"))

(provide 'xy-rc-auto-complete)

;; ;; (defalias ac-modes ac+-modes)

;; (defun ac-settings-4-cc ()
;;     "`auto-complete' settings for `cc-mode'."
;;     (dolist (command `(c-electric-backspace
;;                        c-electric-backspace-kill))
;;       (add-to-list 'ac-trigger-commands-on-completing command)))

;; (defun ac-settings-4-c ()
;;     (setq ac-sources
;;           '(ac-source-yasnippet
;;             ac-source-dictionary
;;             ac-source-semantic
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-files-in-current-dir
;;             ac-source-filename)))

;; (defun ac-settings-4-cpp ()
;;     (setq ac-sources
;;           '(ac-source-yasnippet
;;             ac-source-dictionary
;;             ac-source-semantic
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-files-in-current-dir
;;             ac-source-filename)))

;; (defun ac-settings-4-autopair ()
;;     "`auto-complete' settings for `autopair'."
;;     (defun ac-trigger-command-p (command)
;;       "Return non-nil if `this-command' is a trigger command."
;;       (or
;;        (and
;;         (symbolp command)
;;         (or (memq command ac-trigger-commands)
;;             (string-match "self-insert-command" (symbol-name command))
;;             (string-match "electric" (symbol-name command))
;;             (let* ((autopair-emulation-alist nil)
;;                    (key (this-single-command-keys))
;;                    (beyond-autopair
;;                     (or (key-binding key)
;;                         (key-binding
;;                          (lookup-key local-function-key-map key)))))
;;               (or
;;                (memq beyond-autopair ac-trigger-commands)
;;                (and ac-completing
;;                     (memq beyond-autopair
;;                           ac-trigger-commands-on-completing)))))))))

;; (defun ac-settings-4-lisp ()
;;     "Auto complete settings for lisp mode."

;;     (require 'auto-complete+)
;;     (setq ac-omni-completion-sources
;;           '(("\\<featurep\s+'" ac+-source-elisp-features)
;;             ("\\<require\s+'"  ac+-source-elisp-features)
;;             ("\\<load\s+\""    ac-source-emacs-lisp-features)))
;;     ;; (ac+-apply-source-elisp-faces)
;;     (setq ac-sources
;;           '(ac-source-features
;;             ac-source-functions
;;             ac-source-yasnippet
;;             ac-source-variables
;;             ac-source-symbols
;;             ac-source-dictionary
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-files-in-current-dir
;;             ac-source-filename
;;             ac-source-words-in-same-mode-buffers)))

;; (defun ac-settings-4-java ()
;;     (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
;;                                            (cons "->" '(ac-source-semantic))))
;;     (setq ac-sources
;;           '(ac-source-semantic
;;             ac-source-yasnippet
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-files-in-current-dir
;;             ac-source-filename)))

;; (defun ac-settings-4-text ()
;;     (setq ac-sources
;;           '(ac-source-yasnippet
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-imenu)))

;; (defun ac-settings-4-org ()
;;     (setq ac-sources
;;           '(ac-source-yasnippet
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-imenu)))

;; (defun ac-settings-4-eshell ()
;;     (setq ac-sources
;;           '(ac-source-yasnippet
;;             ac-source-abbrev
;;             ac-source-words-in-buffer
;;             ac-source-words-in-same-mode-buffers
;;             ac-source-files-in-current-dir
;;             ac-source-filename
;;             ac-source-symbols
;;             ac-source-imenu)))

;; ;; ;;;###autoload
;; ;; (defun ac-settings-4-ruby ()
;; ;;   (require 'rcodetools-settings)
;; ;;   (setq ac-omni-completion-sources
;; ;;         (list (cons "\\." '(ac-source-rcodetools))
;; ;;               (cons "::" '(ac-source-rcodetools)))))

;; ;; ;;;###autoload
;; ;; (defun ac-settings-4-html ()
;; ;;   (setq ac-sources
;; ;;         '(ac-source-yasnippet
;; ;;           ac-source-abbrev
;; ;;           ac-source-words-in-buffer
;; ;;           ac-source-words-in-same-mode-buffers
;; ;;           ac-source-files-in-current-dir
;; ;;           ac-source-filename)))

;; ;; ;;;###autoload
;; ;; (defun ac-settings-4-tcl ()
;; ;;   (setq ac-sources
;; ;;         '(ac-source-yasnippet
;; ;;           ac-source-abbrev
;; ;;           ac-source-words-in-buffer
;; ;;           ac-source-words-in-same-mode-buffers
;; ;;           ac-source-files-in-current-dir
;; ;;           ac-source-filename)))

;; ;; ;;;###autoload
;; ;; (defun ac-settings-4-awk ()
;; ;;   (setq ac-sources
;; ;;         '(ac-source-yasnippet
;; ;;           ac-source-abbrev
;; ;;           ac-source-words-in-buffer
;; ;;           ac-source-words-in-same-mode-buffers
;; ;;           ac-source-files-in-current-dir
;; ;;           ac-source-filename)))

;; (defun ac-start-use-sources (sources)
;;     (interactive)
;;     (let ((ac-sources sources))
;;       (call-interactively 'xy/ac-start)))

;; (eval-after-load "cc-mode"
;;   '(progn
;;     (ac-settings-4-cc)))
;; (eval-after-load "autopair"
;;   '(progn
;;     (ac-settings-4-autopair)))
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;    svn-log-edit-mode-hook change-log-mode-hook)
;;  'ac-settings-4-lisp)
;; (apply-args-list-to-fun
;;  (lambda (hook fun)
;;    (am-add-hooks hook fun))
;;  `(('java-mode-hook   'ac-settings-4-java)
;;    ('c-mode-hook      'ac-settings-4-c)
;;    ('c++-mode-hook    'ac-settings-4-cpp)
;;    ('text-mode-hook   'ac-settings-4-text)
;;    ('org-mode-hook    'ac-settings-4-org)
;;    ('eshell-mode-hook 'ac-settings-4-eshell)
;;    ;; ('ruby-mode-hook   'ac-settings-4-ruby)
;;    ;; ('html-mode-hook   'ac-settings-4-html)
;;    ;; ('awk-mode-hook    'ac-settings-4-awk)
;;    ;; ('tcl-mode-hook    'ac-settings-4-tcl)
;;    ))
;; (eal-eval-by-modes
;;  ac-modes
;;  (lambda (mode)
;;    (let ((mode-name (symbol-name mode)))
;;      (when (and (intern-soft mode-name)
;;                 (intern-soft (concat mode-name "-map")))
;;        (define-key (symbol-value (am-intern mode-name "-map"))
;;           (kbd "C-c A") 'xy/ac-start)))))

;;-----------------------------------------------------------------------------
;; ;; ac-company
;; ;; NOTE: NOT working
;; ;; Use Company Backends for Auto-Complete.
;; (require 'ac-company)

;; ;; For example, if you want to use company-elisp for auto-complete
;; (defun ac-company-setup ()
;;     (require 'company)
;;     (require 'company-elisp)
;;     (ac-company-define-source ac-source-company-elisp
;;                               company-elisp (symbol . "s"))
;;     (setq ac-sources
;;           (append '(ac-source-company-elisp)
;;                   ac-sources)))

;; (add-hook 'emacs-lisp-mode-hook
;;             'ac-source-company-setup)

;; ;; (ac-company-define-source ac-source-company-elisp company-elisp)
;; ;; (add-hook 'emacs-lisp-mode-hook
;; ;;        (lambda ()
;; ;;          (add-to-list 'ac-sources 'ac-source-company-elisp)))
