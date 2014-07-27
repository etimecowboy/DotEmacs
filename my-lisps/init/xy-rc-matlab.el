;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2014-07-27 Sun 02:34 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-matlab.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `matlab-emacs' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; ;;;###autoload
;; (defun xy/matlab-cedet-start ()
;;   "Start cedet support for matlab-emacs"
;;   (interactive)
;;   (matlab-cedet-setup)
;;   (xy/cedet-start))

;; ;;;###autoload
;; (defun xy/matlab-ecb-start ()
;;   "Start ecb support for matlab-emacs"
;;   (interactive)
;;   (xy/matlab-cedet-start)
;;   (require 'ecb-autoloads)
;;   (ecb-activate)
;;   (ecb-layout-switch "left-analyse"))

;;;###autoload
(defun matlab-postload ()
  "Settings of `matlab-emacs' after it's been loaded."
  
  ;; NOTE: `matlab-emcs' has not been updated for some time, so ;; some
  ;; parts of the code are out-dated, and may not works well with ;;
  ;; the latest `CEDET'.
  
  (require 'matlab-load)
  (require 'cedet)
  
  ;; load files of recent version `CEDET' in ~/.emacs.d/lisps
  ;; instead of the old version shipped with GNU Emacs.
  (autoload 'srecode-template-mode "srecode-template-mode" nil t)

  ;; (server-start) ;; server must be started for backtracing errors
                    ;; BUG: backtrace does not work

  ;; Change path
  (Windows
   (setq matlab-shell-command "C:/MATLAB/R2014a/bin/win64/matlabshell.exe")
   (Laptop
    (setq matlab-shell-command "matlabshell.exe"))
   (OfficePC
    (setq matlab-shell-command "C:/PROGRA~1/MATLAB/R2014a/bin/win64/matlabshell.exe"))
   
   ;; NOTE: use one of the following 
   ;; 1. Have `%MATLAB_ROOT%\extern\lib\win64\microsoft\libeng.dll'
   ;;    in your system variable `PATH'
   ;; 2. Add the following to your Emacs configuration (Linux as well)  
   ;;    (setenv "PATH" (concat
   ;;      "C:/PROGRA~1/MATLAB/R2011a/bin/win64;" (getenv "PATH")))
   ;; 3. Put `matlabshell.exe' and `matlabshell.cmd' in
   ;;    `%MATLAB_ROOT%\bin' or `%MATLAB_ROOT%\bin\win64'
   ;;    which has been added to `PATH' when MATLAB was installed   
     (setq matlab-shell-command-switches '("10000" "20000")))
  
  (GNULinux
   (setq matlab-shell-command "matlab")
   (setq matlab-shell-command-switches '("-nodesktop -nosplash")))
  
  (setq matlab-shell-ask-MATLAB-for-completions t
        matlab-shell-enable-gud-flag t
        matlab-shell-input-ring-size 100
        matlab-shell-logo (concat my-local-image-path "/matlab/matlab.png")
        ;; matlab-shell-echoes nil
        matlab-arg1-max-indent-length 15
        matlab-auto-fill t
        fill-column 76 ;; same as matlab default
        matlab-block-indent-tic-toc-flag nil
        matlab-block-verify-max-buffer-size 50000
        matlab-comment-anti-indent 0
        matlab-comment-column 40
        matlab-comment-line-s "% "
        matlab-comment-on-line-s "% "
        matlab-comment-region-s "%%%% "
        matlab-completion-technique 'increment
        matlab-cont-level 4
        matlab-cont-requires-ellipsis t
        matlab-elipsis-string "..."
        matlab-fill-code t
        matlab-fill-count-ellipsis-flag t
        matlab-fill-fudge 10
        matlab-fill-fudge-hard-maximum 79
        matlab-fill-strings-flag t
        matlab-functions-have-end t
        matlab-handle-simulink t
        matlab-highlight-block-match-flag t
        matlab-highlight-cross-function-variables t
        matlab-indent-function t
        matlab-indent-function-body 'guess
        matlab-indent-level 4
        matlab-return-add-semicolon nil
        matlab-return-function 'matlab-indent-end-before-ret
        matlab-show-mlint-warnings nil
        matlab-show-periodic-code-details-flag nil ;; BUG: not working
        matlab-use-eei t
        matlab-verify-on-save-flag nil
        matlab-vers-on-startup nil)
  
  ;; (matlab-cedet-setup) ;; NOTE: outdated!
  (message "* ---[ matlab post-load configuration is complete ]---"))

;; ;;;###autoload
;; (defun matlab-face-settings ()
;;   "Face settings of `matlab-emacs'."
;;   (custom-set-faces
;;    '(matlab-cross-function-variable-face
;;         ((t (:foreground "cornflower blue" :slant italic :weight bold))))
;;    '(matlab-nested-function-keyword-face
;;         ((t (:foreground "Yellow" :slant italic))))))

(provide 'xy-rc-matlab)

;; (defun my-matlab-mode-hook ()
;;   (turn-on-auto-fill)
;;     (setq fill-column 75))
;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)

;; (defun my-matlab-shell-mode-hook ()
;; '())
;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
