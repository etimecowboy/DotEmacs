;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-07-22 Sat 13:04 by xin on xinud>
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



;;; Definitions
;;;; System variables
;;;;; Important pathes
(defvar my-emacs-sys-path (expand-file-name "~/.emacs.d")
  "Name of root directory where all user configuration files reside.")
(defvar my-git-lisp-path (expand-file-name "git-lisps" my-emacs-sys-path)
  "Name of directory where Emacs Lisp files of git submodules reside.")
(defvar my-local-lisp-path (expand-file-name "lisps" my-emacs-sys-path)
  "Name of directory where manually installed Emacs Lisp files reside.")
(defvar my-elpa-lisp-path (expand-file-name "elpa" my-emacs-sys-path)
  "Name of directory where ELPA Emacs Lisp files reside.")
(defvar my-emacswiki-lisp-path (expand-file-name "emacswiki" my-emacs-sys-path)
  "Name of directory where lisps downloaded from EmacsWiki.")
(defvar my-own-lisp-path (expand-file-name "my-lisps" my-emacs-sys-path)
  "Name of directory where my own Emacs Lisp files reside.")
(defvar my-init-lisp-path (expand-file-name "init" my-own-lisp-path)
  "Name of diretory where my init Emacs Lisp files reside.")
(defvar my-local-image-path (expand-file-name "icons" my-emacs-sys-path)
  "Name of diretory where my local icon files reside.")
(defvar my-local-exec-path (expand-file-name "bin" my-emacs-sys-path)
  "Name of diretory where my local executive binaries reside.")
(defvar my-local-info-path (expand-file-name "info" my-emacs-sys-path)
  "Name of diretory where my local info files reside.")
(defvar my-local-man-path (expand-file-name "man" my-emacs-sys-path)
  "Name of diretory where my local man files reside.")
(defvar my-emacs-path (expand-file-name "~/emacs")
  "Name of directory where my working files reside.")
(defvar my-var-path (expand-file-name "var" my-emacs-sys-path)
  "Name of directory where my various Emacs log/record files reside.")

;;;;; Machine names --- which machine are we using?
(defvar using-office-pc
  (string-match "uos" (prin1-to-string (downcase system-name))))
(defvar using-home-desktop
  (string-match "p5q" (prin1-to-string (downcase system-name))))
(defvar using-laptop
  (string-match "s13" (prin1-to-string (downcase system-name))))
(defvar using-zbox
  (string-match "zbox" (prin1-to-string (downcase system-name))))
;; OS type --- are we running Microsoft Windows?
(defvar running-ms-windows
  (string-match "windows" (prin1-to-string system-type)))
(defvar running-gnu-linux
  (string-match "linux" (prin1-to-string system-type)))


;;;; System marcos
;;;;; Machine name --- which machine are we using?
(defmacro OfficePC (&rest body)
  (list
   'if (string-match
        "uos" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))

(defmacro HomeDesktop (&rest body)
  (list
   'if (string-match
        "p5q" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))

(defmacro Laptop (&rest body)
  (list
   'if (string-match
        "s13" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))

(defmacro Zbox (&rest body)
  (list
   'if (string-match
        "zbox" (prin1-to-string (downcase system-name)))
   (cons 'progn body)))

;;;;; OS type --- are we running GNU Linux?
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

;;;;; Graphic mode --- are we running any window system ?
(defmacro XLaunch (&rest body)
  (list 'if (eq window-system 'x)(cons 'progn body)))

;;;;; Emacs version
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



;;;; c/c++ include dir
(Windows

 (defvar my-mingw-path (expand-file-name "D:/opt/msys64/mingw64")
   "mingw-w64 installation path in the Windows system.")

 (defvar user-include-dirs
   '(;; User header files
     "." "./include" "./inc" "./common" "./public"
     ".." "../include" "../inc" "../common" "../public"
     "../.." "../../include" "../../inc" "../../common" "../../public"
     ;; GCC header files
     "D:/opt/msys64/mingw64/include"
     "D:/opt/msys64/mingw64/x86_64-w64-mingw32/include"
     "D:/opt/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/5.3.0/include"
     ;; MSYS2 header files
     "D:/opt/msys64/usr/include"
     ;; VC 12 header files
     "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/include"
     "C:/Program Files (x86)/Microsoft Visual Studio 12.0/VC/atlmfc/include"
     )
   "User include dirs for c/c++ mode")

 ;; (defvar c-preprocessor-symbol-files
 ;;   '(;; "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include/c++/bits/c++0x_warning.h"
 ;;     ;; "D:/Microsoft Visual Studio/VC98/Include/xstddef"
 ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/yvals.h"
 ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/crtdefs.h"
 ;;     )
 ;;   "Preprocessor symbol files for cedet")
 
 (Laptop
  (defvar my-mingw-path (expand-file-name "E:/program/MinGW")
    "MinGW installation path in the Windows system.")

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

  ;; (defvar c-preprocessor-symbol-files
  ;;   '(;; "E:/program/MinGW/lib/gcc/mingw32/4.5.2/include/c++/bits/c++0x_warning.h"
  ;;     ;; "D:/Microsoft Visual Studio/VC98/Include/xstddef"
  ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/yvals.h"
  ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/crtdefs.h"
  ;;     )
  ;;   "Preprocessor symbol files for cedet")
  )
 
 (OfficePC
  (defvar my-mingw-path (expand-file-name "C:/Protable/MinGW")
    "MinGW installation path in the Windows system.")

  (defvar user-include-dirs
    '(;; User header files
      "." "./include" "./inc" "./common" "./public"
      ".." "../include" "../inc" "../common" "../public"
      "../.." "../../include" "../../inc" "../../common" "../../public"
      ;; GCC header files
      "C:/Protable/MinGW/include"
      "C:/Protable/MinGW/include/sys"
      "C:/Protable/MinGW/include/ddk"
      "C:/Protable/MinGW/include/gdiplus"
      "C:/Protable/MinGW/include/GL"
      "C:/Protable/MinGW/include/libltdl"
      "C:/Protable/MinGW/include/sys"
      "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include"
      "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include/c++"
      "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include/c++/backward"
      "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include-fixed"
      "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/finclude"
      ;; MSYS header files
      ;; "C:/Protable/MinGW/msys/1.0/include"
      ;; VC 6 header files
      ;; "D:/Microsoft Visual Studio/VC98/Include"
      ;; "D:/Microsoft Visual Studio/VC98/MFC/Include"
      ;; VC 10 header files
      ;; "D:/Microsoft Visual Studio 10.0/VC/include"
      ;; Winpcap headers, better to be copied to project directory
      ;; "D:/WpdPack/Include"
      )
    "User include dirs for c/c++ mode")

  ;; (defvar c-preprocessor-symbol-files
  ;;   '(;; "C:/Protable/MinGW/lib/gcc/mingw32/4.8.1/include/c++/bits/c++0x_warning.h"
  ;;     ;; "D:/Microsoft Visual Studio/VC98/Include/xstddef"
  ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/yvals.h"
  ;;     ;; "C:/Program Files/Microsoft Visual Studio 10.0/VC/include/crtdefs.h"
  ;;     )
  ;;   "Preprocessor symbol files for cedet")
  )
 )

