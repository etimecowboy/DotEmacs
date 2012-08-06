;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:18 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-flymake.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `flymake.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun flymake-postload ()
  "Settings for `flymake' after it's been loaded."
  (setq flymake-allowed-file-name-masks '())
  (setq flymake-gui-warnings-enabled nil)
  (setq flymake-log-level 0)
  (setq flymake-no-changes-timeout 5.0)
  (setq flymake-master-file-dirs
        '("." "./src" "../src" "../../src"
          "./source" "../source" "../../source"
          "./Source" "../Source" "../../Source"
          "./test" "../test" "../../test"
          "./Test" "../Test" "../../Test"
          "./UnitTest" "../UnitTest" "../../UnitTest"))

  (defvar flymake-mode-map (make-sparse-keymap))

  (define-key flymake-mode-map
    (kbd "C-c <f4>") 'flymake-goto-next-error)
  (define-key flymake-mode-map
    (kbd "C-c <S-f4>") 'flymake-goto-prev-error)
  (define-key flymake-mode-map
    (kbd "C-c <C-f4>") 'flymake-display-err-menu-for-current-line)

  (or (assoc 'flymake-mode minor-mode-map-alist)
      (setq minor-mode-map-alist
            (cons (cons 'flymake-mode flymake-mode-map)
                  minor-mode-map-alist)))

  (defadvice flymake-goto-prev-error (after display activate)
    (message (get-char-property (point) 'help-echo)))
  (defadvice flymake-goto-next-error (after display activate)
    (message (get-char-property (point) 'help-echo)))

  (when (executable-find "pdflatex") ;; HACK: "texify")
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.tex\\'" flymake-simple-tex-init))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("[0-9]+\\.tex\\'"
                   flymake-master-tex-init flymake-master-cleanup)))

  (when (executable-find "xml")
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.xml\\'" flymake-xml-init))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.html?\\'" flymake-xml-init)))

  (when (executable-find "perl")
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.p[ml]\\'" flymake-perl-init)))

  (when (executable-find "php")
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.php[345]?\\'" flymake-php-init)))

  (when (executable-find "make")
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.idl\\'" flymake-simple-make-init))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.java\\'"
                   flymake-simple-make-java-init flymake-simple-java-cleanup))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.cs\\'" flymake-simple-make-init)))

  (defun flymake-elisp-init ()
    (if (string-match "^ " (buffer-name))
        nil
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list
         (expand-file-name invocation-name invocation-directory)
         (list
          "-Q" "--batch" "--eval"
          (prin1-to-string
           (quote
            (dolist (file command-line-args-left)
              (with-temp-buffer
                (insert-file-contents file)
                (emacs-lisp-mode)
                (condition-case data
                    (scan-sexps (point-min) (point-max))
                  (scan-error
                   (goto-char(nth 2 data))
                   (princ (format "%s:%s: error: Unmatched bracket or quote\n"
                                  file (line-number-at-pos)))))))))
          local-file)))))
  ;; (add-to-list 'flymake-allowed-file-name-masks '("\\.el$" flymake-elisp-init))
  ;; (add-hook 'write-file-functions (lambda nil
  ;; (when (eq major-mode 'emacs-lisp-mode)
  ;; (check-parens))))

  (defcustom flymake-shell-of-choice "sh"
    "Path of shell.")
  (defcustom flymake-shell-arguments
    (list "-n")
    "Shell arguments to invoke syntax checking.")
  (defun flymake-shell-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list flymake-shell-of-choice
            (append flymake-shell-arguments (list local-file)))))
  (when (executable-find flymake-shell-of-choice)
    (add-to-list 'flymake-allowed-file-name-masks '("\\.sh$" flymake-shell-init)))

  (when (executable-find "pyflakes")
    (defun flymake-pyflakes-init ()
      (let* ((args nil)
             (temp-file (ignore-errors (flymake-init-create-temp-buffer-copy
                                        'flymake-create-temp-inplace))))
        (if temp-file
            (let ((local-file (file-relative-name
                               temp-file
                               (file-name-directory buffer-file-name))))
              (setq args (list "pyflakes" (list local-file))))
          (flymake-report-fatal-status
           "TMPERR" (format "Can't create temp file")))
        args))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.py\\'" flymake-pyflakes-init)))

  (defvar flymake-makefile-filenames '("Makefile" "makefile" "GNUmakefile")
    "File names for make.")

  (defvar flymake-c-file-arguments
    '(("gcc" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
              "-I../.." "-I../../include" "-I../../inc"
              "-I../../common" "-I../../public"
              "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
      ("clang" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
                "-I../.." "-I../../include" "-I../../inc"
                "-I../../common" "-I../../public"
                "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
      ("cl" ("/I.." "/I../include" "/I../inc" "/I../common" "/I../public"
             "/I../.." "/I../../include" "/I../../inc"
             "/I../../common" "/I../../public"
             "/EHsc" "/W4" (concat "/Fo" (getenv "TEMP") "\\null.obj") "/c"))))

  (defvar flymake-cxx-file-arguments
    '(("g++" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
              "-I../.." "-I../../include" "-I../../inc"
              "-I../../common" "-I../../public"
              "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
      ("clang++" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
                  "-I../.." "-I../../include" "-I../../inc"
                  "-I../../common" "-I../../public"
                  "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
      ("cl" ("/I.." "/I../include" "/I../inc" "/I../common" "/I../public"
             "/I../.." "/I../../include" "/I../../inc"
             "/I../../common" "/I../../public"
             "/EHsc" "/W4" (concat "/Fo" (getenv "TEMP") "\\null.obj") "/c"))))

  (defun flymake-get-compile (arguments)
    (let ((compile nil))
      (while (and (not compile) arguments)
        (let ((arg (car arguments)))
          (if (executable-find (car arg))
              (setq compile arg)
            (setq arguments (cdr arguments)))))
      compile))

  (defun flymake-get-c-compile ()
    (flymake-get-compile flymake-c-file-arguments))

  (defun flymake-get-cxx-compile ()
    (flymake-get-compile flymake-cxx-file-arguments))

  (defun flymake-get-cc-cmdline (source base-dir)
    (let ((args nil)
          (compile (if (string= (file-name-extension source) "c")
                       (flymake-get-c-compile)
                     (flymake-get-cxx-compile))))
      (if compile
          (setq args (list (car compile)
                           (append (car (cdr compile)) (list source))))
        (flymake-report-fatal-status
         "NOMK" (format "No compile found for %s" source)))
      args))

  (defun flymake-init-find-makfile-dir (source-file-name)
    "Find Makefile, store its dir in buffer data and return its dir, if found."
    (let* ((source-dir (file-name-directory source-file-name))
           (buildfile-dir nil))
      (catch 'found
        (dolist (makefile flymake-makefile-filenames)
          (let ((found-dir (flymake-find-buildfile makefile source-dir)))
            (when found-dir
              (setq buildfile-dir found-dir)
              (setq flymake-base-dir buildfile-dir)
              (throw 'found t)))))
      buildfile-dir))

  (defun flymake-simple-make-cc-init-impl (create-temp-f
                                           use-relative-base-dir
                                           use-relative-source)
    "Create syntax check command line for a directly checked source file.
Use CREATE-TEMP-F for creating temp copy."
    (let* ((args nil)
           (source-file-name buffer-file-name)
           (source-dir (file-name-directory source-file-name))
           (buildfile-dir
            (and (executable-find "make")
                 (flymake-init-find-makfile-dir source-file-name)))
           (temp-source-file-name
            (ignore-errors
              (flymake-init-create-temp-buffer-copy create-temp-f))))
      (if temp-source-file-name
          (setq args
                (flymake-get-syntax-check-program-args
                 temp-source-file-name
                 (if buildfile-dir buildfile-dir source-dir)
                 use-relative-base-dir
                 use-relative-source
                 (if buildfile-dir
                     'flymake-get-make-cmdline
                   'flymake-get-cc-cmdline)))
        (flymake-report-fatal-status
         "TMPERR" (format "Can't create temp file for %s" source-file-name)))
      args))

  (defun flymake-simple-make-cc-init ()
    (flymake-simple-make-cc-init-impl 'flymake-create-temp-inplace t t))

  (defun flymake-master-make-cc-init (get-incl-dirs-f
                                      master-file-masks
                                      include-regexp)
    "Create make command line for a source file
checked via master file compilation."
    (let* ((args nil)
           (temp-master-file-name
            (ignore-errors
              (flymake-init-create-temp-source-and-master-buffer-copy
               get-incl-dirs-f
               'flymake-create-temp-inplace
               master-file-masks
               include-regexp))))
      (if temp-master-file-name
          (let* ((source-file-name buffer-file-name)
                 (source-dir (file-name-directory source-file-name))
                 (buildfile-dir
                  (and (executable-find "make")
                       (flymake-init-find-makfile-dir temp-master-file-name))))
            (setq args (flymake-get-syntax-check-program-args
                        temp-master-file-name
                        (if buildfile-dir buildfile-dir source-dir)
                        nil
                        nil
                        (if buildfile-dir
                            'flymake-get-make-cmdline
                          'flymake-get-cc-cmdline))))
        (flymake-report-fatal-status
         "TMPERR" (format "Can't create temp file for %s" source-file-name)))
      args))

  (defun flymake-master-make-cc-header-init ()
    (flymake-master-make-cc-init
     'flymake-get-include-dirs
     '("\\.cpp\\'" "\\.c\\'")
     "[ \t]*#[ \t]*include[ \t]*\"\\([[:word:]0-9/\\_.]*%s\\)\""))

  (when (or (executable-find "make")
            (flymake-get-c-compile)
            (flymake-get-cxx-compile))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.\\(?:h\\(?:pp\\)?\\)\\'"
                   flymake-master-make-cc-header-init flymake-master-cleanup))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
                   flymake-simple-make-cc-init)))

  ;; TeX
  ;; (defun flymake-get-tex-args (file-name)
  ;;   ;;(list "latex" (list "-c-style-errors" file-name))
  ;;   ;;(list "pdflatex" (list "-file-line-error" "-draftmode" "-
  ;;   interaction=nonstopmode" file-name)))

  ;; (list "xelatex" (list "-file-line-error" "-draftmode"
  ;;  "-interaction=nonstopmode"
  ;; file-name))

  (message "* ---[ flymake post-load configuration is complete ]---")
)


;; ahei's settings
;;   (setq flymake-gui-warnings-enabled nil)
;;   (defvar flymake-makefile-filenames '("Makefile" "makefile" "GNUmakefile") "File names for make.")

;;   (defun flymake-get-make-gcc-cmdline (source base-dir)
;;     (let (found)
;;       (dolist (makefile flymake-makefile-filenames)
;;         (if (file-readable-p (concat base-dir "/" makefile))
;;             (setq found t)))
;;       (if found
;;           (list "make"
;;                 (list "-s"
;;                       "-C"
;;                       base-dir
;;                       (concat "CHK_SOURCES=" source)
;;                       "SYNTAX_CHECK_MODE=1"
;;                       "check-syntax"))
;;         (list (if (string= (file-name-extension source) "c") "gcc" "g++")
;;               (list "-o"
;;                     "/dev/null"
;;                     "-S"
;;                     source)))))

;;   (defun flymake-simple-make-gcc-init-impl (create-temp-f use-relative-base-dir use-relative-source build-file-name get-cmdline-f)
;;     "Create syntax check command line for a directly checked source file.
;; Use CREATE-TEMP-F for creating temp copy."
;;     (let* ((args nil)
;;            (source-file-name buffer-file-name)
;;            (buildfile-dir (file-name-directory source-file-name)))
;;       (if buildfile-dir
;;           (let* ((temp-source-file-name  (flymake-init-create-temp-buffer-copy create-temp-f)))
;;             (setq args
;;                   (flymake-get-syntax-check-program-args
;;                    temp-source-file-name
;;                    buildfile-dir
;;                    use-relative-base-dir
;;                    use-relative-source
;;                    get-cmdline-f))))
;;       args))

;;   (defun flymake-simple-make-gcc-init ()
;;     (flymake-simple-make-gcc-init-impl 'flymake-create-temp-inplace t t "Makefile" 'flymake-get-make-gcc-cmdline))

;;   (setq flymake-allowed-file-name-masks
;;         '(("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-gcc-init)
;;           ("\\.xml\\'" flymake-xml-init)
;;           ("\\.html?\\'" flymake-xml-init)
;;           ("\\.cs\\'" flymake-simple-make-init)
;;           ("\\.p[ml]\\'" flymake-perl-init)
;;           ("\\.php[345]?\\'" flymake-php-init)
;;           ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
;;           ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
;;           ;; ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
;;           ;; ("\\.tex\\'" flymake-simple-tex-init)
;;           ("\\.idl\\'" flymake-simple-make-init)))

;;   (defun flymake-display-current-warning/error ()
;;     "Display warning/error under cursor."
;;     (interactive)
;;     (let ((ovs (overlays-in (point) (1+ (point)))))
;;       (dolist (ov ovs)
;;         (catch 'found
;;           (when (flymake-overlay-p ov)
;;             (message (overlay-get ov 'help-echo))
;;             (throw 'found t))))))

;;   (defun flymake-goto-next-error-disp ()
;;     "Go to next error in err ring, and then display warning/error."
;;     (interactive)
;;     (flymake-goto-next-error)
;;     (flymake-display-current-warning/error))

;;   (defun flymake-goto-prev-error-disp ()
;;     "Go to previous error in err ring, and then display warning/error."
;;     (interactive)
;;     (flymake-goto-prev-error)
;;     (flymake-display-current-warning/error))

;;   (defun flymake-settings-4-emaci ()
;;     "`flymake' settings for `emaci'."
;;     (emaci-add-key-definition
;;      "z" 'flymake-display-current-warning/error
;;      '(memq major-mode dev-modes)))

;;   (eval-after-load "emaci"
;;     '(progn
;;       (flymake-settings-4-emaci)))

;;--------------------------------------------------------------------

;; Meteor's settings
;; ;; flymake
;; (autoload 'flymake-find-file-hook "flymake" "" t)
;; ;; (add-hook 'find-file-hook 'flymake-find-file-hook)
;; (setq flymake-allowed-file-name-masks '())
;; (setq flymake-gui-warnings-enabled nil)
;; (setq flymake-log-level 0)
;; (setq flymake-no-changes-timeout 5.0)
;; (setq flymake-master-file-dirs
;;       '("." "./src" "../src" "../../src"
;;         "./source" "../source" "../../source"
;;         "./Source" "../Source" "../../Source"
;;         "./test" "../test" "../../test"
;;         "./Test" "../Test" "../../Test"
;;         "./UnitTest" "../UnitTest" "../../UnitTest"))
;; (defvar flymake-mode-map (make-sparse-keymap))
;; (define-key flymake-mode-map (kbd "C-c <f4>") 'flymake-goto-next-error)
;; (define-key flymake-mode-map (kbd "C-c <S-f4>") 'flymake-goto-prev-error)
;; (define-key flymake-mode-map (kbd "C-c <C-f4>")
;;   'flymake-display-err-menu-for-current-line)
;; (or (assoc 'flymake-mode minor-mode-map-alist)
;;     (setq minor-mode-map-alist
;;           (cons (cons 'flymake-mode flymake-mode-map)
;;                 minor-mode-map-alist)))
;; (defadvice flymake-goto-prev-error (after display activate)
;;   (message (get-char-property (point) 'help-echo)))
;; (defadvice flymake-goto-next-error (after display activate)
;;   (message (get-char-property (point) 'help-echo)))

;; (when (executable-find "texify")
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.tex\\'" flymake-simple-tex-init))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("[0-9]+\\.tex\\'"
;;                  flymake-master-tex-init flymake-master-cleanup)))

;; (when (executable-find "xml")
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.xml\\'" flymake-xml-init))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.html?\\'" flymake-xml-init)))

;; (when (executable-find "perl")
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.p[ml]\\'" flymake-perl-init)))

;; (when (executable-find "php")
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.php[345]?\\'" flymake-php-init)))

;; (when (executable-find "make")
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.idl\\'" flymake-simple-make-init))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.java\\'"
;;                  flymake-simple-make-java-init flymake-simple-java-cleanup))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.cs\\'" flymake-simple-make-init)))

;; (defun flymake-elisp-init ()
;;   (if (string-match "^ " (buffer-name))
;;       nil
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list
;;        (expand-file-name invocation-name invocation-directory)
;;        (list
;;         "-Q" "--batch" "--eval"
;;         (prin1-to-string
;;          (quote
;;           (dolist (file command-line-args-left)
;;             (with-temp-buffer
;;               (insert-file-contents file)
;;               (emacs-lisp-mode)
;;               (condition-case data
;;                   (scan-sexps (point-min) (point-max))
;;                 (scan-error
;;                  (goto-char(nth 2 data))
;;                  (princ (format "%s:%s: error: Unmatched bracket or quote\n"
;;                                 file (line-number-at-pos)))))))))
;;         local-file)))))
;; ;; (add-to-list 'flymake-allowed-file-name-masks '("\\.el$" flymake-elisp-init))
;; ;; (add-hook 'write-file-functions (lambda nil
;; ;; (when (eq major-mode 'emacs-lisp-mode)
;; ;; (check-parens))))

;; (defcustom flymake-shell-of-choice "sh"
;;   "Path of shell.")
;; (defcustom flymake-shell-arguments
;;   (list "-n")
;;   "Shell arguments to invoke syntax checking.")
;; (defun flymake-shell-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list flymake-shell-of-choice
;;           (append flymake-shell-arguments (list local-file)))))
;; (when (executable-find flymake-shell-of-choice)
;;   (add-to-list 'flymake-allowed-file-name-masks '("\\.sh$" flymake-shell-init)))

;; (when (executable-find "pyflakes")
;;   (defun flymake-pyflakes-init ()
;;     (let* ((args nil)
;;            (temp-file (ignore-errors (flymake-init-create-temp-buffer-copy
;;                                       'flymake-create-temp-inplace))))
;;       (if temp-file
;;           (let ((local-file (file-relative-name
;;                              temp-file
;;                              (file-name-directory buffer-file-name))))
;;             (setq args (list "pyflakes" (list local-file))))
;;         (flymake-report-fatal-status
;;          "TMPERR" (format "Can't create temp file")))
;;       args))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; (defvar flymake-makefile-filenames '("Makefile" "makefile" "GNUmakefile")
;;   "File names for make.")
;; (defvar flymake-c-file-arguments
;;   '(("gcc" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
;;             "-I../.." "-I../../include" "-I../../inc"
;;             "-I../../common" "-I../../public"
;;             "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
;;     ("clang" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
;;               "-I../.." "-I../../include" "-I../../inc"
;;               "-I../../common" "-I../../public"
;;               "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
;;     ("cl" ("/I.." "/I../include" "/I../inc" "/I../common" "/I../public"
;;            "/I../.." "/I../../include" "/I../../inc"
;;            "/I../../common" "/I../../public"
;;            "/EHsc" "/W4" (concat "/Fo" (getenv "TEMP") "\\null.obj") "/c"))))
;; (defvar flymake-cxx-file-arguments
;;   '(("g++" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
;;             "-I../.." "-I../../include" "-I../../inc"
;;             "-I../../common" "-I../../public"
;;             "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
;;     ("clang++" ("-I.." "-I../include" "-I../inc" "-I../common" "-I../public"
;;                 "-I../.." "-I../../include" "-I../../inc"
;;                 "-I../../common" "-I../../public"
;;                 "-Wall" "-Wextra" "-pedantic" "-fsyntax-only"))
;;     ("cl" ("/I.." "/I../include" "/I../inc" "/I../common" "/I../public"
;;            "/I../.." "/I../../include" "/I../../inc"
;;            "/I../../common" "/I../../public"
;;            "/EHsc" "/W4" (concat "/Fo" (getenv "TEMP") "\\null.obj") "/c"))))
;; (defun flymake-get-compile (arguments)
;;   (let ((compile nil))
;;     (while (and (not compile) arguments)
;;       (let ((arg (car arguments)))
;;         (if (executable-find (car arg))
;;             (setq compile arg)
;;           (setq arguments (cdr arguments)))))
;;     compile))
;; (defun flymake-get-c-compile ()
;;   (flymake-get-compile flymake-c-file-arguments))
;; (defun flymake-get-cxx-compile ()
;;   (flymake-get-compile flymake-cxx-file-arguments))
;; (defun flymake-get-cc-cmdline (source base-dir)
;;   (let ((args nil)
;;         (compile (if (string= (file-name-extension source) "c")
;;                      (flymake-get-c-compile)
;;                    (flymake-get-cxx-compile))))
;;     (if compile
;;         (setq args (list (car compile)
;;                          (append (car (cdr compile)) (list source))))
;;       (flymake-report-fatal-status
;;        "NOMK" (format "No compile found for %s" source)))
;;     args))
;; (defun flymake-init-find-makfile-dir (source-file-name)
;;   "Find Makefile, store its dir in buffer data and return its dir, if found."
;;   (let* ((source-dir (file-name-directory source-file-name))
;;          (buildfile-dir nil))
;;     (catch 'found
;;       (dolist (makefile flymake-makefile-filenames)
;;         (let ((found-dir (flymake-find-buildfile makefile source-dir)))
;;           (when found-dir
;;             (setq buildfile-dir found-dir)
;;             (setq flymake-base-dir buildfile-dir)
;;             (throw 'found t)))))
;;     buildfile-dir))
;; (defun flymake-simple-make-cc-init-impl (create-temp-f
;;                                          use-relative-base-dir
;;                                          use-relative-source)
;;   "Create syntax check command line for a directly checked source file.
;; Use CREATE-TEMP-F for creating temp copy."
;;   (let* ((args nil)
;;          (source-file-name buffer-file-name)
;;          (source-dir (file-name-directory source-file-name))
;;          (buildfile-dir
;;           (and (executable-find "make")
;;                (flymake-init-find-makfile-dir source-file-name)))
;;          (temp-source-file-name
;;           (ignore-errors
;;             (flymake-init-create-temp-buffer-copy create-temp-f))))
;;     (if temp-source-file-name
;;         (setq args
;;               (flymake-get-syntax-check-program-args
;;                temp-source-file-name
;;                (if buildfile-dir buildfile-dir source-dir)
;;                use-relative-base-dir
;;                use-relative-source
;;                (if buildfile-dir
;;                    'flymake-get-make-cmdline
;;                  'flymake-get-cc-cmdline)))
;;       (flymake-report-fatal-status
;;        "TMPERR" (format "Can't create temp file for %s" source-file-name)))
;;     args))
;; (defun flymake-simple-make-cc-init ()
;;   (flymake-simple-make-cc-init-impl 'flymake-create-temp-inplace t t))
;; (defun flymake-master-make-cc-init (get-incl-dirs-f
;;                                     master-file-masks
;;                                     include-regexp)
;;   "Create make command line for a source file
;; checked via master file compilation."
;;   (let* ((args nil)
;;          (temp-master-file-name
;;           (ignore-errors
;;             (flymake-init-create-temp-source-and-master-buffer-copy
;;              get-incl-dirs-f
;;              'flymake-create-temp-inplace
;;              master-file-masks
;;              include-regexp))))
;;     (if temp-master-file-name
;;         (let* ((source-file-name buffer-file-name)
;;                (source-dir (file-name-directory source-file-name))
;;                (buildfile-dir
;;                 (and (executable-find "make")
;;                      (flymake-init-find-makfile-dir temp-master-file-name))))
;;           (setq args (flymake-get-syntax-check-program-args
;;                       temp-master-file-name
;;                       (if buildfile-dir buildfile-dir source-dir)
;;                       nil
;;                       nil
;;                       (if buildfile-dir
;;                           'flymake-get-make-cmdline
;;                         'flymake-get-cc-cmdline))))
;;       (flymake-report-fatal-status
;;        "TMPERR" (format "Can't create temp file for %s" source-file-name)))
;;     args))
;; (defun flymake-master-make-cc-header-init ()
;;   (flymake-master-make-cc-init
;;    'flymake-get-include-dirs
;;    '("\\.cpp\\'" "\\.c\\'")
;;    "[ \t]*#[ \t]*include[ \t]*\"\\([[:word:]0-9/\\_.]*%s\\)\""))
;; (when (or (executable-find "make")
;;           (flymake-get-c-compile)
;;           (flymake-get-cxx-compile))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.\\(?:h\\(?:pp\\)?\\)\\'"
;;                  flymake-master-make-cc-header-init flymake-master-cleanup))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
;;                  flymake-simple-make-cc-init)))


(provide 'xy-rc-flymake)
