;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-01 Wed 23:47 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-utils.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  Emacs configuration utilities
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
;; REF: (@url :file-name "http://emacser.com/eval-after-load.htm" :display "emacser")
;; 利用`eval-after-load'加快启动速度的库，避免不必要的elisp包的加载
;; (require 'eval-after-load)

;;====================================================================
;;* Definitions

;;** System variables

;;*** Important path
(defvar my-git-lisp-path (expand-file-name "~/.emacs.d/git-lisps")
  "Name of directory where Emacs Lisp files of git submodules reside.")
(defvar my-local-lisp-path (expand-file-name "~/.emacs.d/lisps")
  "Name of directory where manually installed Emacs Lisp files reside.")
(defvar my-elpa-lisp-path (expand-file-name "~/.emacs.d/elpa")
  "Name of directory where ELPA Emacs Lisp files reside.")
(defvar my-emacswiki-lisp-path (expand-file-name "~/.emacs.d/emacswiki")
  "Name of directory where lisps downloaded from EmacsWiki.")
(defvar my-own-lisp-path (expand-file-name "~/.emacs.d/my-lisps")
  "Name of directory where my own Emacs Lisp files reside.")
(defvar my-init-lisp-path (expand-file-name "~/.emacs.d/my-lisps/init")
  "Name of diretory where my init Emacs Lisp files reside.")
(defvar my-local-image-path (expand-file-name "~/.emacs.d/icons")
  "Name of diretory where my local icon files reside.")
(defvar my-local-exec-path (expand-file-name "~/.emacs.d/bin")
  "Name of diretory where my local executive binaries reside.")
(defvar my-local-info-path (expand-file-name "~/.emacs.d/info")
  "Name of diretory where my local info files reside.")
(defvar my-local-man-path (expand-file-name "~/.emacs.d/man")
  "Name of diretory where my local man files reside.")
(defvar my-emacs-path (expand-file-name "~/emacs")
  "Name of directory where my working files reside.")
(defvar my-var-path (expand-file-name "~/emacs/var")
  "Name of directory where my various Emacs log/record files reside.")

;;*** Machine names --- which machine are we using?
(defvar using-office-pc
  (string-match "brl" (prin1-to-string (downcase system-name))))
(defvar using-home-desktop
  (string-match "p6t" (prin1-to-string (downcase system-name))))
(defvar using-laptop
  (string-match "t42" (prin1-to-string (downcase system-name))))
;; OS type --- are we running Microsoft Windows?
(defvar running-ms-windows
  (string-match "windows" (prin1-to-string system-type)))
(defvar running-gnu-linux
  (string-match "linux" (prin1-to-string system-type)))

;;--------------------------------------------------------------------
;;** System marcos

;;*** Machine name --- which machine are we using?
(defmacro OfficePC (&rest body)
  (list
   'if (string-match
        "brl" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))
(defmacro UKDesktop (&rest body)
  (list
   'if (string-match
        "p6t" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))
(defmacro Laptop (&rest body)
  (list
   'if (string-match
        "t42" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))

;;*** OS type --- are we running GNU Linux?
(defmacro GNULinux (&rest body)
  (list
   'if (string-match
        "linux" (prin1-to-string system-type))
   (cons 'progn body)))
(defmacro Windows (&rest body)
  (list
   'if (string-match
        "windows" (prin1-to-string system-type))
   (cons 'progn body)))

;;*** Graphic mode --- are we running any window system ?
(defmacro XLaunch (&rest body)
  (list 'if (eq window-system 'x)(cons 'progn body)))

;;*** Emacs version
(defmacro GNUEmacs (&rest body)
  "Execute any number of forms if running under GNU Emacs."
  (list 'if (string-match "GNU Emacs" (version))
        (cons 'progn body)))
(defmacro GNUEmacs24 (&rest body)
  (list 'if (string-match "GNU Emacs 24" (version))
        (cons 'progn body)))
(defmacro GNUEmacs23 (&rest body)
  (list 'if (string-match "GNU Emacs 23" (version))
        (cons 'progn body)))
(defmacro GNUEmacs22 (&rest body)
  (list 'if (string-match "GNU Emacs 22" (version))
        (cons 'progn body)))
(defmacro GNUEmacs21 (&rest body)
  (list 'if (string-match "GNU Emacs 21" (version))
        (cons 'progn body)))
(GNUEmacs
 (list emacs-version emacs-major-version emacs-minor-version
       system-type system-name system-configuration
       window-system
       (when (boundp 'aquamacs-version) aquamacs-version)))

;;--------------------------------------------------------------------
;;** c/c++ include dir
(Windows
 (defvar user-include-dirs
   '(;; User header files
     "." "./include" "./inc" "./common" "./public"
     ".." "../include" "../inc" "../common" "../public"
     "../.." "../../include" "../../inc" "../../common" "../../public"
     ;; GCC header files
     "E:/program/MinGW/include"
     "E:/program/MinGW/include/sys"
     "E:/program/MinGW/include/ddk"
     "E:/program/MinGW/include/gdiplus"
     "E:/program/MinGW/include/GL"
     "E:/program/MinGW/include/libltdl"
     "E:/program/MinGW/include/sys"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include/c++"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include/c++/backward"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include-fixed"
     "E:/program/MinGW/lib/gcc/mingw32/4.5.2/finclude"
     ;; MSYS header files
     ;; "E:/program/MinGW/msys/1.0/include"
     ;; VC 6 header files
     ;; "D:/Microsoft Visual Studio/VC98/Include"
     ;; "D:/Microsoft Visual Studio/VC98/MFC/Include"
     ;; VC 10 header files
     ;; "D:/Microsoft Visual Studio 10.0/VC/include"
     ;; Winpcap headers, better to be copied to project directory
     ;; "D:/WpdPack/Include"
     )
   "User include dirs for c/c++ mode")
 (defvar c-preprocessor-symbol-files
   '(;; "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include/c++/bits/c++0x_warning.h"
     ;; "D:/Microsoft Visual Studio/VC98/Include/xstddef"
     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/yvals.h"
     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/crtdefs.h"
     )
   "Preprocessor symbol files for cedet"))

(GNULinux
 (defvar user-include-dirs
   '(;; User header files
     "." "./include" "./inc" "./common" "./public"
     ".." "../include" "../inc" "../common" "../public"
     "../.." "../../include" "../../inc" "../../common" "../../public"
     "/usr/include" "/usr/local/include")
   "User include dirs for c/c++ mode")
 (defvar c-preprocessor-symbol-files
   '(
     )
   "Preprocessor symbol files for cedet"))

;;--------------------------------------------------------------------
;;**  Reload init file
;; Note: when using `require' in the init.el to load other setting files,
;; you have to restart Emacs.
;; When using `load', Emacs will load every setting files.
;;;###autoload
(defun load-dot-emacs-file ()
  (interactive)
  (load "init" 'noerror t t))

;; ;; Open init file
;; ;;;###autoload
;; (defun open-init-dot-el-file ()
;;   (interactive)
;;   (find-file "~/.emacs.d/init.el"))

;;====================================================================
;;* F.Niessen's utilities in his .emacs
;; REF: (@url :file-name "http://www.mygooglest.com/fni/dot-emacs.html" :display "Website")

;;;###autoload
(defun fni/add-to-load-path
  (this-directory &optional with-subdirs recursive)
  "Add THIS-DIRECTORY at the beginning of the load-path, if it exists.
Add all its subdirectories not starting with a '.' if the optional
argument WITH-SUBDIRS is not nil. Do it recursively if the third
argument is not nil."

  (when (and this-directory
             (file-directory-p this-directory))
    (let* ((this-directory (expand-file-name this-directory))
           (files (directory-files this-directory t "^[^\\.]")))

      ;; completely canonicalize the directory name (*may not* begin
      ;; with `~')
      (while (not (string= this-directory
                           (expand-file-name this-directory)))
        (setq this-directory (expand-file-name this-directory)))

      (message "* ---[ Adding `%s' to load-path... ]---" this-directory)
      (add-to-list 'load-path this-directory)

      (when with-subdirs
        (while files
          (setq dir-or-file (car files))
          (when (file-directory-p dir-or-file)
            (if recursive
                (fni/add-to-load-path dir-or-file
                                      'with-subdirs 'recursive)
              (fni/add-to-load-path dir-or-file)))
          (setq files (cdr files)))))))

