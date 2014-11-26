;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-11-27 Thu 00:28 by xin on vmdebian.xyang.com>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-complete.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Various abbrevations and auto-completion
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(eval-when-compile (require 'cl))
(require 'xy-rc-utils)
(require 'eval-after-load)


;;* Mini buffer auto complete

;; an do stuff like M-x q-r-r TAB, and it expands to
;; query-replace-regexp.
;; (unless is-after-emacs-23
;;   (partial-completion-mode 1))
;; (partial-completion-mode 1) ;; BUG: Emacs24



;;** ido
;; interactively do things with buffers and files
;; NOTE: From Emacs-22 it is a part of Emacs
;; (if is-before-emacs-21
;;     (require 'ido "ido-for-21"))
;; (add-hook 'after-init-hook 'xy/ido-start)
(eval-after-load 'ido
  '(progn
     (ido-postload)))
     ;; (eal-define-keys
     ;;  'ido-mode-map
     ;;  `(("M-."   ido-next-match-dir)
     ;;    ("M-,"   ido-prev-match-dir)
     ;;    ("C-h"   ido-delete-backward-updir)
     ;;    ("M-h"   ido-up-directory)
     ;;    ("M-S-h"   ido-up-directory-clean-text)
     ;;    ("C-M-h" ido-goto-home)
     ;;    ("C-r"   ido-goto-root)
     ;;    ("C-u"   ido-clean-text)
     ;;    ("M-b"   backward-word)
     ;;    ("C-w"   ido-delete-backward-word-updir)
     ;;    ;; ("C-v"   ido-enter-svn-status-hide)
     ;;    ("C-n"   ido-next-match)
     ;;    ("C-p"   ido-prev-match)))))



;;** icomplete
;; minibuffer中输入部分命令就可以使用补全
;; NOTE: Use smex instead
;; (eval-after-load "icomplete"
;;   '(progn
;;     (icomplete-postload)))

;;     (eal-define-keys
;;      'completion-list-mode-map
;;      `(("SPC" scroll-up)
;;        ("u"   scroll-down)
;;        ("n"   next-completion)
;;        ("p"   previous-completion)
;;        ("<"   beginning-of-buffer)
;;        (">"   end-of-buffer)
;;        ("."   set-mark-command)
;;        ("'"   switch-to-other-buffer)
;;        ("L"   count-brf-lines)))
;;     (define-key minibuffer-local-completion-map (kbd "SPC")
;;       'minibuffer-complete-word)))
;; (icomplete-mode 1)



;;** smex
;; Smex is a M-x enhancement for Emacs. Built on top of Ido, it
;; provides a convenient interface to your recently and most
;; frequently used commands. And to all the other commands, too.
;; REF: (@url :file-name "https://github.com/nonsequitur/smex" :display "Source")
(eval-after-load 'smex
  '(progn
     (smex-postload)
     ;; (eal-define-keys-commonly
     ;;  global-map
     ;;  `(("M-x" smex)
     ;;    ("M-S-x" smex-major-mode-commands)
     ;;    ("C-c M-x" execute-extended-command)))
      ))



;;** ido+smex
;; Use both ido and smex
;; NOTE: NEVER use both icy-mode and ido/smex. They are different in
;;       the way of using minibuffer, and conflicts with each other.
;;;###autoload
(defun xy/ido+smex-start ()
  "Start ido and smex completion."
  (interactive)
  (when (featurep 'icicles)
    (icy-mode -1))
  (require 'ido)
  (ido-mode 1)
  ;; `ido-ubiquitous.el'
  (when (try-require 'ido-ubiquitous)
    (ido-ubiquitous-mode 1))
  ;; `idomenu.el'
  ;; (autoload 'idomenu "idomenu" nil t)
  ;; (global-set-key (kbd "<f10>") 'idomenu)
  ;; `ido-yes-or-no.el'
  (try-require 'ido-yes-or-no)
  ;; `fix-ido'
  (when (try-require 'flx-ido)
    (flx-ido-mode 1))
  (require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  )

  ;; (smex-initialize-ido)) ;; BUG: `smex-initialize-ido' cause error
  ;;                        ;; in Emacs 23.2, but OK in 23.3
;; (global-set-key (kbd "<f6> D") 'xy/ido+smex-start)
;; (Windows ;; BUG: not work in Linux. Why? --Answer: The
;;          ;;      `smex-save-file' cannot be automatically created in
;;          ;;      Linux. Fixed by manually create it.
;;          ;; NOTE: Use this combination to reduce system load in Windows?
;;   (add-hook 'after-init-hook 'xy/ido+smex-start))
(add-hook 'after-init-hook 'xy/ido+smex-start)



;;** ido+icomplete
;; Use both ido and icomplete
;;;###autoload
;; (defun xy/ido+icomplete-start ()
;;   "Start ido and icomplete completion."
;;   (interactive)
;;   (when (featurep 'icicles)
;;     (icy-mode -1))
;;   (require 'ido)
;;   (ido-mode 1)
;;   (require 'icomplete)
;;   (icomplete-mode 1))
;; (global-set-key (kbd "<f6> D") 'xy/ido+icomplete-start)



;;* Buffer auto complete

;;** Internal Emacs content auto complete system
(setq-default abbrev-mode 1)
(setq save-abbrevs nil)



;;** hippie-expand
;; (global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'my-ido-hippie-expand)
(global-set-key (kbd "M-|") 'my-ido-hippie-expand-filename) ;;ywb-hippie-expand-filename)
(eval-after-load "hippie-exp" '(hippie-expand-postload))



;;** skeleton-complete-mode
;; SOURCE: (@url :file-name "https://github.com/baohaojun/skeleton-complete" :display "GitHub")
;; NOTE:
;; (define-key skeleton-complete-mode-map (kbd "M-g <return>") 'skeleton-expand-symbols)
;; (define-key skeleton-complete-mode-map (kbd "M-s <return>") 'skeleton-expand-partial-lines)
;; (define-key skeleton-complete-mode-map (kbd "M-g x") 'skeleton-expand-partial-lines)
;; (define-key skeleton-complete-mode-map (kbd "M-s l") 'skeleton-expand-lines)
;; (define-key skeleton-complete-mode-map (kbd "M-s s") 'skeleton-expand-sexp)
;; (define-key skeleton-complete-mode-map (kbd "M-s p") 'skeleton-expand-paragraph)
;; TODO: add a submodule for this project when it is stable.
;; BUG: minor mode is not registered.
;; (when (try-require 'skeleton-complete)
;;   (skeleton-complete-global-mode 1))



;;** auto-complete settings
;; BUG: 不能与emacswiki上的`thingatpt+.el'同时使用，否则auto-complete
;; 不能正确工作。
;; NOTE: switch to `company' 
;; (eval-after-load "auto-complete"
;;   '(progn
;;      (auto-complete-postload)
;;      ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;;      ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;;      ;; 必须要干掉补全菜单, 很麻烦, 用C-j来执行`ac-complete'
;;      (eal-define-keys
;;       'ac-complete-mode-map
;;       `(("<return>"   nil)
;;         ;; ("<space>"    nil)
;;         ("<left>"     nil)
;;         ("<right>"    nil)
;;         ("<up>"       nil)
;;         ("<down>"     nil)
;;         ("C-n"        ac-next)
;;         ("M-n"        ac-next)
;;         ("C-p"        ac-previous)
;;         ("M-p"        ac-previous)
;;         ("<tab>"      auto-complete)
;;         ("C-<tab>"    auto-complete)))))



;;** company settings
;; It is a modular in-buffer completion mechanism.
;;(autoload 'company-mode "company-postload" nil t)
(eval-after-load "company"
  '(progn
     (company-postload)
     (eal-define-keys 'company-mode-map
                      `(("C-<tab>"     company-complete)
                        ("C-c C-<tab>" company-yasnippet)
                        ))))

;; (am-add-hooks
;;  `(c-mode-common-hook lisp-mode-hook emacs-lisp-mode-hook
;;    java-mode-hook lisp-interaction-mode-hook sh-mode-hook
;;   ,(if (not is-before-emacs-21) 'awk-mode-hook) ruby-mode-hook)
;;   'company-mode)



;;** pabbrev
;; REF: (@url :file-name "http://www.emacswiki.org/emacs/PredictiveAbbreviation" :display "Emacswiki page")
;; BUG: NOT work very well.
;; (require 'pabbrev)
;; (require 'popup)

;; (defun pabbrevx-suggestions-goto-buffer (suggestions)
;;   (let* ((candidates (mapcar 'car suggestions))
;;          (bounds (pabbrev-bounds-of-thing-at-point))
;;          (selection (popup-menu* candidates
;;                                  :point (car bounds)
;;                                  :scroll-bar t)))
;;     (when selection
;;       ;; modified version of pabbrev-suggestions-insert
;;       (let ((point))
;;         (save-excursion
;;           (progn
;;             (delete-region (car bounds) (cdr bounds))
;;             (insert selection)
;;             (setq point (point))))
;;         (if point
;;             (goto-char point))
;;         ;; need to nil this so pabbrev-expand-maybe-full won't try
;;         ;; pabbrev expansion if user hits another TAB after ac aborts
;;         (setq pabbrev-last-expansion-suggestions nil)
;;         ))))

;; (fset 'pabbrev-suggestions-goto-buffer
;;       'pabbrevx-suggestions-goto-buffer)

;; (define-key pabbrev-mode-map "\t" 'pabbrev-expand-maybe)
;; (define-key pabbrev-mode-map [tab] 'pabbrev-expand-maybe)



;;** predictive completion
;; A minor-mode exploits the redundancy inherent in languages in order
;; to complete words you are typing before you've finished typing them
;; NOTE: makes emacs too slow!
;; (autoload 'predictive-mode "predictive" nil t)
;; (autoload 'global-predictive-mode "predictive" nil t)
;; (eval-after-load "predictive"
;;   '(progn
;;      (predictive-postload)))
;; (am-add-hooks
;;  `(org-mode-hook latex-mode-hook LaTeX-mode-hook)
;;  '(lambda ()
;;     (predictive-mode 1)))



;;** template settings
;; (require 'template)
;; (eal-define-keys
;;  '(emacs-lisp-mode-map c-mode-base-map makefile-mode-map
;;    makefile-automake-mode-map sh-mode-map text-mode-map)
;;  `(("C-c T" my-template-expand-template)
;;    ("C-c C-t" template-expand-template)))
;; (eval-after-load "template"
;;   '(progn (template-postload)))
;; (template-initialize)



;;** auto-insert
;; 用template, 自动插入一些文件模板
;; (eval-after-load "autoinsert" '(auto-insert-postload))
;; (auto-insert-mode 1)



;** yasnippet
(autoload 'yas-minor-mode "yasnippet" nil t)
(eval-after-load "yasnippet"
  '(progn
     (yasnippet-postload)
     ;; NOTE: tab is widely-used by ido/icicles/org/indent/outline/hideshow
     ;; (eal-define-keys
     ;;  'yas-minor-mode-map
     ;;  `(;; ("<tab>"   nil)
     ;;    ("M-j"     yas-next-field-or-maybe-expand)
     ;;    ("M-k"     yas-prev-field)))
     (eal-define-keys
      'yas-minor-mode-map
      `(("C-c C-f" yas-visit-snippet-file)
        ("C-c C-r" yas-tryout-snippet)
        ("C-c c-d" yas-describe-table)))))
;; NOTE: manually start it when required.
;; NOTE: use with `auto-complete' would be nice! (no need to remember
;; the trigger keys)

(eal-define-keys-commonly
 global-map
 `(("<f6> y"         'yas-minor-mode)
   ("C-x Y n"        'yas-new-snippet)
   ))

;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   c-common-mode-hook sh-mode-hook matlab-mode-hook
;;                   vhdl-mode-hook verilog-mode-hook
;;                   org-mode-hook LaTeX-mode-hook)
;;  '(lambda () (yas-minor-mode 1)))



;;** Start auto-complete and yasnippet together
;; (defun xy/toggle-ac-mode-with-yas ()
;;   "Start auto-complete"
;;   (interactive)
;;   (when (try-require 'yasnippet)
;;     (yas-minor-mode))
;;   (when (try-require 'auto-complete)
;;     ;; (require 'patch_yas0.7+ac1.4) ;; old patch
;;     ;; (ac-config-default)
;;     (auto-complete-mode)))

(defun xy/toggle-company+yas ()
  "Start auto-complete"
  (interactive)
  (when (try-require 'yasnippet)
    (yas-minor-mode))
  (when (try-require 'company)
    (company-mode)))

;; (global-set-key (kbd "<f6> a") 'xy/toggle-ac-mode-with-yas)
(global-set-key (kbd "<f6> a") 'xy/toggle-company+yas)



;;* icicles
;; System-wide completion
;; NOTE: too heavy for Emacs
;; (eval-after-load "icicles" '(icicles-postload))
;; ;; (add-hook 'after-init-hook 'icy-mode)
;; (global-set-key (kbd "<f2> i") 'xy/icy-start)



;;** apropos-mode
;; (with icicles?) completion
;; (eval-after-load "apropos"
;;   '(progn
;;      ;; (apropos-postload)
;;      (eal-define-keys
;;       'apropos-mode-map
;;       `(("u" scroll-down)
;;         ("1" delete-other-windows)
;;         ("n" forward-button)
;;         ("p" backward-button)))))



;;* anything
;; NOTE: replaced by helm
;; Quicksilver for Emacs
;; (eval-after-load 'anything '(anything-postload))
;; (global-set-key (kbd "C-c i") 'xy/my-anything)



;;* helm
;; NOTE: helm is not used
;; (eval-after-load 'helm '(helm-postload))
;; ;; TODO: make my own helm setup and bind it to C-c i
;; ;; (global-set-key (kbd "C-c i") 'helm-mini)
;; (global-set-key (kbd "<f6> A") 'helm-mode)



(provide 'xy-rcroot-complete)
