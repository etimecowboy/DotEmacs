;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-20 Sun 23:35 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-w3m.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `Emacs-w3m' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; REF: ahei's settings
;;;###autoload
(defun w3m-browse-current-buffer ()
  "Use w3m browser current buffer."
  (interactive)
  (w3m-browse-buffer))

;;;###autoload
(defun w3m-save-current-buffer ()
  "Save current w3m buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (require 'pc-select)
    (call-interactively 'copy-region-as-kill))
  (with-temp-buffer
    (call-interactively 'yank)
    (call-interactively 'write-file)))

;;;###autoload
  (defun w3m-print-current-url ()
    "Display current url."
    (interactive)
    (w3m-message "%s" (w3m-url-readable-string w3m-current-url)))

;;;###autoload
(defun w3m-copy-current-url ()
  "Display the current url in the echo area and put it into `kill-ring'."
  (interactive)
  (when w3m-current-url
    (let ((deactivate-mark nil))
      (kill-new w3m-current-url)
      (w3m-print-current-url))))

;;;###autoload
(defun view-w3m-bookmark ()
  "View w3m bokmark."
  (interactive)
  (let ((buffer (get-buffer w3m-bookmark-buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (with-current-buffer (get-buffer-create w3m-bookmark-buffer-name)
        (w3m-mode)
        (w3m-bookmark-view)))))

;;;###autoload
(defun switch-to-w3m ()
  "Switch to *w3m* buffer."
  (interactive)
  (let ((buffer (get-buffer w3m-buffer-name)))
    (if buffer
        (switch-to-buffer buffer)
      (message "Could not found w3m buffer."))))

;;;###autoload
(defun w3m-browse-buffer (&optional buffer)
  "Use w3m browser buffer BUFFER."
  (interactive "bBuffer to browse use w3m: ")
  (unless buffer (setq buffer (current-buffer)))
  (let* ((file (buffer-file-name buffer))
         (name (buffer-name buffer)))
    (if file
        (w3m-goto-url-new-session file)
      (with-current-buffer buffer
        (save-excursion
          (mark-whole-buffer)
          (require 'pc-select)
          (call-interactively 'copy-region-as-kill)))
      (let* ((new-name
              (concat
               w3m-buffer-name-prefix
               "-"
               (if (string= "*" (substring name 0 1))
                   (substring name 1)
                 (concat name "*"))))
             (new-buffer (get-buffer-create new-name)))
        (switch-to-buffer new-buffer)
        (call-interactively 'yank)
        (w3m-buffer)
        (w3m-mode)
        (setq w3m-current-title (buffer-name))))))

;; fix small bug about of `w3m-auto-show'
;; see my-blog/emacs/w3m-auto-show-bug.htm
;;;###autoload
(defun w3m-auto-show ()
  "Scroll horizontally so that the point is visible."
  (when (and truncate-lines
             w3m-auto-show
             (not w3m-horizontal-scroll-done)
             (not (and (eq last-command this-command)
                       (or (eq (point) (point-min))
                           (eq (point) (point-max)))))
             (or (memq this-command '(beginning-of-buffer end-of-buffer))
                 (string-match "\\`i?search-"
                               (if (symbolp this-command) (symbol-name this-command) ""))
                 (and (markerp (nth 1 w3m-current-position))
                      (markerp (nth 2 w3m-current-position))
                      (>= (point)
                          (marker-position (nth 1 w3m-current-position)))
                      (<= (point)
                          (marker-position (nth 2 w3m-current-position))))))
    (w3m-horizontal-on-screen))
  (setq w3m-horizontal-scroll-done nil))

;; ;;;###autoload
;; (defun w3m-link-numbering (&rest args)
;;   "Make overlays that display link numbers."
;;   (interactive)
;;   (when w3m-link-numbering-mode
;;     (save-excursion
;;       (goto-char (point-min))
;;       (let ((i 0)
;;             overlay num)
;;         (catch 'already-numbered
;;           (while (w3m-goto-next-anchor)
;;             (when (get-char-property (point) 'w3m-link-numbering-overlay)
;;               (throw 'already-numbered nil))
;;             (setq overlay (make-overlay (point) (1+ (point)))
;;                   num (format "[%d]" (incf i)))
;;             (w3m-static-if (featurep 'xemacs)
;;                            (progn
;;                              (overlay-put overlay 'before-string num)
;;                              (set-glyph-face (extent-begin-glyph overlay)
;;                                              'w3m-link-numbering))
;;                            (w3m-add-face-property 0 (length num) 'w3m-link-numbering num)
;;                            (overlay-put overlay 'before-string num)
;;                            (overlay-put overlay 'evaporate t))
;;             (overlay-put overlay 'w3m-link-numbering-overlay i)))))))

;;---------------------------------------------------------------------

;; NOTE: there are already `w3m-external-view-current-url' and
;; `w3m-external-view-this-url' functions.
;; ;; Some functions to open links in external program
;; ;; REF: (@url :file-name "http://sachachua.com/blog/2008/09/emacs-w3m-open-pages-in-external-browsers/" :display "Post")
;; ;;;###autoload
;; (defun wicked/w3m-open-current-page-in-browser ()
;;   "Open the current URL in external browser."
;;   (require 'xy-rc-utils)
;;   (interactive)
;;   (Windows
;;     (setq browse-url-browser-function
;;           'browse-url-default-windows-browser)
;;     (browse-url w3m-current-url)
;;     (setq browse-url-browser-function 'w3m-browse-url))
;;   (GNULinux
;;    (setq browse-url-browser-function
;;          'browse-url-default-browser)
;;    (browse-url w3m-current-url)
;;    (setq browse-url-browser-function 'w3m-browse-url)))

;; ;;;###autoload
;; (defun wicked/w3m-open-link-or-image-in-browser ()
;;   "Open the current link or image in external browser."
;;   (require 'xy-rc-utils)
;;   (interactive)
;;   (Windows
;;    (setq browse-url-browser-function
;;          'browse-url-default-windows-browser)
;;    (browse-url (or (w3m-anchor) (w3m-image)))
;;    (setq browse-url-browser-function 'w3m-browse-url))
;;   (GNULinux
;;    (setq browse-url-browser-function
;;          'browse-url-default-browser)
;;    (browse-url (or (w3m-anchor) (w3m-image)))
;;    (setq browse-url-browser-function 'w3m-browse-url)))

;;---------------------------------------------------------------------------------------

;; ;; REF: http://emacs.wordpress.com/2008/04/12/numbered-links-in-emacs-w3m/
;; ;;;###autoload
;; (defun jao-w3m-go-to-linknum ()
;;   "Turn on link numbers and ask for one to go to."
;;   (interactive)
;;   (let ((active w3m-link-numbering-mode))
;;     (when (not active) (w3m-link-numbering-mode))
;;     (unwind-protect
;;         (w3m-move-numbered-anchor (read-number "Anchor number: "))
;;       (when (not active) (w3m-link-numbering-mode)))))

;;--------------------------------------------------------------------------------------

;;;###autoload
(defun w3m-postload ()
  "Settings for `w3m' after it's been loaded."

  ;; (add-hook 'w3m-mode-hook
  ;;           '(lambda ()
  ;;              (Windows
  ;;               ;; (setq default-terminal-coding-system 'utf-8-unix)
  ;;               (setq default-process-coding-system
  ;;                     '(gbk-dos . gbk-dos))
  ;;               (setq w3m-command "E:\\xin\\.emacs.d\\bin\\win32\\w3m.exe"))))

  (setq w3m-command-arguments '("-cookie" "-F"))
  ;; Make this comment if you have no a proper proxy
  ;; (setq w3m-command-arguments-alist
  ;;       '( ;; Don't use any additional options to visit local web pages.
  ;;           ("^http://\\([^/]*\\.\\)*your_internal_website_name\\(/\\|$\\)"
  ;;            "-no-proxy")
  ;;           ;; Use the proxy server to visit any foreign urls.
  ;;         ("" "-o" "http_proxy=http://your_proxy:80/")))
  (setq w3m-default-directory (concat my-emacs-path "/w3m"))
  ;; (setq w3m-init-file
  ;;       (concat my-own-lisp-path "/init/xy-rc-w3m.el"))
  ;; Use default icon directory
  ;; (setq w3m-icon-directory
  ;;       (concat my-local-image-path "/w3m"))
  (setq w3m-default-save-directory
        (concat w3m-default-directory "/download"))
  (setq w3m-profile-directory
        (concat w3m-default-directory "/profile"))
  (setq w3m-arrived-file
        (concat w3m-default-directory "/arrived"))
  (setq w3m-bookmark-file
        (concat w3m-default-directory "/bookmark.html"))
  (setq w3m-cookie-file
        (concat w3m-default-directory "/cookie"))
  (setq w3m-session-file
        (concat w3m-default-directory "/sessions"))
  (setq w3m-favicon-cache-file
        (concat w3m-default-directory "/favicach"))
  (setq w3m-form-textarea-directory
        (concat w3m-default-directory "/textarea"))
  (setq w3m-home-page "http://www.google.co.uk")

  (setq w3m-default-coding-system   'utf-8
        w3m-coding-system           'utf-8
        w3m-input-coding-system     'utf-8
        w3m-output-coding-system    'utf-8
        w3m-file-coding-system      'utf-8
        w3m-file-name-coding-system 'utf-8
        w3m-terminal-coding-system  'utf-8)

  (setq w3m-default-display-inline-images nil)
  (setq-default w3m-display-inline-images nil)

  (setq w3m-image-default-background ""
        w3m-add-tab-number t
        w3m-favicon-use-cache-file t
        w3m-fill-column 100
        w3m-keep-cache-size 500
        w3m-new-session-in-background t
        w3m-new-session-url "about:blank"
        w3m-prefer-cache t)

  (setq w3m-use-ange-ftp t
        w3m-use-cookies t
        w3m-use-favicon nil
        w3m-use-mule-ucs t
        w3m-view-this-url-new-session-in-background t)

  ;; (require 'w3m)
  ;; (require 'w3m-symbol)
  ;; (require 'w3m-util)
  ;; (require 'w3m-buffer)
  ;; (require 'w3m-antenna)
  ;; (require 'w3m-dtree)

  (try-require 'mime-w3m)

  (when (try-require 'octet)
    (octet-mime-setup))

  (w3m-lnum-mode 1) ;; BUG: Have set browse-url-generic-program
  (w3m-fb-mode 1)

  (autoload 'w3m-weather "w3m-weather" "Display weather report." t)
  (autoload 'org-w3m-copy-for-org-mode "org-w3m"
    "Copy current buffer content or active region with `org-mode' style links." t)

  ;; NOT using arrow
  ;; (dolist (k '([right] [left] [up] [down]))
  ;;     (define-key w3m-mode-map k nil))

  (message "* ---[ w3m post-load configuration is complete ]---"))

(provide 'xy-rc-w3m)

;;---------------------------------------------------------------------

;; other settings

;; (defvar w3m-buffer-name-prefix
;;     "*w3m" "Name prefix of w3m buffer")
;; (defvar w3m-buffer-name
;;     (concat w3m-buffer-name-prefix "*") "Name of w3m buffer")
;; (defvar w3m-bookmark-buffer-name
;;     (concat w3m-buffer-name-prefix "-bookmark*") "Name of w3m buffer")
;; (defvar w3m-dir
;;     (concat my-emacs-lisps-path "w3m/") "Dir of w3m.")

;; (add-hook 'w3m-display-hook
;;             (lambda (url)
;;               (rename-buffer
;;                (format "*%s - w3m*" (or w3m-current-title
;;                                         w3m-current-url)) t)))