;;--------------------------------------------------------------------
;;;###autoload
(defun fni/add-to-image-load-path
  (this-directory &optional with-subdirs recursive)
  "Add THIS-DIRECTORY at the beginning of the image-load-path, if it
exists. Add all its subdirectories not starting with a '.' if the
optional argument WITH-SUBDIRS is not nil. Do it recursively if the
third argument is not nil."

  (when (and this-directory
             (file-directory-p this-directory))
    (let* ((this-directory (expand-file-name this-directory))
           (files (directory-files this-directory t "^[^\\.]")))

      ;; completely canonicalize the directory name (*may not* begin with `~')
      (while (not (string= this-directory
                           (expand-file-name this-directory)))
        (setq this-directory (expand-file-name this-directory)))

      (message "* ---[ Adding `%s' to image-load-path... ]---"
               this-directory)
      (add-to-list 'image-load-path this-directory)

      (when with-subdirs
        (while files
          (setq dir-or-file (car files))
          (when (file-directory-p dir-or-file)
            (if recursive
                (fni/add-to-image-load-path dir-or-file
                                            'with-subdirs 'recursive)
              (fni/add-to-image-load-path dir-or-file)))
          (setq files (cdr files)))))))

;;--------------------------------------------------------------------
(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")
;;;###autoload
(defun try-require (feature)
  "Attempt to load a library or module. Return true if the library
given as argument is successfully loaded. If not, instead of an error,
just add the package to a list of missing packages."

  (condition-case err
      ;; protected form
      (progn
        (message "* ---[ Checking for library `%s'... ]---" feature)
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (message "* ---[ Checking for library `%s'... Found ]---"
                 feature))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "* ---[ Checking for library `%s'... Missing ]---"
                feature)
       (add-to-list 'missing-packages-list feature 'append)) nil)))

;;--------------------------------------------------------------------
;;;###autoload
(defun my-make-directory-yes-or-no (dir)
  "Ask user to create the DIR, if it does not already exist."

  (if dir
      (if (not (file-directory-p dir))
          (if (yes-or-no-p
               (concat "The directory `" dir
                       "' does not exist currently. Create it? "))
              (make-directory dir t)
            (error
             (concat "Cannot continue without directory `" dir "'"))))
    (error "my-make-directory-yes-or-no: missing operand")))

;;;###autoload
(defun my-file-executable-p (file)
  "Make sure the file FILE exists and is executable."
  (if file
      (if (file-executable-p file)
          file
        (message "* ---[ WARNING: Can't find executable `%s' ]---"
                 file)
        ;; sleep 1 s so that you can read the warning
        (sit-for 1))
    (error "my-file-executable-p: missing operand")))

;;====================================================================
;;* From ahei-misc.el

;;;###autoload
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND,
LOCAL. HOOKS can be one list or just a hook."

  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