(GNULinux
 (defvar user-include-dirs
   '(;; User header files
     "." "./include" "./inc" "./common" "./public"
     ".." "../include" "../inc" "../common" "../public"
     "../.." "../../include" "../../inc" "../../common" "../../public"
     "/usr/include" "/usr/local/include")
   "User include dirs for c/c++ mode")

 ;; (defvar c-preprocessor-symbol-files '()
 ;;   "Preprocessor symbol files for cedet")
 )



;;; F.Niessen's utilities in his .emacs
;; REF: (@url :file-name "http://www.mygooglest.com/fni/dot-emacs.html" :display "Website")
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

      ;; (message "* ---[ Adding `%s' to load-path... ]---" this-directory)
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

;; TODO: try to wirte a new add-to-load-path function
;; REF: emacs@newsmth by SeaCat
;; 最好在.emacs开头用个递归的命令，每次启动都把~/.emacs.d目录下的
;; 所有子目录都加入到load-path里去，这样就比较方便以后安装扩展包了。
;; 只要丢到~/.emacs.d里，然后(require ....)一下就OK了，
;; 也不用操心那些load-path的事情了。
;; 这个命令是从版上copy来的，我自己加了一句删除重复的load-path。
;; 一并贴上来吧。
;; (let* ((dir (expand-file-name "~/.emacs.d/my-lisps"))
;;        (default-directory dir))
;;   (when (file-directory-p dir)
;;     (add-to-list 'load-path dir)
;;     (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;         (normal-top-level-add-subdirs-to-load-path)))
;;   (delete-dups load-path))

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

      ;; (message "* ---[ Adding `%s' to image-load-path... ]---" this-directory)
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



(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")

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

;; ;;;###autoload
;; (defun my-make-directory-yes-or-no (dir)
;;   "Ask user to create the DIR, if it does not already exist."

;;   (if dir
;;       (if (not (file-directory-p dir))
;;           (if (yes-or-no-p
;;                (concat "The directory `" dir
;;                        "' does not exist currently. Create it? "))
;;               (make-directory dir t)
;;             (error
;;              (concat "Cannot continue without directory `" dir "'"))))
;;     (error "my-make-directory-yes-or-no: missing operand")))

;; ;;;###autoload
;; (defun my-file-executable-p (file)
;;   "Make sure the file FILE exists and is executable."
;;   (if file
;;       (if (file-executable-p file)
;;           file
;;         (message "* ---[ WARNING: Can't find executable `%s' ]---" file)
;;         ;; sleep 1 s so that you can read the warning
;;         (sit-for 1))
;;     (error "my-file-executable-p: missing operand")))



;;; From ahei-misc.el

(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND,
LOCAL. HOOKS can be one list or just a hook."

  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, and evaluate BODY there
like `progn'. See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))



;; REF: (@url :file-name "http://milkbox.net/note/single-file-master-emacs-configuration/" :display "By Donald Curtis (Milkypostman, the proprietor of the Melpa archive)")
(defmacro After (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))


;;; Emacs auto font selection for different OS
;; REF: (@url :file-name "http://emacser.com/torture-emacs.htm" :display "emacser")
(defun qiang-font-existsp (font)
  "判断某个字体在系统中是否安装"
  (if (null (x-list-fonts font))
      nil t))

;; Example: 按顺序找到一个字体列表( list ) 中第一个已经安装可用的字体
;; (defvar font-list
;;   '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
;; ;; (require 'cl) ;; find-if is in common list package
;; (find-if #'qiang-font-existsp font-list)

(defun qiang-make-font-string (font-name font-size)
  "产生带上 font size 信息的 font 描述文本"
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

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
                    ;; :size chinese-font-size
                    ;; HACK: don't set fixed size for Chinese fonts, or
                    ;; you won't be able to rescale Chinese characters.
                    )))
    ;; Set the default English font
    ;; NOTE: The following 2 method cannot make the font settig work
    ;; in new frames.
    ;; (set-frame-font "Consolas:pixelsize=18")
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
;;       i1l|!0oO{[()]}<>?/¬`'"%^+-~#@*:;\

;;; bhj's font setting
;; REF: (@url :file-name "https://raw.github.com/baohaojun/system-config/master/.emacs_d/lisp/bhj-fonts.el" :display "baohaojun's font setting")
;;      (@url :file-name "http://att.newsmth.net/nForum/#!article/Emacs/104729" :display "article by flonk@newsmth")
;;      (@url :file-name "http://att.newsmth.net/nForum/#!article/Emacs/104728" :display "article by flonk@newsmth")
;;      (@url :file-name "http://baohaojun.github.io/blog/2012/12/19/perfect-emacs-chinese-font.html" :display "《狠狠地折腾了一把Emacs中文字体》by baohaojun (flonk)")
;;      (@url :file-name "http://baohaojun.github.io/blog/2013/05/09/0-emacs-font-global-scaling.html" :display "《全局放大Emacs字体》by baohaojun (flonk)")
;; NOTE: 中英文等宽且等高

;; ;;;###autoload
;; (defun bhj-font-existsp (font)
;;   "判断某个字体在系统中是否安装"
;;   (if (null (x-list-fonts font))
;;       nil t))

;; ;;;###autoload
;; (defun bhj-make-font-string (font-name font-size)
;;   "产生带上 font size 信息的 font 描述文本"
;;   (if (and (stringp font-size)
;;            (equal ":" (string (elt font-size 0))))
;;       (format "%s%s" font-name font-size)
;;     (format "%s-%s" font-name font-size)))

;; (defvar bhj-english-font-size nil)

;; ;;;###autoload
;; (defun bhj-set-font (english-fonts
;;                      english-font-size
;;                      chinese-fonts)
;;   "自动为不同字符集设置字体

;; english-font-size could be set to \":pixelsize=18\" or a integer.
;; If set/leave chinese-font-size to nil, it will follow english-font-size"
;;   (require 'cl)                         ; for find if
;;   (setq bhj-english-font-size english-font-size)
;;   (let ((en-font (bhj-make-font-string
;;                   (find-if #'bhj-font-existsp english-fonts)
;;                   english-font-size))
;;         (zh-font (font-spec :family (find-if #'bhj-font-existsp chinese-fonts))))

;;     ;; Set the default English font
;;     ;;
;;     ;; The following 2 method cannot make the font settig work in new frames.
;;     ;; (set-frame-font "Consolas:pixelsize=18")
;;     ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
;;     ;; We have to use set-face-attribute
;;     (set-face-attribute 'default nil :font en-font)
;;     ;; NOTE: italic font has been changed
;;     (set-face-font 'italic (font-spec :family "Courier New"
;;                                       :slant 'italic
;;                                       :weight 'normal
;;                                       :size (+ 0.0 english-font-size)))
;;     (set-face-font 'bold-italic (font-spec :family "Courier New"
;;                                            :slant 'italic
;;                                            :weight 'bold
;;                                            :size (+ 0.0 english-font-size)))
;;     ;; Set Chinese font
;;     ;; Do not use 'unicode charset, it will cause the english font setting invalid
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;       (set-fontset-font t charset zh-font))))

;; ;; Example usage:
;; ;; (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))
;; ;; (defvar bhj-english-fonts '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New"))
;; ;; (defvar bhj-chinese-fonts '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

;; ;; (bhj-set-font
;; ;;  bhj-english-fonts
;; ;;  (if (file-exists-p "~/external/etc/.emacs-frame-font")
;; ;;      (save-excursion
;; ;;        (find-file "~/external/etc/.emacs-frame-font")
;; ;;        (goto-char (point-min))
;; ;;        (let ((monaco-font-size (read (current-buffer))))
;; ;;          (kill-buffer (current-buffer))
;; ;;          monaco-font-size))
;; ;;    12.5)
;; ;;  bhj-chinese-fonts)

;; ;; Nicely font rescaling
;; (defvar bhj-english-font-size-steps '(10.5 11.5 12.5 14 18 22))
;; (defvar bhj-english-font-size-steps-dec (reverse bhj-english-font-size-steps))

;; (defun bhj-step-frame-font-size (step)
;;   (let ((steps bhj-english-font-size-steps)
;;         next-size)
;;     (if (< step 0)
;;         (setq steps bhj-english-font-size-steps-dec))
;;     (setq next-size
;;           (cadr (member bhj-english-font-size steps)))
;;     (when next-size
;;         (message "Your font size is set to %.1f" next-size)
;;         (bhj-set-font bhj-english-fonts next-size bhj-chinese-fonts))))

;; ;; Key bindings
;; ;; (global-set-key [(control x) (meta -)] (lambda () (interactive) (bhj-step-frame-font-size -1)))
;; ;; (global-set-key [(control x) (meta +)] (lambda () (interactive) (bhj-step-frame-font-size 1)))
;; ;; (set-face-attribute 'default nil :font (font-spec))

;; ;;;###autoload
;; (defun bhj-text-scale-increase ()
;;   "Increase font size while keeping Latin characters and Chinese \\
;; characters aligned both horizontally and vertically."
;;   (interactive)
;;   (bhj-step-frame-font-size 1))

;; ;;;###autoload
;; (defun bhj-text-scale-decrease ()
;;   "Decrease font size while keeping Latin characters and Chinese \\
;; characters aligned both horizontally and vertically."
;;   (interactive)
;;   (bhj-step-frame-font-size -1))

; {%org-mode%}
; here are 20 hanzi and 40 english chars, see if they are the same width
; 你你你你你你你你你你你你你你你你你你你你
; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/
; {%/org-mode%}


;;; Scalable Chinese font settings
;; NOTE: not working
;; REF: http://att.newsmth.net/nForum/#!article/Emacs/103607
;; BUG: 汉字宽度和英文字符宽度不匹配，不成整倍数
;;
;; ;;;###autoload
;; (defun my-font-scale (my-font-size my-font-scale)
;;   (when window-system
;;     (message "%f.%f" my-font-size my-font-scale)
;;     (qiang-set-font
;;      '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
;;      my-font-size '("Microsoft Yahei" "微软雅黑" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
;;     (setq face-font-rescale-alist
;;           '(("微软雅黑" . my-font-scale)
;;             ("Microsoft Yahei" . my-font-scale)
;;             ("WenQuanYi Micro Hei Mono" . my-font-scale)
;;             ("WenQuanYi Zen Hei" . my-font-scale)))
;;     (set-face-attribute 'default nil :font (font-spec)))))

;; ;;;###autoload
;; (defun my-font-settings ()
;;   (cond ((eq window-system 'x)
;;          (my-font-scale 10.5 1.2))
;;         ((eq window-system 'w32)
;;          (my-font-scale 11 1.1))))

;; ;; Uncomment the following code if emacs daemon is in use
;; (if (and (fboundp 'daemonp) (daemonp))
;;     (add-hook 'after-make-frame-functions
;;               (lambda (frame)
;;                 (with-selected-frame frame
;;                   (my-font-settings))))
;;   (my-font-settings))



;; Another simple font
;; REF: http://att.newsmth.net/nForum/#!article/Emacs/103607
;; BUG: 汉字宽度和英文字符宽度不匹配，不成整倍数
;; (set-face-attribute 'default nil :font "Monaco 10")

;; ;; 中文字体
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font t
;;                     charset
;;                     (font-spec :family "Microsoft Yahei")))
;; (setq face-font-rescale-alist '(("Monaco" . 1.0) ("Microsoft Yahei" . 1.2)))



;;; My font functions
;;;; Use qiang's font setting, fixed font size
;; ;;;###autoload
;; (defun xy/set-font-default ()
;;   "My default Emacs font setting."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '("Consolas" "Monaco" ;; NOTE: "DejaVu Sans Mon" = "Monospace"
;;          "DejaVu Sans Mono" "Monospace" "Courier") ":pixelsize=14"
;;          '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 16)
;;     ;; 默认字体，term 下的字体
;;     (set-frame-font "Monospace 12")))

;; ;;;###autoload
;; (defun xy/set-font-default-big ()
;;   "My default Emacs font setting."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '("Consolas" "Monaco" ;; NOTE: "DejaVu Sans Mon" = "Monospace"
;;          "DejaVu Sans Mono" "Monospace" "Courier") ":pixelsize=18"
;;          '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 20)
;;     ;; 默认字体，term 下的字体
;;     (set-frame-font "Monospace 16")))

;; ;;;###autoload
;; (defun xy/set-font-prog ()
;;   "Set font for programming."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '(;; "mplus Nerd Font" 
;;          ;; "SauceCodePro Nerd Font"
;;          ;; "DejaVuSansMonoForPowerline Nerd Font"         
;;          ;; "ProFontWindows Nerd Font"
;;          ;; "AurulentSansMono Nerd Font"
;;          ;; "Knack Nerd Font"
;;          ;; "UbuntuMono Nerd Font"
;;          "DejaVu Sans Mono"
;;          "Consolas"
;;          "Monospace" 
;;          "Courier") ":pixelsize=11"
;;          '("Microsoft Yahei" "STHeiti" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 14)
;;     ;; 默认字体，term 下的字体
;;     (set-frame-font "Monospace 9")))

;; ;;;###autoload
;; (defun xy/set-font-prog-big ()
;;   "Set font for programming (big)."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '("mplus Nerd Font"
;;          ;; "SauceCodePro Nerd Font"
;;          ;; "DejaVuSansMonoForPowerline Nerd Font"         
;;          ;; "ProFontWindows Nerd Font"
;;          ;; "AurulentSansMono Nerd Font"
;;          ;; "Knack Nerd Font"
;;          ;; "UbuntuMono Nerd Font"
;;          "DejaVu Sans Mono"
;;          "Consolas"
;;          "Monospace" 
;;          "Courier") ":pixelsize=14"
;;          '("Microsoft Yahei" "STHeiti" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 20)
;;     ;; 默认字体，term 下的字体
;;     (set-frame-font "Monospace 14")))

;; ;;;###autoload
;; (defun xy/set-font-write ()
;;   "Set font for writing."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '("Hurmit Nerd Font"
;;          "Monaco" "Monospace" "Consolas"
;;          "Courier" "DejaVu Sans Mono") ":pixelsize=14"  ;; 14
;;          '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 18) ;; 16
;;     (set-frame-font "Monospace 12")))

;; ;;;###autoload
;; (defun xy/set-font-write-big ()
;;   "Set font for writing (big)."
;;   (interactive)
;;   (if window-system
;;       (qiang-set-font
;;        '("Hurmit Nerd Font"
;;          "Monaco" "Monospace" "Consolas"
;;          "Courier" "DejaVu Sans Mono") ":pixelsize=16" ;; 17
;;          '("Microsoft Yahei" "文泉驿等宽正黑" "文泉驿等宽微米黑"
;;            "黑体") 20) ;; 20
;;     (set-frame-font "Monospace 16")))

;; Monofur+STHeiti字体组合，可以一齐缩放
;; ;;;###autoload
;; (defun xy/set-font-Monofur-STHeiti ()
;;   "My Emacs font setting for writing articles."
;;   (interactive)
;;   (when window-system
;;       (bhj-set-font '("Monofur") 11 '("华文黑体"))
;;     ;; (set-frame-font "Monospace 11")
;;     ))

;;;; Use bhj's font setting
;; ;;;###autoload
;; (defun xy/set-font-default()
;;   "My Emacs default font setting."
;;   (interactive)
;;   (setq bhj-english-fonts '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New"))
;;   ;; (setq bhj-english-fonts '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New"))
;;   (setq bhj-chinese-fonts '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
;;   (when window-system
;;     (setq scalable-fonts-allowed t) ;; Use scalable fonts
;;     (set-face-attribute 'default nil :font (font-spec))
;;     (GNULinux
;;      (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2)
;; 				     ("WenQuanYi Zen Hei" . 1.2)))
;;      (bhj-set-font bhj-english-fonts 10.5 bhj-chinese-fonts))
;;     (Windows
;;      (setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2)
;; 				     ("WenQuanYi Zen Hei" . 1.2)))
;;       (bhj-set-font bhj-english-fonts 9 bhj-chinese-fonts))))

;;;; Test bench
;; ;;;###autoload
;; (defun xy/set-font-default()
;;   "My Emacs default font setting. Tips: use scale-down only."
;;   (interactive)
;;   (setq xy:english-fonts '(;; "Input Mono Narrow" ;;
;;                            ;; "Input Mono Compressed" ;; best font for coding, but too narrow when combines with chinese
;;                            "mplus Nerd Font"   ;; not good for scaling with chinese
;;                            ;; "Hurmit Nerd Font"  ;; ok, but not perfect scalling
;;                            ;; "SauceCodePro Nerd Font" ;; better than hurmit but not perfect
;;                            "DejaVuSansMonoForPowerline Nerd Font" ;; old best, not perfect
;;                            ;; "ProFontWindows Nerd Font" ;; small font for programming
;;                            ;; "AurulentSansMono Nerd Font"
;;                            ;; "Knack Nerd Font"
;;                            ;; "UbuntuMono Nerd Font"
;;                            "DejaVu Sans Mono"
;;                            "Consolas" "Monaco"
;;                            "Monospace" "Courier New"))
;;   (setq xy:chinese-fonts '(;; "FZZhunYuan-M02"     ;; good
;;                            ;; "FZZhanBiHei-M22S"   ;; very good
;;                            "FZYiHei-M20S"          ;; very good
;;                            ;; "FZXingKai-S04"      ;; too small
;;                            ;; "FZShaoEr-M11"       ;; good
;;                            ;; "FZMeiHei-M07"       ;; narrow font, fit mplus or input mono compressed
;;                            ;; "FZLiShu II-S06"     ;; good
;;                            ;; "FZLiShu-S01"        ;; too flat, too wide
;;                            ;; "FZKaTong-M19S"      ;; very good
;;                            ;; "FZJingLeiS-R-GB"    ;; too thin, too handwrite
;;                            ;; "FZFangSong-Z02"     ;; too thin
;;                            ;; "FZShuSong-Z01"      ;; too thin  
;;                            ;; "FZSongHei-B07"      ;; good
;;                            ;; "FZXiaoBiaoSong-B05" ;; good
;;                            ;; "FZKai-Z03"          ;; too thin
;;                            ;; "FZHei-B01"          ;; too thin
;;                            ;; "Adobe Song Std"     ;; too thin
;;                            "Microsoft Yahei" "微软雅黑"
;;                            "WenQuanyi Micro Hei Mono" "文泉驿等宽微米黑"
;;                            "WenQuanyi Zen Hei" "文泉驿正黑"
;;                            "黑体" "新宋体" "宋体" "YouYuan"))
;;   (when window-system
;;     (GnuLinux
;;      (setq scalable-fonts-allowed t    ;; Use scalable fonts
;;            text-scale-mode-step   1.1) ;; default 1.2

;;      (setq face-font-rescale-alist
;;            '(("mplus Nerd Font" . 1.1)
;;              ("FZZhunYuan-M02" . 1.2)
;;              ("FZZhanBiHei-M22S" . 1.2)
;;              ("FZYiHei-M20S" . 1.3) ;; start from 10 pt English font
;;              ("FZXingKai-S04" . 1.2)
;;              ("FZShaoEr-M11" . 1.2)
;;              ("FZMeiHei-M07" . 1.2)
;;              ("FZLiShu-S01" . 1.2)
;;              ("FZLiShu II-S06" . 1.2)
;;              ("FZKaTong-M19S" . 1.2)
;;              ("FZJingLeiS-R-GB" . 1.2)
;;              ("FZFangSong-Z02" . 1.2)
;;              ("FZShuSong-Z01" . 1.2)
;;              ("FZSongHei-B07" . 1.2)
;;              ("FZXiaoBiaoSong-B05" . 1.2)
;;              ("FZKai-Z03" . 1.2)
;;              ("FZHei-B01" . 1.2)
;;              ("YouYuan" . 1.2)
;;              ("Adobe Song Std" . 1.2)
;;              ("微软雅黑" . 1.2)
;;              ("Microsoft Yahei" . 1.2)
;;              ("文泉驿等宽微米黑" . 1.2)
;;              ("WenQuanYi Micro Hei Mono" . 1.2)
;;              ("文泉驿正黑" . 1.2)
;;              ("WenQuanYi Zen Hei" . 1.2)))
;;      (qiang-set-font xy:english-fonts 10 xy:chinese-fonts)) ;; default 11

;;     (Windows
;;      (setq scalable-fonts-allowed t    ;; Use scalable fonts
;;            text-scale-mode-step   1.22) ;; default 1.22
;;      (setq face-font-rescale-alist
;;            '(("FZKaTong-M19S" . 1.2)
;;              ("微软雅黑" . 1.22)
;;              ("Microsoft Yahei" . 1.22)
;;              ("文泉驿等宽微米黑" . 1.22)
;;              ("WenQuanYi Micro Hei Mono" . 1.22)
;;              ("文泉驿正黑" . 1.22)
;;              ("WenQuanYi Zen Hei" . 1.22)))
;;      (qiang-set-font xy:english-fonts 11 xy:chinese-fonts)))) ;; default 11

;;;; mplus + FZYiHei, loose alignment after scaling
;;;###autoload
(defun xy/set-font-mplus()
  "Set font. Small and narrow font that is perfect for coding on a vertical monitor."
  (interactive)
  (setq xy:english-fonts '("mplus Nerd Font"))
  (setq xy:chinese-fonts '("FZYiHei-M20S"))

  (when window-system
    (setq scalable-fonts-allowed t    ;; Use scalable fonts
          text-scale-mode-step   1.1) ;; default 1.2
    (setq face-font-rescale-alist
          '(("mplus Nerd Font" . 1.1)
            ("FZYiHei-M20S" . 1.2)
            ))
    (qiang-set-font xy:english-fonts 10 xy:chinese-fonts)))

;;;; InputMonoCompressed + FZMeiHei, loose alignment after scaling
;;;###autoload
(defun xy/set-font-InputMonoCompressed()
  "Set font. Compressed terminal font that is perfect for shell operations."
  (interactive)
  (setq xy:english-fonts '("Input Mono Compressed"))
  (setq xy:chinese-fonts '("FZMeiHei-M07"))

  (when window-system
    (setq scalable-fonts-allowed t    ;; Use scalable fonts
          text-scale-mode-step   1.1) ;; default 1.2
    (setq face-font-rescale-alist
          '(("Input Mono Compressed" . 1.1)
            ("FZMeiHei-M07" . 1.25) ;; scaling does not work on this font
            ))
    (qiang-set-font xy:english-fonts 10 xy:chinese-fonts)))

;;;; DejaVu Sans Mono + Microsoft YaHei
;;;###autoload
(defun xy/set-font-DejaVuSansMono()
  "Set font. Open source font that was ranked as the best font for coding."
  (interactive)
  (setq xy:english-fonts
        '("DejaVuSansMonoForPowerline Nerd Font"
          "DejaVu Sans Mono for Powerline"
          "DejaVu Sans Mono" ;; in case there is no nerd nor powerline fonts
         ))
  (setq xy:chinese-fonts '("Microsoft YaHei" "微软雅黑"))
  ;; (setq xy:chinese-fonts '("FZMeiHei-M07"))

  (when window-system
    (setq scalable-fonts-allowed t    ;; Use scalable fonts
          text-scale-mode-step   1.1) ;; default 1.2
    (setq face-font-rescale-alist
          '(("DejaVuSansMonoForPowerline Nerd Font" . 1.0)
            ("DejaVu Sans Mono for Powerline" . 1.0)
            ("DejaVu Sans Mono" . 1.0)
            ("Microsoft YaHei" . 1.25)
            ("微软雅黑" . 1.25)
            ))
    (qiang-set-font xy:english-fonts 10 xy:chinese-fonts)))

;;;; Consolas + Microsoft YaHei
;;;###autoload
(defun xy/set-font-Consolas()
  "Set font. Small microsoft coding font that is aviable on Windows Vista or above versions."
  (interactive)
  (setq xy:english-fonts
        '("Consolas"))
  (setq xy:chinese-fonts '("Microsoft YaHei" "微软雅黑"))

  (when window-system
    (setq scalable-fonts-allowed t    ;; Use scalable fonts
          text-scale-mode-step   1.1) ;; default 1.2
    (setq face-font-rescale-alist
          '(("Consolas" . 1.0)
            ("Microsoft YaHei" . 1.1)
            ("微软雅黑" . 1.1)
            ))
    (qiang-set-font xy:english-fonts 10 xy:chinese-fonts)))


;; ;; NOTE: simplified version of the above function
;; ;; BUG: not working, why?
;; ;;;###autoload
;; (defun xy/set-font-and-scale (xy:font-size xy:chinese-font-scale)
;;   "Set Emacs font, font size, and Chinese font scale factor under \\
;; window system."
;;   (when window-system
;;     (setq xy:english-fonts '("DejaVu Sans Mono" "Consolas" "Monaco"
;;                              "Monospace" "Courier New"))
;;     (setq xy:chinese-fonts '("Microsoft Yahei" "微软雅黑"
;;                              "WenQuanyi Micro Hei Mono" "文泉驿等宽微米黑"
;;                              "WenQuanyi Zen Hei" "文泉驿正黑"
;;                              "黑体" "新宋体" "宋体"))
;;     (setq face-font-rescale-alist
;;           '(("微软雅黑" . xy:chinese-font-scale)
;;             ("Microsoft Yahei" . xy:chinese-font-scale)
;;             ("文泉驿等宽微米黑" . xy:chinese-font-scale)
;;             ("WenQuanYi Micro Hei Mono" . xy:chinese-font-scale)
;;             ("文泉驿正黑" . xy:chinese-font-scale)
;;             ("WenQuanYi Zen Hei" . xy:chinese-font-scale)))
;;     (qiang-set-font xy:english-fonts xy:font-size xy:chinese-fonts)
;;     ;; (set-face-attribute 'default nil :font (font-spec))
;;     (message "Set font size to %f. Scale Chinese font size by %f."
;;              xy:font-size xy:chinese-font-scale)))

;;;; Simple font setting
;; ;;;###autoload
;; (defun xy/set-font-default ()
;;   "Set Emacs font."
;;   (interactive)
;;   (setq scalable-fonts-allowed t    ;; Use scalable fonts
;;         text-scale-mode-step   1.2) ;; default
;;   (GNULinux
;;    (xy/set-font-and-scale 10.5 1.2))
;;   (Windows
;;    (xy/set-font-and-scale 9 1.2)))

;; NOTE: 不需要qiang的函数
;; ;;;###autoload
;; (defun xy/set-font-default-mix ()
;;   "My Emacs font setting for writing articles."
;;   (interactive)
;;   (if window-system
;;       (progn
;;         ;; Setting default Font
;;         (set-frame-font "Monofur 11")
;;         ;; Setting English Font
;;         (set-face-attribute 'default nil :font "Monofur")
;;         ;; (setq default-frame-list (append '((font . "Monofur"))
;;         ;;                                  default-frame-alist))
;;         ;; Chinese Font
;;         (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;           (set-fontset-font (frame-parameter nil 'font)
;;                             charset
;;                             (font-spec :family "STHeiti"))))
;;     (set-frame-font "Monospace")))


;;; For compatibility among different version of Emacs

;; NOTE: the following 3 functions are used in `template.el', and
;; `session.el'

;; ;; General Emacs/XEmacs-compatibility compile-time macros
;; ;;;###autoload
;; (defmacro cond-emacs-xemacs (&rest args)
;;   (cond-emacs-xemacs-macfn
;;    args "`cond-emacs-xemacs' must return exactly one element"))

;; ;;;###autoload
;; (defun cond-emacs-xemacs-macfn (args &optional msg)
;;   (if (atom args) args
;;     (and (eq (car args) :@) (null msg) ; (:@ ...spliced...)
;;          (setq args (cdr args)
;;                msg "(:@ ....) must return exactly one element"))
;;     (let ((ignore
;;            (if (string-match "XEmacs" emacs-version) :EMACS :XEMACS))
;;           (mode :BOTH) code)
;;       (while (consp args)
;;         (if (memq (car args)
;;                   '(:EMACS :XEMACS :BOTH)) (setq mode (pop args)))
;;         (if (atom args)
;;             (or args (error "Used selector %s without elements" mode))
;;           (or (eq ignore mode)
;;               (push (cond-emacs-xemacs-macfn (car args)) code))
;;           (pop args)))
;;       (cond (msg (if (or args (cdr code)) (error msg) (car code)))
;;             ((or (null args) (eq ignore mode)) (nreverse code))
;;             (t (nconc (nreverse code) args))))))

;; ;; Emacs/XEmacs-compatibility `defun': remove interactive "_" for
;; ;; Emacs, use existing functions when they are `fboundp', provide
;; ;; shortcuts if they are known to be defined in a specific Emacs
;; ;; branch (for short .elc)
;; ;;;###autoload
;; (defmacro defunx (name arglist &rest definition)
;;   (let ((xemacsp (string-match "XEmacs" emacs-version)) reuses first)
;;     (while (memq (setq first (car definition))
;;                  '(:try :emacs-and-try :xemacs-and-try
;;                         :emacs-only :xemacs-only))
;;       (if (memq first (if xemacsp
;;                           '(:xemacs-and-try :xemacs-only)
;;                         '(:emacs-and-try :emacs-only)))
;;           (setq reuses (cadr definition)
;;                 definition nil)
;;         (unless (memq first '(:emacs-only :xemacs-only))
;;           (push (cadr definition) reuses)))
;;       (setq definition (cddr definition)))
;;     (if (and reuses (symbolp reuses))
;;         `(defalias ',name ',reuses)
;;       (let* ((docstring
;;               (if (stringp (car definition)) (pop definition)))
;;              (spec (and (not xemacsp)
;;                         (eq (car-safe (car definition))
;;                             'interactive)
;;                         (null (cddar definition))
;;                         (cadar definition))))
;;         (if (and (stringp spec)
;;                  (not (string-equal spec ""))
;;                  (eq (aref spec 0) ?_))
;;             (setq definition
;;                   (cons (if (string-equal spec "_")
;;                             '(interactive)
;;                           `(interactive ,(substring spec 1)))
;;                         (cdr definition))))
;;         (if (null reuses)
;;             `(defun ,name ,arglist ,docstring
;;                ,@(cond-emacs-xemacs-macfn definition))
;;           ;; no dynamic docstring in this case
;;           `(eval-and-compile        ; no warnings in Emacs
;;              (defalias ',name
;;                (cond ,@(mapcar
;;                         (lambda (func) `((fboundp ',func) ',func))
;;                         (nreverse reuses))
;;                      (t ,(if definition
;;                              `(lambda ,arglist ,docstring
;;                                 ,@(cond-emacs-xemacs-macfn
;;                                    definition))
;;                            'ignore))))))))))

;; (when (>= 21 emacs-major-version)
;;   (defalias 'move-beginning-of-line 'beginning-of-line)
;;   (defalias 'move-end-of-line       'end-of-line))


;; ;;;; 定义一些emacs 21没有的函数
;; (when is-before-emacs-21
;;     '(progn
;;        (defun line-number-at-pos (&optional pos)
;;      "Return (narrowed) buffer line number at position POS.
;; If POS is nil, use current buffer location. Counting starts
;; at (point-min), so the value refers to the contents of the
;; accessible portion of the buffer."

;;      (let ((opoint (or pos (point))) start)
;;        (save-excursion
;;          (goto-char (point-min))
;;          (setq start (point))
;;          (goto-char opoint)
;;          (forward-line 0)
;;          (1+ (count-lines start (point))))))


;;        (defun looking-back (regexp &optional limit greedy)
;;      "Return non-nil if text before point matches regular
;; expression REGEXP. Like `looking-at' except matches before point,
;; and is slower. LIMIT if non-nil speeds up the search by
;; specifying a minimum starting position, to avoid checking matches
;; that would start before LIMIT.

;; If GREEDY is non-nil, extend the match backwards as far as possible,
;; stopping when a single additional previous character cannot be part
;; of a match for REGEXP."
;;      (let ((start (point))
;;            (pos
;;         (save-excursion
;;           (and (re-search-backward
;;             (concat "\\(?:" regexp "\\)\\=") limit t)
;;                (point)))))
;;        (if (and greedy pos)
;;            (save-restriction
;;          (narrow-to-region (point-min) start)
;;          (while (and (> pos (point-min))
;;                  (save-excursion
;;                    (goto-char pos)
;;                    (backward-char 1)
;;                    (looking-at (concat
;;                         "\\(?:"
;;                         regexp
;;                         "\\)\\'"))))
;;            (setq pos (1- pos)))
;;          (save-excursion
;;            (goto-char pos)
;;            (looking-at (concat "\\(?:"  regexp "\\)\\'")))))
;;        (not (null pos))))
;;        ))

;;;; `make-local-hook' for `dictionary' and etc. packages

;; REF: (@url :file-name "http://lists.gnu.org/archive/html/bug-gnu-emacs/2012-03/msg00806.html" :display "Post1")
;; REF: (@url :file-name "http://lists.gnu.org/archive/html/bug-gnu-emacs/2012-03/msg00806.html" :display "Post2")
;; (defalias 'make-local-hook
;;   (if (featurep 'xemacs)
;;       'make-local-hook
;;     'ignore))
;; REF: (@url :file-name "http://lists.gnu.org/archive/html/bug-gnu-emacs/2012-03/msg00861.html" :display "Post3")
(defalias 'make-local-hook 'identity)



;;; My functions


;;;; Automatically set Emacs after it starts (for terminal-mode (daemon) and GUI-mode)
;; ;;;###autoload
;; (defun xy/emacs-start ()
;;   "Tasks been done after emacsclient first start."
;;   (interactive)
;;   (when window-system
;;     (xy/set-font-prog)
;;     ;; (custom-set-faces
;;     ;;  '(pp^L-highlight ((t (:overline t :weight extra-bold)))))
;;     (Windows ;; windows system should use the dark theme for eye protection
;;      (color-theme-solarized-dark))
;;     ;; (Linux ;; I am now using ~/.Xresources to set system-wide
;;               ;; solarized-dark theme in Linux
;;     ;;  (color-theme-solarized-dark))
;;     ;; (xy/toggle-fullscreen)
;;     )

;;   ;; (try-require 'anything) ;; BUG: `anything' or my settings cause
;;   ;; error when loading `emacs-w3m' (exe file `w3m' cannot be found in
;;   ;; /usr/bin) in Windows 7

;;   ;;(org-agenda 'nil "p")
;;   )


;;;; Smart fullscreen and maximize
;; NOTE: in emacs-snapshot/emacs-w64, <f11> has been bound to toggle-frame-fullscreen.

;; (defvar xy:fullscreen-flag nil)

;; ;;;###autoload
;; (defun xy/fullscreen ()
;;   "Enter fullscreen mode."
;;   (interactive)
;;   (when window-system
;;     ;; From: xiaoxuan@newsmth.net-SPAM.no (小轩)
;;     (setq xy:fullscreen-flag t)
;;     (set-frame-parameter nil 'fullscreen 'fullscreen)))

;; ;;;###autoload
;; (defun xy/toggle-fullscreen ()
;;   "Toggle fullscreen mode."
;;   (interactive)
;;   (when window-system
;;     (progn
;;       (GNULinux
;;        ;; From: xiaoxuan@newsmth.net-SPAM.no (小轩)
;;        (if xy:fullscreen-flag
;;            (progn
;;              (setq xy:fullscreen-flag nil)
;;              (set-frame-parameter nil 'fullscreen nil))
;;          (progn
;;            (setq xy:fullscreen-flag t)
;;            (set-frame-parameter nil 'fullscreen 'fullscreen))))

;;       (Windows ;; NOTE: Put `emacs_fullscreen.exe' in your $PATH, such as
;;        ;;       your `emacs.exe' folder.
;;        ;; REF: (@url :file-name "https://bitbucket.org/alexander_manenko/emacs-fullscreen-win32/wiki/Home" :display "Source:emacs-fullscreen-win32")
;;        ;; NOTE: not works with `autofit-frame.el'
;;        ;; ;; (setq autofit-frame-flag nil)
;;        ;; (shell-command "%HOME%/.emacs.d/bin/win32/emacs_fullscreen.exe")))))
;;        ;; Use patched fullscreen version Emacs
;;        (if xy:fullscreen-flag
;;            (progn
;;              (setq xy:fullscreen-flag nil)
;;              (set-frame-parameter nil 'fullscreen nil))
;;          (progn
;;            (setq xy:fullscreen-flag t)
;;            (set-frame-parameter nil 'fullscreen 'fullscreen)))))))



;; Setup Emacs

;;;; Reload init file
;;;###autoload
(defun load-dot-emacs-file ()
  (interactive)
  (load "init" 'noerror t t))

;;;; Open init file
;; ;;;###autoload
;; (defun open-init-dot-el-file ()
;;   (interactive)
;;   (find-file "~/.emacs.d/init.el"))


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
              ;; (message "* ---[ `%s' exists and is newer. ]---"  dstfile))
              ))
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
              ;; (message "* ---[ `%s' exists and is newer. ]---" dstfile)
              )

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
            (message "* ---[ Updating `%s'... ]---" generated-autoload-file))
          ;; (message "* ---[ `%s' exists and is newer. ]---"
          ;;          generated-autoload-file)
          )

        (load generated-autoload-file 'noerror t t)
        ;; (message "* ---[ Loading `%s'... ]---" generated-autoload-file)
	)

      (when with-subdirs
        (while files
          (setq dir-or-file (car files))
          (when (file-directory-p dir-or-file)
            (if recursive
                (xy/install-lisps dir-or-file
                                  'with-subdirs 'recursive)
              (xy/install-lisps dir-or-file)))
          (setq files (cdr files)))))))

;; NOTE: too heavy when running recursively
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
          (load generated-autoload-file 'noerror t t)
        (message "* ---[ Error: `%s' does not exist]"
                 generated-autoload-file)))))

;; ;;;###autoload
;; (defun xy/unload-all ()
;;   "unload all my customizations."

;;   ;; (when (featurep 'xy-rcroot-session)
;;   ;;   (unload-feature 'xy-rcroot-session t))
;;   ;; (when (featurep 'xy-rcroot-prog)
;;   ;;   (unload-feature 'xy-rcroot-prog t))
;;   ;; (when (featurep 'xy-rcroot-net)
;;   ;;   (unload-feature 'xy-rcroot-net t))
;;   ;; (when (featurep 'xy-rcroot-filemgr)
;;   ;;   (unload-feature 'xy-rcroot-filemgr t))
;;   ;; (when (featurep 'xy-rcroot-view)
;;   ;;   (unload-feature 'xy-rcroot-view t))
;;   ;; (when (featurep 'xy-rcroot-complete)
;;   ;;   (unload-feature 'xy-rcroot-complete t))
;;   ;; (when (featurep 'xy-rcroot-edit)
;;   ;;   (unload-feature 'xy-rcroot-edit t))
;;   ;; (when (featurep 'xy-rcroot-enhance)
;;   ;;   (unload-feature 'xy-rcroot-enhance t))
;;   ;; (when (featurep 'xy-rcroot-app)
;;   ;;   (unload-feature 'xy-rcroot-app t))
;;   (load "~/.emacs.d/my-lisps/init/xy-rc-utils.el")
;;   (load "~/.emacs.d/my-lisps/init/xy-rcroot-env.el"))

;;;###autoload
(defun xy/emacs-build ()
  "Compile my Emacs configurations, local lisps, and generate
 autoloads for them."

  (interactive)
  (setq debug-on-error t)

  ;; NOTE: not necessary after use a `after-save-file-hook' to delete
  ;; old elc files
  ;; ;; Delete old elc files
  ;; (let* ((file-el (concat my-init-lisp-path "/xy-rc-utils.el"))
  ;;        (file-elc (concat file-el "c")))
  ;;   (when (file-newer-than-file-p file-el file-elc)
  ;;     (delete-file file-elc nil)))
  ;; ;; (unload-feature 'xy-rc-utils t)
  ;; ;; (load file-el)))

  ;; (let* ((file-el (concat my-init-lisp-path "/xy-rcroot-env.el"))
  ;;        (file-elc (concat file-el "c")))
  ;;   (when (file-newer-than-file-p file-el file-elc)
  ;;     (delete-file file-elc nil)))
  ;; ;; (unload-feature 'xy-rcroot-env t)
  ;; ;; (load file-el)))

  (load "~/.emacs.d/my-lisps/init/xy-rc-utils.el")
  (load "~/.emacs.d/my-lisps/init/xy-rcroot-env.el")
  ;; emacswiki lisps
  (xy/install-lisps my-emacswiki-lisp-path)
  ;; downloaded lisps
  (xy/install-lisps my-local-lisp-path)
  (xy/install-lisps (concat my-local-lisp-path "/dea"))
  (xy/install-lisps (concat my-local-lisp-path "/eim-2.4"))
  ;; (xy/install-lisps (concat my-local-lisp-path "/o-blog-1.2"))
  (xy/install-lisps (concat my-local-lisp-path "/o-blog-2.6/lisp"))
  ;; my own lisps
  (xy/install-lisps my-own-lisp-path 'with-subdirs 'recursive)
  (load-dot-emacs-file))



;;;; Emacs daemon in graphic environment
;;;###autoload
(defun xy/done ()
  "Save buffers and make Emacs frame invisible.\
Improved C-x C-c."
  (interactive)
  (save-some-buffers)
  ;; (kill-this-buffer)
  (server-edit)
  (when window-system (make-frame-invisible nil t))
  ;; else block (terminal mode and emacs daemon is running)
  (delete-frame))

;; NOTE: With this macro, `server-start', `server-force-delete', and
;; `emacs --daemon' works properly even when there is an emacs server
;; running, when you set `delete-by-moving-to-trash' to true.
;; REF: (@url :file-name "http://superuser.com/questions/176207/emacs-daemon-not-deleting-socket" :display "Post")
;;;###autoload
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



;;;; Prepare emacs after server-start
;;;###autoload
(defun xy/prepare-emacs ()
  "Prepare emacs after server-start."
  (interactive)
  ;; (load-theme 'zenburn t)
  (beacon-mode 1)
  (sml/setup)
  (xy/set-font-InputMonoCompressed)
  (helm-mode t)
  (yas-global-mode t)
  ;; (global-company-mode t)
  (global-auto-complete-mode t)
  (linkd-mode t)
  (elscreen-start) ;; error when call it here
  (org-agenda)
  )

;;;; stopping the emacs daemon
;; REF: https://www.emacswiki.org/emacs/EmacsAsDaemon#toc9
;;;###autoload
(defun client-save-kill-emacs(&optional display)
    " This is a function that can bu used to shutdown save buffers and
shutdown the emacs daemon. It should be called using
emacsclient -e '(client-save-kill-emacs)'.  This function will
check to see if there are any modified buffers or active clients
or frame.  If so an x window will be opened and the user will
be prompted."

    (let (new-frame modified-buffers active-clients-or-frames)

                                        ; Check if there are modified buffers or active clients or frames.
      (setq modified-buffers (modified-buffers-exist))
      (setq active-clients-or-frames ( or (> (length server-clients) 1)
                                          (> (length (frame-list)) 1)
                                          ))

                                        ; Create a new frame if prompts are needed.
      (when (or modified-buffers active-clients-or-frames)
        (when (not (eq window-system 'x))
          (message "Initializing x windows system.")
          (x-initialize-window-system))
        (when (not display) (setq display (getenv "DISPLAY")))
        (message "Opening frame on display: %s" display)
        (select-frame (make-frame-on-display display '((window-system . x)))))

                                        ; Save the current frame.
      (setq new-frame (selected-frame))


                                        ; When displaying the number of clients and frames:
                                        ; subtract 1 from the clients for this client.
                                        ; subtract 2 from the frames this frame (that we just created) and the default frame.
      (when ( or (not active-clients-or-frames)
                 (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))

                                        ; If the user quits during the save dialog then don't exit emacs.
                                        ; Still close the terminal though.
        (let((inhibit-quit t))
                                        ; Save buffers
          (with-local-quit
            (save-some-buffers))

          (if quit-flag
              (setq quit-flag nil)
                                        ; Kill all remaining clients
            (progn
              (dolist (client server-clients)
                (server-delete-client client))
                                        ; Exit emacs
              (kill-emacs)))
          ))

                                        ; If we made a frame then kill it.
      (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
      )
    )

;;;###autoload
(defun modified-buffers-exist()
    "This function will check to see if there are any buffers
that have been modified.  It will return true if there are
and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
    (let (modified-found)
      (dolist (buffer (buffer-list))
        (when (and (buffer-live-p buffer)
                   (buffer-modified-p buffer)
                   (not (buffer-base-buffer buffer))
                   (or
                    (buffer-file-name buffer)
                    (progn
                      (set-buffer buffer)
                      (and buffer-offer-save (> (buffer-size) 0))))
                   )
          (setq modified-found t)
          )
        )
      modified-found
      )
      )


(provide 'xy-rc-utils)
