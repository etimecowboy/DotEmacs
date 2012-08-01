;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-02 Thu 02:03 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-cedet.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `cedet' programming settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/cedet-start ()
  "Start CEDET programming environment"
  (interactive)
  (require 'cedet)
  (revert-buffer)
  (menu-bar-mode 1))

;;;###autoload
(defun cedet-4-cc ()
  "CEDET settings for cc-mode"
  (require 'semantic-c)
  (setq semantic-c-obey-conditional-section-parsing-flag nil) ; ignore #if

  (when (executable-find "gcc") (semantic-gcc-setup))

  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        user-include-dirs)

  (dolist (file c-preprocessor-symbol-files)
    (when (file-exists-p file)
      (setq semantic-lex-c-preprocessor-symbol-file
            (append semantic-lex-c-preprocessor-symbol-file (list
    file)))))

  ;; (if window-system
  ;;     (define-key c-mode-base-map "\C-c " 'semantic-ia-complete-symbol-menu)
  ;;   (define-key c-mode-base-map "\C-c " 'semantic-ia-complete-symbol))
  ;; (define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)
  )

;;;###autoload
(defun cedet-settings ()
  "Settings for `cedet'."

  ;; semantic
  ;; (semantic-load-enable-minimum-features)
  (semantic-load-enable-code-helpers)
  ;; (semantic-load-enable-gaudy-code-helpers)
  ;; (semantic-load-enable-excessive-code-helpers)
  ;; (emantic-load-enable-semantic-debugging-helpers)
  (if window-system
      (semantic-load-enable-semantic-debugging-helpers)
    (progn
      (global-semantic-highlight-edits-mode -1)
      (global-semantic-show-unmatched-syntax-mode 1)
      (global-semantic-show-parser-state-mode 1)))
  (global-semantic-decoration-mode 1)
  ;; (semantic-idle-completions-mode 1)
  ;; (ignore-errors (semantic-load-enable-primary-exuberent-ctags-support))

  (require 'semantic-decorate-include)
  (semantic-toggle-decoration-style "semantic-tag-boundary" -1)

  ;;------------------------------------------------------------------
  ;; srecode, use yasnippet as my code template
  (global-srecode-minor-mode 1)

  ;;------------------------------------------------------------------
  ;; ede
  (global-ede-mode 1)
  (when (executable-find "global")
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    (setq ede-locate-setup-options
          '(ede-locate-global ede-locate-base)))

  ;;------------------------------------------------------------------
  ;; senator, included in
  ;; `semantic-load-enable-semantic-debugging-helpers'
  ;; (global-senator-minor-mode 1)

  ;;------------------------------------------------------------------
  ;; C/C++ related settings
  (cedet-4-cc)  ;; TODO: run it when major-mode is c-mode or c++-mode

  ;;------------------------------------------------------------------
  ;; NOTE: semantic-ia-fast-jump are replaced by `recent-jump.el'
  ;;   ;; (require 'semantic/bovine/el)
  ;;   ;; (require 'semantic/analyze/refs)      ; for semantic-ia-fast-jump
  ;;   (defadvice push-mark (around semantic-mru-bookmark activate)
  ;;     "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark'.
  ;; If `semantic-mru-bookmark-mode' is active, also push a tag onto
  ;; the mru bookmark stack."
  ;;     (semantic-mrub-push semantic-mru-bookmark-ring
  ;;                         (point)
  ;;                         'mark)
  ;;     ad-do-it)

  ;;   (defun semantic-ia-fast-jump-back ()
  ;;     (interactive)
  ;;     (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
  ;;         (error "Semantic Bookmark ring is currently empty"))
  ;;     (let* ((ring (oref semantic-mru-bookmark-ring ring))
  ;;            (alist (semantic-mrub-ring-to-assoc-list ring))
  ;;            (first (cdr (car alist))))
  ;;       ;; (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
  ;;       ;;     (setq first (cdr (car (cdr alist)))))
  ;;       (semantic-mrub-visit first)
  ;;       (ring-remove ring 0)))

  ;;   (defun semantic-ia-fast-jump-or-back (&optional back)
  ;;     (interactive "P")
  ;;     (if back
  ;;         (semantic-ia-fast-jump-back)
  ;;       (semantic-ia-fast-jump (point))))

  ;;   (defun semantic-ia-fast-jump-mouse (ev)
  ;;     "semantic-ia-fast-jump with a mouse click. EV is the mouse event."
  ;;     (interactive "e")
  ;;     (mouse-set-point ev)
  ;;     (semantic-ia-fast-jump (point)))
  ;;-----------------------------------------------------------------
  
  (when (and window-system
             (> emacs-major-version 21)
             (require 'semantic-tag-folding nil 'noerror))
    (global-semantic-tag-folding-mode 1))

  ;;------------------------------------------------------------------
  ;; ;; eassist
  ;; (when (try-require 'eassist )
  ;;   (setq eassist-header-switches
  ;;         '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
  ;;           ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
  ;;           ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
  ;;           ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
  ;;           ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
  ;;           ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
  ;;           ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
  ;;           ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
  ;;           ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
  ;;           ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
  ;;           ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
  ;;           ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
  ;;           ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
  ;;           ("c" . ("h"))
  ;;           ("m" . ("h"))
  ;;           ("mm" . ("h")))))

  ;;------------------------------------------------------------------
  ;; speedbar
  (if window-system
      (setq speedbar-use-images t)
    (setq speedbar-use-images nil))
  (setq speedbar-track-mouse-flag nil
        speedbar-update-flag nil
        speedbar-show-unknown-files t
        speedbar-directory-unshown-regexp
        "^\\(CVS\\|RCS\\|SCCS\\|_darcs\\|\\.\\(git\\|hg\\|svn\\)\\)\\'")
  (eval-after-load 'speedbar
    '(progn
       ;; some dired-like bindings
       (define-key speedbar-key-map (kbd ";") 'speedbar-up-directory)
       (define-key speedbar-key-map (kbd "f") 'speedbar-edit-line)))

  ;;------------------------------------------------------------------
  ;; pulse
  (require 'pulse)

  ;;------------------------------------------------------------------
  ;; zjl-hl, use semantic to highlight functions
  ;; (zjl-hl-enable-global-all-modes)
  ;; (require 'zjl-hl)

  ;;------------------------------------------------------------------
  ;; REF: http://wuyang.yangsheep.net/#sec-2-2-1-17造成emacs卡住的最大
  ;; 嫌疑人是cedet这个扩展，它会在auto-save-hook上面挂东西。我曾经试过
  ;; 关闭auto save，发现也不管用。一个粗暴但有效的解决办法是在加载
  ;; cedet之后强行把auto-save-hook清空：
  (setq auto-save-hook nil)

  (message "* ---[ cedet configuration is complete ]---"))

(provide 'xy-rc-cedet)

;; if want to use offical cedet
;; (let ((cedet-possible-dirs
;;        '((concat my-local-lisp-path "/cedet-1.0pre6")
;;          (concat my-local-lisp-path "/cedet-1.0pre7")
;;          (concat my-local-lisp-path "/cedet-1.0"))))
;;   (dolist (dir cedet-possible-dirs)
;;     (let ((default-directory (expand-file-name dir)))
;;       (when (file-exists-p default-directory)
;;         (add-to-list 'load-path default-directory)
;;         (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;             (normal-top-level-add-subdirs-to-load-path))))))

;; (when (and (or (not (boundp 'semantic-mode))
;;                (and (boundp 'semantic-mode) (null semantic-mode)))
;;            (locate-library "semantic-ctxt") ; offical cedet
;;            (require 'cedet nil 'noerror))