;;--------------------------------------------------------------------
;;;###autoload
(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

;;--------------------------------------------------------------------
;;;###autoload
(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

;;--------------------------------------------------------------------
;;;###autoload
(defun am-forward-word-or-to-word ()
  "`forward-word' or `forward-to-word'.
If after excute `forward-to-word', current position
is at next line, then rollback and excute `forward-word'"
  (interactive)
  (let ((noo (line-number-at-pos)) no)
    (save-excursion
      (forward-to-word 1)
      (setq no (line-number-at-pos)))
    (if (> no noo)
        (forward-word)
      (forward-to-word 1))))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, and evaluate BODY there
like `progn'. See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

;;--------------------------------------------------------------------
;;;###autoload
(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))

;;====================================================================
;;* From util.el used by ahei, written by taoshanwen

(defvar mswin  (equal window-system 'w32)
  "Non-nil means windows system.")
(defvar cygwin (equal system-type 'cygwin)
  "Non-nil means cygwin system.")

(defvar use-cua nil "Use CUA mode or not.")

(defvar last-region-beg     nil "Beginning of last region.")
(defvar last-region-end     nil "End of last region.")
(defvar last-region-is-rect nil "Last region is rectangle or not.")
(defvar last-region-use-cua nil "Last region use CUA mode or not.")

(defconst system-head-file-dir
  (list "/usr/include" "/usr/local/include" "/usr/include/sys")
  "系统头文件目录")
(defconst user-head-file-dir
  (list "." "../hdr" "../include")
  "用户头文件目录")

(defconst is-before-emacs-21 (>= 21 emacs-major-version)
  "是否是emacs 21或以前的版本")
(defconst is-after-emacs-23  (<= 23 emacs-major-version)
  "是否是emacs 23或以后的版本")

(defvar c-modes '(c-mode c++-mode awk-mode java-mode) "*C modes.")
(defvar dev-modes (append c-modes
                          '(python-mode perl-mode
                                        makefile-gmake-mode))
  "*Modes for develop.")

;;--------------------------------------------------------------------
;;;###autoload
(defun execute-command-on-file (file command)
  "对FILE执行命令COMMAND"
  (interactive
   (list (read-file-name "File execute command on: ")
         (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (if file
      (when (yes-or-no-p (concat command " file `" file "'?"))
        (shell-command (concat command " \"" file "\"")))
    (message "* ---[ Executing command `%s'... ]---" command)
    (shell-command command)))

;;--------------------------------------------------------------------
;;;###autoload
(defun execute-command-on-current-file (command)
  "对当前buffer执行命令COMMAND, 如果该buffer对应文件的话, 再执行
`revert-buffer-no-confirm'"
  (interactive
   (list (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (let* ((file (buffer-file-name)))
    (execute-command-on-file file command)
    (if file
        (revert-buffer-no-confirm))))

;;--------------------------------------------------------------------
;;;###autoload
(defun execute-command-on-current-dir (command)
  "对当前目录执行命令COMMAND."
  (interactive
   (list (let* ((input ""))
           (while (string= input "")
             (setq input (read-string "命令: ")))
           input)))
  (let* ((file (buffer-file-name)))
    (execute-command-on-file default-directory command)
    (if file
        (revert-buffer-no-confirm))))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro def-execute-command-on-file-command (command)
  "Make definition of command which execute command on file."
  `(defun ,(intern (subst-char-in-string ?\ ?- command)) (file)
     ,(concat "Run command `" command "' on file FILE.")
     (interactive
      (list (read-file-name (concat "File to " ,command ": "))))
     (execute-command-on-file file ,command)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro def-execute-command-on-current-file-command (command)
  "Make definition of command which execute command on current file."
  `(defun ,(am-intern (subst-char-in-string ?\ ?- command)
                      "-current-file") ()
     ,(concat "Execute command `" command "' on current file.")
     (interactive)
     (execute-command-on-current-file ,command)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro def-execute-command-on-current-dir-command (command)
  "Make definition of command which execute command on current
directory."
  `(defun ,(am-intern (subst-char-in-string ?\ ?- command)
                      "-current-dir") ()
     ,(concat "Execute command `" command "' on current directory.")
     (interactive)
     (execute-command-on-current-dir ,command)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro define-kbd (keymap key def)
  `(define-key ,keymap (kbd ,key) ,def))
;;;###autoload
(defmacro local-set-kbd (key command)
  `(local-set-key (kbd ,key) ,command))
;;;###autoload
(defmacro global-set-kbd (key command)
  `(global-set-key (kbd ,key) ,command))

;; ;;;###autoload
;; (defalias 'apply-define-key 'eal-define-keys-commonly)
;; ;;;###autoload
;; (defalias 'define-key-list 'eal-define-keys-commonly)

;;--------------------------------------------------------------------
;;;###autoload
(defun apply-args-list-to-fun (fun-list args-list)
  "Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a
symbol."
  (let ((is-list (and (listp fun-list) (not (functionp fun-list)))))
    (dolist (args args-list)
      (if is-list
          (dolist (fun fun-list)
            (apply-args-to-fun fun args))
        (apply-args-to-fun fun-list args)))))

;;--------------------------------------------------------------------
;;;###autoload
(defun apply-args-to-fun (fun args)
  "Apply args to function FUN."
  (if (listp args)
      (eval `(,fun ,@args))
    (eval `(,fun ,args))))

;;--------------------------------------------------------------------
;;;###autoload
(defun kill-buffer-when-shell-command-exit ()
  "Close current buffer when `shell-command' exit."
  (let ((process (ignore-errors
                   (get-buffer-process (current-buffer)))))
    (when process
      (set-process-sentinel
       process
       (lambda (proc change)
         (when (string-match "\\(finished\\|exited\\)" change)
           (kill-buffer (process-buffer proc))))))))

;;--------------------------------------------------------------------
;;;###autoload
(defun list-colors-display-htm (&optional list)
  "Create HTML page which lists all the defined colors."
  (interactive)
  (if (and (null list) window-system)
      (progn
        (setq list (x-defined-colors))
        ;; Delete duplicate colors.
        (let ((l list))
          (while (cdr l)
            (if (facemenu-color-equal (car l) (car (cdr l)))
                (setcdr l (cdr (cdr l)))
              (setq l (cdr l)))))))
  (with-output-to-temp-buffer "*Colors*"
    (save-excursion
      (set-buffer standard-output)
      (insert "<html>\n"
              "<head>\n"
              "<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\n"
              "<title>Colors</title>\n"
              "</head>\n"
              "<body>\n"
              "<h1>Colors</h1>\n"
              "<p>\n"
              "<pre>\n")
      (let (s)
        (while list
          (insert (format (concat "<span style=\"background-color:%s\">%-20s</span>"
                                  "  "
                                  "<span style=\"color:%s\">%s</span>"
                                  "\n")
                          (html-color (car list)) (car list)
                          (html-color (car list)) (car list)))
          (setq list (cdr list))))
      (insert "</pre>"
              "</body>"
              "</html>"))))

;;--------------------------------------------------------------------
;;;###autoload
(defun html-color (string)
  "Convert colors names to rgb(n1,n2,n3) strings."
  (format "rgb(%d,%d,%d)"
          (/ (nth 0 (x-color-values string)) 256)
          (/ (nth 1 (x-color-values string)) 256)
          (/ (nth 2 (x-color-values string)) 256)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro def-command-max-window (command)
  "Make definition of command which after execute command COMMAND
execute `delete-other-windows'."
  `(defun ,(am-intern command "-max-window") ()
     ,(concat "After run command `" command
              "' execute command `delete-other-windows'.")
     (interactive)
     (call-interactively ',(intern command))
     (delete-other-windows)))

;;--------------------------------------------------------------------
;;;###autoload
(defun delete-current-window (&optional frame)
  "Delete window which showing current buffer."
  (interactive
   (list (and current-prefix-arg
              (or (natnump (prefix-numeric-value current-prefix-arg))
                  'visible))))
  (if (one-window-p)
      (bury-buffer)
    (delete-windows-on (current-buffer) frame)))

;;--------------------------------------------------------------------
;;;###autoload
(defmacro def-turn-on (command &optional is-on)
  "Make definition of command whose name is COMMAND-on when IS-ON is t
and COMMAND-off when IS-ON is nil."
  (let ((on (if is-on "on" "off")))
    `(defun ,(am-intern command "-" on) ()
       ,(concat "Turn " on " `" command "'.")
       (interactive)
       (funcall ',(intern command) ,(if is-on 1 -1)))))

;;--------------------------------------------------------------------
;;;###autoload
(defun unset-key (keymap key)
  "Remove binding of KEY in map KEYMAP.
KEY is a string or vector representing a sequence of keystrokes."
  (define-key keymap key nil))

;;====================================================================
;;* Emacs auto font selection for different OS
;; REF: (@url :file-name "http://emacser.com/torture-emacs.htm" :display "emacser")

;;;###autoload
(defun qiang-font-existsp (font)
  "判断某个字体在系统中是否安装"
  (when window-system
    (if (null (x-list-fonts font)) nil t)))

;; Example: 按顺序找到一个字体列表( list ) 中第一个已经安装可用的字体
;; (defvar font-list
;;   '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
;; ;; (require 'cl) ;; find-if is in common list package
;; (find-if #'qiang-font-existsp font-list)

;;--------------------------------------------------------------------
;;;###autoload
(defun qiang-make-font-string (font-name font-size)
  "产生带上 font size 信息的 font 描述文本"
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

;;--------------------------------------------------------------------
;;;###autoload
(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-font-size)
  "自动为不同字符集设置字体

english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                       ; for find if
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font
         (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)
                    :size chinese-font-size)))
    ;; Set the default English font
    ;; NOTE: The following 2 method cannot make the font settig work
    ;; in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)
    ;; Set Chinese font
    ;; NOTE: Do not use 'unicode charset, it will cause the english
    ;; font invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset zh-font))))

;; Example:
;; (qiang-set-font
;;  '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace"
;;    "Courier New" "Courier") ":pixelsize=14"
;;    '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;      "黑体" "新宋体" "宋体") 16)
;; 设置字体 Emacs 会优先选用 Concolas + “雅黑”的组合。
;; 如果“雅黑”没有装的话，就使用“文泉驿等宽正黑”，依此类推。
;; 这份字体配置不用改动就能在不同的操作系统字体环境下面使用。
;; 另注：中文要用大一点的字体，使中文字符的宽度正好等于两倍
;; （整数倍）英文字符，才能配合 org mode 下的 table，不至于
;; 对不齐。 测试：
;;       1234567890
;;       一二三四五
;;       1l0oO

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/set-font-default ()
  "My default Emacs font setting."
  (interactive)
  (if window-system
      (qiang-set-font
       '("Consolas" "Monaco" ;; NOTE: "DejaVu Sans Mon" = "Monospace"
         "DejaVu Sans Mono" "Monospace" "Courier") ":pixelsize=14"
         '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 16)
    ;; 默认字体，term 下的字体
    (set-default-font "Monospace 12")))

;;;###autoload
(defun xy/set-font-default-big ()
  "My default Emacs font setting."
  (interactive)
  (if window-system
      (qiang-set-font
       '("Consolas" "Monaco" ;; NOTE: "DejaVu Sans Mon" = "Monospace"
         "DejaVu Sans Mono" "Monospace" "Courier") ":pixelsize=18"
         '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 20)
    ;; 默认字体，term 下的字体
    (set-default-font "Monospace 16")))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/set-font-prog ()
  "My default Emacs font setting."
  (interactive)
  (if window-system
      (qiang-set-font
       '("DejaVu Sans Mono" "Consolas" "Monospace"
         "Monaco" "Courier") ":pixelsize=12"
         '("STHeiti" "Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 14)
    ;; 默认字体，term 下的字体
    (set-default-font "Monospace 9")))

;;;###autoload
(defun xy/set-font-prog-big ()
  "My default Emacs font setting."
  (interactive)
  (if window-system
      (qiang-set-font
       '("DejaVu Sans Mono" "Consolas" "Monospace"
         "Monaco" "Courier") ":pixelsize=16"
         '("STHeiti" "Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 20)
    ;; 默认字体，term 下的字体
    (set-default-font "Monospace 14")))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/set-font-write ()
  "My Emacs font setting for writing articles."
  (interactive)
  (if window-system
      (qiang-set-font
       '("Monaco" "Monospace" "Consolas"
         "Courier" "DejaVu Sans Mono") ":pixelsize=14"
         '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 16)
    (set-default-font "Monospace 12")))

;;;###autoload
(defun xy/set-font-write-big ()
  "My Emacs font setting for writing articles."
  (interactive)
  (if window-system
      (qiang-set-font
       '("Monaco" "Monospace" "Consolas"
         "Courier" "DejaVu Sans Mono") ":pixelsize=17"
         '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 20)
    (set-default-font "Monospace 16")))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/set-font-write-1 ()
  "My Emacs font setting for writing articles."
  (interactive)
  (if window-system
      (qiang-set-font
       '("Monofur") ":pixelsize=15"
         '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
           "黑体") 16)
    (set-default-font "Monospace 12")))

;;--------------------------------------------------------------------
;; 配合的比较好的字体组合，可以一齐缩放
;;;###autoload
(defun xy/set-font-write-2 ()
  "My Emacs font setting for writing articles."
  (interactive)
  (if window-system
      (progn
        ;; Setting English Font
        (set-face-attribute
         'default nil :font "Monofur")

        ;; Chinese Font
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STHeiti"))))
    (set-default-font "Monospace")))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/daemon-after ()
  "Tasks been done after emacsclient first start."
  (interactive)
  (if window-system
      (progn
        (xy/set-font-write-big)
        (color-theme-solarized-dark)
        (xy/toggle-fullscreen))))

;;*===================================================================
;;* 全屏控制
;; fullscreen
(defvar xy:full-screen-flag nil)

;;;###autoload
(defun xy/toggle-fullscreen ()
  "Toggle full-screen mode."
  (interactive)
  (when window-system
    (progn
      (GNULinux
       ;; From: xiaoxuan@newsmth.net-SPAM.no (小轩)
       (if xy:full-screen-flag
           (progn
             (setq xy:full-screen-flag nil)
             (set-frame-parameter nil 'fullscreen nil))
         (progn
           (setq xy:full-screen-flag t)
           (set-frame-parameter nil 'fullscreen 'fullscreen))))

      (Windows ;; NOTE: Put `emacs_fullscreen.exe' in your $PATH, such as
       ;;       your `emacs.exe' folder.
       ;; REF: (@url :file-name "https://bitbucket.org/alexander_manenko/emacs-fullscreen-win32/wiki/Home" :display "Source:emacs-fullscreen-win32")
       ;; NOTE: not works with `autofit-frame.el'
       ;; ;; (setq autofit-frame-flag nil)
       ;; (shell-command "%HOME%/.emacs.d/bin/win32/emacs_fullscreen.exe")))))
       ;; Use patched fullscreen version Emacs
       (if xy:full-screen-flag
           (progn
             (setq xy:full-screen-flag nil)
             (set-frame-parameter nil 'fullscreen nil))
         (progn
           (setq xy:full-screen-flag t)
           (set-frame-parameter nil 'fullscreen 'fullscreen)))))))

;; maximize frame
(defvar xy:maxframe-flag nil)

;;;###autoload
(defun xy/smart-maximize-frame ()
  "Fix the `maximize-frame' function of `maxframe.el'.\
If the current emacs frame is in full screen mode, then give up\
the `maximize-frame command' of `maxframe.el'."

  (interactive)
  (when (try-require 'maxframe)
    (when (and window-system (not xy:full-screen-flag))
      (progn
        (maximize-frame)
        (setq xy:maxframe-flag t)))))

;;;###autoload
(defun xy/smart-toggle-maxframe ()
  "Smart maximize and restore the size of the frame.\
Also makes `maxframe.el' works with `xy/toggle-fullscreen' function."

  (interactive)
  (when (try-require 'maxframe)
    (when (and window-system (not xy:full-screen-flag))
      (progn
        (if xy:maxframe-flag
            (progn
              (setq xy:maxframe-flag nil)
              (restore-frame))
          (progn
            (setq xy:maxframe-flag t)
            (maximize-frame)))))))

;;====================================================================
;;* For compatibility among different version of Emacs

;; General Emacs/XEmacs-compatibility compile-time macros
;;;###autoload
(defmacro cond-emacs-xemacs (&rest args)
  (cond-emacs-xemacs-macfn
   args "`cond-emacs-xemacs' must return exactly one element"))

;;--------------------------------------------------------------------
;;;###autoload
(defun cond-emacs-xemacs-macfn (args &optional msg)
  (if (atom args) args
    (and (eq (car args) :@) (null msg) ; (:@ ...spliced...)
         (setq args (cdr args)
               msg "(:@ ....) must return exactly one element"))
    (let ((ignore
           (if (string-match "XEmacs" emacs-version) :EMACS :XEMACS))
          (mode :BOTH) code)
      (while (consp args)
        (if (memq (car args)
                  '(:EMACS :XEMACS :BOTH)) (setq mode (pop args)))
        (if (atom args)
            (or args (error "Used selector %s without elements" mode))
          (or (eq ignore mode)
              (push (cond-emacs-xemacs-macfn (car args)) code))
          (pop args)))
      (cond (msg (if (or args (cdr code)) (error msg) (car code)))
            ((or (null args) (eq ignore mode)) (nreverse code))
            (t (nconc (nreverse code) args))))))

;;--------------------------------------------------------------------
;; Emacs/XEmacs-compatibility `defun': remove interactive "_" for
;; Emacs, use existing functions when they are `fboundp', provide
;; shortcuts if they are known to be defined in a specific Emacs
;; branch (for short .elc)
;;;###autoload
(defmacro defunx (name arglist &rest definition)
  (let ((xemacsp (string-match "XEmacs" emacs-version)) reuses first)
    (while (memq (setq first (car definition))
                 '(:try :emacs-and-try :xemacs-and-try
                        :emacs-only :xemacs-only))
      (if (memq first (if xemacsp
                          '(:xemacs-and-try :xemacs-only)
                        '(:emacs-and-try :emacs-only)))
          (setq reuses (cadr definition)
                definition nil)
        (unless (memq first '(:emacs-only :xemacs-only))
          (push (cadr definition) reuses)))
      (setq definition (cddr definition)))
    (if (and reuses (symbolp reuses))
        `(defalias ',name ',reuses)
      (let* ((docstring
              (if (stringp (car definition)) (pop definition)))
             (spec (and (not xemacsp)
                        (eq (car-safe (car definition))
                            'interactive)
                        (null (cddar definition))
                        (cadar definition))))
        (if (and (stringp spec)
                 (not (string-equal spec ""))
                 (eq (aref spec 0) ?_))
            (setq definition
                  (cons (if (string-equal spec "_")
                            '(interactive)
                          `(interactive ,(substring spec 1)))
                        (cdr definition))))
        (if (null reuses)
            `(defun ,name ,arglist ,docstring
               ,@(cond-emacs-xemacs-macfn definition))
          ;; no dynamic docstring in this case
          `(eval-and-compile        ; no warnings in Emacs
             (defalias ',name
               (cond ,@(mapcar
                        (lambda (func) `((fboundp ',func) ',func))
                        (nreverse reuses))
                     (t ,(if definition
                             `(lambda ,arglist ,docstring
                                ,@(cond-emacs-xemacs-macfn
                                   definition))
                           'ignore))))))))))

;;--------------------------------------------------------------------
(when (>= 21 emacs-major-version)
  (defalias 'move-beginning-of-line 'beginning-of-line)
  (defalias 'move-end-of-line       'end-of-line))

;;--------------------------------------------------------------------
;; 定义一些emacs 21没有的函数
(when is-before-emacs-21
    '(progn
       (defun line-number-at-pos (&optional pos)
     "Return (narrowed) buffer line number at position POS.
If POS is nil, use current buffer location. Counting starts
at (point-min), so the value refers to the contents of the
accessible portion of the buffer."

     (let ((opoint (or pos (point))) start)
       (save-excursion
         (goto-char (point-min))
         (setq start (point))
         (goto-char opoint)
         (forward-line 0)
         (1+ (count-lines start (point))))))


       (defun looking-back (regexp &optional limit greedy)
     "Return non-nil if text before point matches regular
expression REGEXP. Like `looking-at' except matches before point,
and is slower. LIMIT if non-nil speeds up the search by
specifying a minimum starting position, to avoid checking matches
that would start before LIMIT.

If GREEDY is non-nil, extend the match backwards as far as possible,
stopping when a single additional previous character cannot be part
of a match for REGEXP."
     (let ((start (point))
           (pos
        (save-excursion
          (and (re-search-backward
            (concat "\\(?:" regexp "\\)\\=") limit t)
               (point)))))
       (if (and greedy pos)
           (save-restriction
         (narrow-to-region (point-min) start)
         (while (and (> pos (point-min))
                 (save-excursion
                   (goto-char pos)
                   (backward-char 1)
                   (looking-at (concat
                        "\\(?:"
                        regexp
                        "\\)\\'"))))
           (setq pos (1- pos)))
         (save-excursion
           (goto-char pos)
           (looking-at (concat "\\(?:"  regexp "\\)\\'")))))
       (not (null pos))))
       ))

;;====================================================================
;;* My own functions

;;;###autoload
(defun xy/recompile-dir
  (this-directory &optional with-subdirs recursive)
  "Recompile all files in THIS-DIRECTORY which are newer than their \
corresponding .elc files.

Provide WITH-SUBDIRS and RECURSIVE options to allow recursive
operation when you use it in non-interatively manner, but without
directories starting with a `.'."

  ;; (require 'bytecomp)
  (interactive (list (read-file-name "Source directory: ")))

  (when (and this-directory
             (file-directory-p this-directory))
    (let* ((this-directory (expand-file-name this-directory))
           (files (directory-files this-directory t "^[^\\.]")))

      ;; completely canonicalize the directory name (*may not* begin with `~')
      (while (not (string= this-directory
                           (expand-file-name this-directory)))
        (setq this-directory (expand-file-name this-directory)))

      (let ((files
             (directory-files this-directory t "^[^.]+\\.el$" nil)))
        (while files
          (let ((srcfile (car files))
                (dstfile (concat (car files) "c")))
            (if (or (not (file-exists-p dstfile))
                    (file-newer-than-file-p srcfile dstfile))
                (progn
                  (byte-compile-file srcfile)
                  (message "* ---[ Byte compiling `%s'... ]---" srcfile))
              (message "* ---[ `%s' exists and is newer. ]---" dstfile)))
          (setq files (cdr files))))

      (when with-subdirs
        (while files
          (setq dir-or-file (car files))
          (when (file-directory-p dir-or-file)
            (if recursive
                (xy/recompile-dir dir-or-file
                                  'with-subdirs 'recursive)
              (xy/recompile-dir dir-or-file)))
          (setq files (cdr files)))))))

;;--------------------------------------------------------------------
;; ;;;###autoload
;; (defun xy/update-all-autoloads
;;   (this-directory &optional with-subdirs recursive)
;;   "Update the autoloads cache file for THIS-DIRECTORY.

;; If there are newer .el files. The file name of the autoloads
;; cache is like `loaddefs@!home!user!.emacs.d!lisps.el', which is
;; built from the full path of the directory.

;; Provide WITH-SUBDIRS and RECURSIVE options to allow recursive
;; operation when you use it in non-interatively manner, but without
;; directories starting with a `.'."

;;   ;; (require 'autoload)
;;   ;; (defvar update-flag nil)
;;   (interactive (list (read-file-name "Source directory: ")))

;;   (when (and this-directory
;;              (file-directory-p this-directory))
;;     (let* ((this-directory (expand-file-name this-directory))
;;            (files (directory-files this-directory t "^[^\\.]")))

;;       ;; completely canonicalize the directory name (*may not* begin with `~')
;;       (while (not (string= this-directory
;;                            (expand-file-name this-directory)))
;;         (setq this-directory (expand-file-name this-directory)))

;;       (setq generated-autoload-file
;;             (concat this-directory "/loaddefs@"
;;                     (subst-char-in-string ?/ ?!
;;                                           (subst-char-in-string ?: ?! this-directory))
;;                     ".el"))
;;       (setq update-flag nil)
;;       (let ((files (directory-files
;;                     this-directory t "^[^.]+\\.el$" nil)))
;;         (while files
;;           (let ((srcfile (car files))
;;                 (dstfile (concat (car files) "c")))
;;             (if (or (not (file-exists-p generated-autoload-file))
;;                     (not (file-exists-p dstfile))
;;                     (file-newer-than-file-p
;;                      srcfile dstfile)
;;                     (file-newer-than-file-p
;;                      srcfile generated-autoload-file)
;;                     (file-newer-than-file-p
;;                      dstfile generated-autoload-file))
;;                 (setq update-flag (or update-flag t)))
;;             (setq files (cdr files))))

;;         (if update-flag
;;             (progn
;;               (cond ((fboundp 'update-autoloads-from-directory)
;;                      (update-autoloads-from-directory this-directory))
;;                     ((fboundp 'update-autoloads-from-directories)
;;                      (update-autoloads-from-directories this-directory))
;;                     ((fboundp 'update-directory-autoloads)
;;                      (update-directory-autoloads this-directory)))
;;               (message "* ---[ Updating `%s'... ]---"
;;                        generated-autoload-file))
;;           (message "* ---[ `%s' exists and is newer. ]---"
;;                    generated-autoload-file))

;;         (load-file generated-autoload-file)
;;         (message "* ---[ Loading `%s'... ]---"
;;                  generated-autoload-file))

;;       (when with-subdirs
;;         (while files
;;           (setq dir-or-file (car files))
;;           (when (file-directory-p dir-or-file)
;;             (if recursive
;;                 (xy/install-all-lisps dir-or-file
;;                                       'with-subdirs 'recursive)
;;               (xy/install-all-lisps dir-or-file)))
;;           (setq files (cdr files)))))))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/install-lisps
  (this-directory &optional with-subdirs recursive)
  "Install all the lisps in THIS-DIRECTORY.

The process is:

1. Add THIS-DIRECTORY to the load-path;
2. Update the autoloads cache file for THIS-DIRECTORY, if there are
newer .el files. The file name of the autoloads cache is like
`loaddefs@!home!user!.emacs.d!lisps.el', which is built from the
full path of the directory;
3. Load the autoloads cache file.

Provide WITH-SUBDIRS and RECURSIVE options to allow recursive
operation when you use it in non-interatively manner, but without
directories starting with a `.'."

  ;; (require 'bytecomp)
  ;; (require 'autoload)

  (interactive (list (read-file-name "Source directory: ")))

  (when (and this-directory
             (file-directory-p this-directory))
    (let* ((this-directory (expand-file-name this-directory))
           (files (directory-files this-directory t "^[^\\.]")))

      ;; completely canonicalize the directory name (*may not* begin with `~')
      (while (not (string= this-directory
                           (expand-file-name this-directory)))
        (setq this-directory (expand-file-name this-directory)))

      (setq generated-autoload-file
            (concat this-directory "/loaddefs@"
                    (subst-char-in-string ?/ ?!
                        (subst-char-in-string ?: ?! this-directory))
                    ".el"))
      (setq update-flag nil)
      (let ((files (directory-files
                    this-directory t "^[^.]+\\.el$" nil)))
        (while files
          (let ((srcfile (car files))
                (dstfile (concat (car files) "c")))

            (if (or (not (file-exists-p dstfile))
                    (file-newer-than-file-p srcfile dstfile))
                (progn
                  (byte-compile-file srcfile)
                  (message "* ---[ Byte compiling `%s'... ]---" srcfile))
              (message "* ---[ `%s' exists and is newer. ]---" dstfile))

            (if (or (not (file-exists-p generated-autoload-file))
                    (not (file-exists-p dstfile))
                    (file-newer-than-file-p srcfile dstfile)
                    (file-newer-than-file-p srcfile generated-autoload-file)
                    (file-newer-than-file-p dstfile generated-autoload-file))
                (setq update-flag (or update-flag t)))
            (setq files (cdr files))))

        (when update-flag ;; t
          (progn
            (cond ((fboundp 'update-autoloads-from-directory)
                   (update-autoloads-from-directory this-directory))
                  ((fboundp 'update-autoloads-from-directories)
                   (update-autoloads-from-directories this-directory))
                  ((fboundp 'update-directory-autoloads)
                   (update-directory-autoloads this-directory)))
            (message "* ---[ Updating `%s'... ]---"
                     generated-autoload-file))
          (message "* ---[ `%s' exists and is newer. ]---"
                   generated-autoload-file))

        (load generated-autoload-file 'noerror t t)
        (message "* ---[ Loading `%s'... ]---"
                 generated-autoload-file))

      (when with-subdirs
        (while files
          (setq dir-or-file (car files))
          (when (file-directory-p dir-or-file)
            (if recursive
                (xy/install-lisps dir-or-file
                                  'with-subdirs 'recursive)
              (xy/install-lisps dir-or-file)))
          (setq files (cdr files)))))))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/load-autoloads
  (this-directory &optional with-subdirs recursive)
  "Install all the lisps in THIS-DIRECTORY.

The process is:
  1. Add THIS-DIRECTORY to the load-path;
  2. Load the autoloads cache file."

  ;; (require 'bytecomp)
  ;; (require 'autoload)

  (interactive (list (read-file-name "Source directory: ")))

  (when (and this-directory
             (file-directory-p this-directory))
    (let* ((this-directory (expand-file-name this-directory))
           (files (directory-files this-directory t "^[^\\.]")))

      ;; completely canonicalize the directory name (*may not* begin with `~')
      (while (not (string= this-directory
                           (expand-file-name this-directory)))
        (setq this-directory (expand-file-name this-directory)))

      (setq generated-autoload-file
            (concat this-directory "/loaddefs@"
                    (subst-char-in-string ?/ ?!
                        (subst-char-in-string ?: ?! this-directory))
                    ".el"))
      (if (file-exists-p generated-autoload-file)
        ;; (progn
          ;; (add-to-list 'load-path this-directory)
          ;; (message "* ---[ Adding `%s' to load-path... ]---"
          ;;          this-directory)
          (load generated-autoload-file 'noerror t t)
          ;; (message "* ---[ Loading `%s'... ]---"
          ;;          generated-autoload-file)
          ;; )
        ;; else
        (message "* ---[ Error: `%s' does not exist]"
                 generated-autoload-file)))

    ;; (when with-subdirs
    ;;   (while files
    ;;     (setq dir-or-file (car files))
    ;;     (when (file-directory-p dir-or-file)
    ;;       (if recursive
    ;;           (xy/load-autoloads dir-or-file
    ;;                              'with-subdirs 'recursive)
    ;;         (xy/load-autoloads dir-or-file)))
    ;;     (setq files (cdr files))))

    ))

;;--------------------------------------------------------------------
;; ;;;###autoload
;; (defun xy/load-all-lisps
;;   (this-directory &optional with-subdirs recursive)
;;   "Load all the lisps in THIS-DIRECTORY."

;;   ;; (require 'bytecomp)
;;   (interactive (list (read-file-name "Source directory: ")))

;;   (when (and this-directory
;;              (file-directory-p this-directory))
;;     (let* ((this-directory (expand-file-name this-directory))
;;            (files (directory-files this-directory t "^[^\\.]")))

;;       ;; completely canonicalize the directory name (*may not* begin with `~')
;;       (while (not (string= this-directory
;;                            (expand-file-name this-directory)))
;;         (setq this-directory (expand-file-name this-directory)))

;;       (let ((files
;;              (directory-files this-directory t "^[^.]+\\.el$" nil)))
;;         (while files
;;           (let ((srcfile (car files))
;;                 (dstfile (concat (car files) "c")))
;;             (if (or (not (file-exists-p dstfile))
;;                     (file-newer-than-file-p srcfile dstfile))
;;                 (progn
;;                   (byte-compile-file srcfile)
;;                   (message "* ---[ Byte compiling `%s'... ]---" srcfile))
;;               (message "* ---[ `%s' exists and is newer. ]---" dstfile))
;;             (load-file dstfile)
;;             (message "* ---[ Loading `%s'... ]---" dstfile))
;;           (setq files (cdr files)))))

;;     (when with-subdirs
;;       (while files
;;         (setq dir-or-file (car files))
;;         (when (file-directory-p dir-or-file)
;;           (if recursive
;;               (xy/require-all-lisps dir-or-file
;;                                     'with-subdirs 'recursive)
;;             (xy/require-all-lisps dir-or-file)))
;;         (setq files (cdr files))))))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/done ()
  "Close a buffer and make Emacs frame invisible.\
Improved C-x C-c."
  (interactive)
  (save-some-buffers)
  (kill-this-buffer)
  (Windows
   (server-edit)
   (when window-system
     (make-frame-invisible nil t)))
  (GNULinux
     (save-buffers-kill-terminal)))

;;--------------------------------------------------------------------
;; NOTE: With this macro, `server-start', `server-force-delete', and
;; `emacs --daemon' works properly even when there is an emacs server
;; running, when you set `delete-by-moving-to-trash' to true.
;; REF: (@url :file-name "http://superuser.com/questions/176207/emacs-daemon-not-deleting-socket" :display "Post")

(defmacro bypass-trash-in-function (fun)
  "Set FUN to always use normal deletion, and never trash.

Specifically, the value of `delete-by-moving-to-trash' will be
set to nil inside FUN, so any deletions that happen inside FUN or
any functions called by it will bypass the trash."
  `(defadvice ,fun (around no-trash activate)
     "Ignore `delete-by-moving-to-trash' inside this function.

See `bypass-trash-in-function' for more information."
     (let (delete-by-moving-to-trash)
       ad-do-it)))

;;--------------------------------------------------------------------
;;;###autoload
(defun xy/emacs-build ()
  "Compile my Emacs configurations, local lisps, and generate
 autoloads for them."

  (interactive)
  (setq debug-on-error t)

  ;; NOTE: ecb and cedet are closely related, ecb must be byte-compiled
  ;; with cedet. Just activate ecb without byte-compiled lisps, then
  ;; run `M-x ecb-byte-compile'.

  ;; emacswiki lisps
  (xy/install-lisps my-emacswiki-lisp-path)

  ;; downloaded lisps
  (xy/install-lisps my-local-lisp-path)
  (xy/install-lisps (concat my-local-lisp-path "/ac-math"))
  (xy/recompile-dir
   (concat my-local-lisp-path "/auctex") 'with-subdirs 'recursive)
  ;; (xy/install-lisps (concat my-local-lisp-path "/apel"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/flim"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/semi"))
  (xy/install-lisps (concat my-local-lisp-path "/cc-mode-5.32.3"))
  (xy/install-lisps (concat my-local-lisp-path "/command-log-mode"))
  (xy/install-lisps (concat my-local-lisp-path "/dea"))
  (xy/install-lisps (concat my-local-lisp-path "/eim-2.4"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/elib-1.0"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/mule-ucs-20061127-1/lisp"))
  (xy/install-lisps (concat my-local-lisp-path "/emacs-w3m/shimbun"))
  (xy/install-lisps (concat my-local-lisp-path "/emacs-w3m"))
  (xy/install-lisps (concat my-local-lisp-path "/eim-2.4"))
  (xy/install-lisps (concat my-local-lisp-path "/google-weather-el"))
  (xy/install-lisps (concat my-local-lisp-path "/hideshow-org"))
  (xy/install-lisps (concat my-local-lisp-path "/ibus-el-0.3.2"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/mailcrypt-3.5.8"))
  (xy/install-lisps (concat my-local-lisp-path "/matlab-emacs"))
  (xy/install-lisps (concat my-local-lisp-path "/mew-6.5"))

  ;; git submodules
  (xy/install-lisps (concat my-git-lisp-path "/anything-config"))
  (xy/install-lisps (concat my-git-lisp-path "/anything-config/extensions"))
  (xy/install-lisps (concat my-git-lisp-path "/anything-config/contrib"))
  (xy/install-lisps (concat my-git-lisp-path "/o-blog"))
  (xy/install-lisps (concat my-git-lisp-path "/org2blog"))

  ;; ELPA lisps
  (xy/recompile-dir my-elpa-lisp-path 'with-subdirs 'recursive)

  ;; my own lisps
  (xy/install-lisps my-own-lisp-path 'with-subdirs 'recursive)

  (load-dot-emacs-file))

(provide 'xy-rc-utils)
