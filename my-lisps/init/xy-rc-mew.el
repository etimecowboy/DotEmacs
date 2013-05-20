;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-05-16 Thu 21:45 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-mew.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `mew' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;; REF:
;;   - (@url :file-name "http://everyjoe.com/technology/using-mew-as-a-mail-client/?utm_source=everyjoe&utm_medium=web&utm_campaign=b5hubs_migration" :display "1")
;;   - (@url :file-name "http://www.mew.org/pipermail/mew-int/2009-July/002217.html" :display "2")
;;   - (@url :file-name "http://baiyhome.spaces.live.com/blog/cns!6CC0192DC1074113!256.entry" :display "3")
;;   - (@url :file-name "http://bigclean.is-programmer.com/posts/18038.html" :display "4")
;;   - (@url :file-name "http://www.zeuux.com/blog/content/2858/" :display "5")
;;   - (@url :file-name "http://zerodoo.appspot.com/emacs.mew.1.0001.htm" :display "6")

;;;###autoload
(defun mew-postload ()
  "Settings of `Mew' after it's been loaded."
  ;; 编码设置，用 utf-8 发送邮件
  ;; NOTE: 经测试好像不需要。全英文时 Mew 用 ascii 编码，有中文时用
  ;; UTF-8
  ;; (setq mew-charset-m17n "utf-8")
  ;; (setq mew-internal-utf-8p t)

  ;; set mew directories
  (setq mew-conf-path
      (concat my-emacs-path "/mew"))
  (setq mew-mail-path
      (concat my-emacs-path "/mew"))
  ;; (setq mew-rc-file
  ;;     (concat my-own-lisp-path "/xy-rc-mew.el"))
  (setq mew-save-dir
      (concat my-emacs-path "/mew"))

  ;; Optional setup (Read Mail menu for Emacs 21):
  (if (boundp 'read-mail-command)
      (setq read-mail-command 'mew))
  ;; Optional setup (e.g. C-xm for sending a message):
  (if (boundp 'mail-user-agent)
      (setq mail-user-agent 'mew-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
        'mew-user-agent
        'mew-user-agent-compose
        'mew-draft-send-message
        'mew-draft-kill
        'mew-send-hook))

  ;; Windows 下使用 mew
  ;; REF: (@url :file-name "http://hi.baidu.com/ahnuzfm/blog/item/7cc0208696774d3467096e17.html" :display "baidu")
  ;; set ssl program for different environment
  ;; mew 在 windows 的安装可以参考我的笔记。
  ;; (GNULinux
  ;;   (setq mew-prog-ssl "stunnel"))
  (Windows
   (setq mew-prog-ssl "~/.emacs.d/bin/win32/stunnel/stunnel.exe"))

  (setq mew-ssl-verify-level 0)
  ;; cache the password
  ;; so I won’t have to type the password all the time.
  (setq mew-use-cached-passwd t)
  (setq mew-auto-get t) ;;mew启动时自动获取邮件
  (setq mew-delete-temp-file t)
  (setq mew-use-text/html t)
  (setq mew-use-text/xml t)
  ;; ask for subject if there isn't
  (setq mew-ask-subject t)

  ;; mew 外观
  (setq mew-window-use-full t)
  (setq mew-underline-lines-use t)
  (setq mew-use-fancy-thread t)
  (setq mew-use-fancy-highlight-body t)
  (setq mew-fancy-highlight-body-prefix-width 10)
  (setq mew-highlight-body-regex-comment "^[;#?%]+.*")
  (setq mew-prog-imls-arg-list '("--thread=yes" "--indent=2"))
  ;; (setq mew-use-highlight-mouse-line t)
  (setq mew-icon-directory ;; "~/.emacs.d/icons/mew")
        (concat my-local-image-path "/mew"))

  ;; html邮件相关设置（使用w3m）
  (setq mew-mime-multipart-alternative-list '("text/html" "text/plain" "*."))
  (setq mew-prog-text/html         'mew-mime-text/html-w3m) ;; See w3m.el
  ;; (setq mew-prog-text/html-ext     "/usr/bin/firefox")
  (setq mew-prog-text/xml         'mew-mime-text/html-w3m) ;; See w3m.el
  ;; (setq mew-prog-text/xml-ext     "/usr/bin/firefox")
  (setq mew-prog-application/xml         'mew-mime-text/html-w3m)
  ;; (setq mew-prog-application/xml-ext     "/usr/bin/firefox")
  ;; (setq mew-prog-application/X-Dvi         "/usr/bin/xdvi")
  (when (try-require 'mew-w3m)
    (setq mew-use-w3m-minor-mode 1)
    (add-hook 'mew-message-hook 'mew-w3m-minor-mode-setter)
    (if window-system
        (progn
          (define-key mew-summary-mode-map "T" 'mew-w3m-view-inline-image)
          (setq mew-w3m-auto-insert-image t))
      (setq mew-w3m-auto-insert-image nil)))

  ;; set signature ;; NOTE: use different signature for different accout
  ;; (setq mew-signature-file (concat mew-mail-path "/sig/siguwe"))
  (setq mew-signature-as-lastpart t)
  (setq mew-signature-insert-last t)
  (add-hook 'mew-before-cite-hook 'mew-header-goto-body)
  (add-hook 'mew-draft-mode-newdraft-hook 'mew-draft-insert-signature)

  ;; Summary page settings
  ;; unread mark
  (setq mew-use-unread-mark t)
  ;; (setq mew-unread-mark-list '((t t)))
  ;; (setq mew-delete-unread-mark-by-mark nil)
  ;; (setq mew-summary-form-mark-delete nil)
  ;; (setq mew-summary-form-mark-review 64) ;; @
  ;; (setq mew-summary-form-mark-spam 83)   ;; S
  ;; (setq mew-summary-form-size-0k t)
  (setq mew-summary-reply-with-citation-position 'body)
  (setq mew-summary-form
        '(type " | " (15 from) " | " t (50 subj) " | " (5 date) " " (5 time) " | " (-4 size)))

  ;; (setq mew-trash-folder-list '("%Deleted Items" "%已删除邮件" "%Trash" "%trash"))

  ;; smtp server setting
  ;; gmail smtp as default but need tls
  (setq mew-smtp-server "smtp.gmail.com"
          mew-smtp-auth-list '("PLAIN" "LOGIN" "CRAM-MD5")
          mew-smtp-ssl       t
          mew-smtp-ssl-port  465
          mew-smtp-user      "xin2.yang")

  ;; UWE smtp
  (OfficePC
   (setq mew-smtp-server "staf-smtp.uwe.ac.uk"
         mew-smtp-port      25
         mew-use-smtp-auth  nil
         mew-smtp-auth-list nil
         mew-smtp-ssl       nil))

  ;; Virgin Media smtp
  (UKDesktop
   (setq mew-smtp-server "smtp.blueyonder.co.uk"
         mew-smtp-port      25
         mew-use-smtp-auth  nil
         mew-smtp-auth-list nil
         mew-smtp-ssl       nil))

  ;; (Laptop
  ;;  (setq mew-smtp-server "smtp.gmail.com"
  ;;          mew-smtp-auth-list '("PLAIN" "LOGIN" "CRAM-MD5")
  ;;          mew-smtp-ssl       t
  ;;          mew-smtp-ssl-port  465
  ;;          mew-smtp-user      "xin2.yang"))

  ;;------------------------------------------------------------
  ;; Switch account command --- capital `C'
  (setq mew-config-alist
      '(("default"
         ("mailbox-type"         . imap)
         ("proto"                . "%")
         ("name"                 . "Xin Yang")
         ("user"                 . "xin2.yang")
         ("reply-to"             . "xin2.yang@gmail.com")
         ("signature-file"       . "~/emacs/mew/sig/grad")
         ("mail-domain"          . "gmail.com")
         ("imap-server"          . "imap.gmail.com")
         ("imap-ssl"             . t)
         ("imap-ssl-port"        . "993")
         ("imap-auth"            . pass)
         ("imap-user"            . "xin2.yang")
         ("imap-size"            . 0)
         ("imap-delete"          . t))
        
        ("uwe"
         ("mailbox-type"         . imap)
         ("proto"                . "%")
         ("name"                 . "Xin Yang")
         ("user"                 . "xin2.yang")
         ("reply-to"             . "xin2.yang@uwe.ac.uk")
         ("mail-domain"          . "uwe.ac.uk")
         ("signature-file"       . "~/emacs/mew/sig/siguwe")
         ("imap-server"          . "ses-imap.uwe.ac.uk")
         ("imap-ssl"             . t)
         ("imap-ssl-port"        . "993")
         ("imap-auth"            . pass)
         ("imap-user"            . "x4-yang")
         ("imap-size"            . 0)
         ("imap-delete"          . t)
         ("imap-inbox-folder"    . "%inbox")
         ("imap-trash-folder"    . "%Deleted Items")
         ("imap-queue-folder"    . "%Outbox")
         ("imap-spam-folder"     . "%Junk E-mail"))

        ;; Gmail etimecowboy@gmail.com
        ("ge"
         ("mailbox-type"         . imap)
         ("proto"                . "%")
         ("name"                 . "etimecowboy")
         ("user"                 . "etimecowboy")
         ("reply-to"             . "etimecowboy@gmail.com")
         ("signature-file"       . "~/emacs/mew/sig/bulb")
         ("mail-domain"          . "gmail.com")
         ("imap-server"          . "imap.gmail.com")
         ("imap-ssl"             . t)
         ("imap-ssl-port"        . "993")
         ("imap-auth"            . pass)
         ("imap-user"            . "etimecowboy")
         ("imap-size"            . 0)
         ("imap-delete"          . t))

        ;; newsgroup
        ;; ("news"
        ;;  ("mailbox-type"          . nntp)
        ;;  ("proto"                 . "-")
        ;;  ("nntp-server"           . "news.virginmedia.com")
        ;;  ("nntp-user"             . "etimecowboy")
        ;;  ("signature-file"        . "~/emacs/mew/sig/bulb")
        ;;  ("name"                  . "etimecowboy")
        ;;  ("mew-nntp-msgid-user"   . "etimecowboy")
        ;;  ("mew-nntp-msgid-domain" . "gmail.com")
        ;;  ("nntp-ssl"              . nil)
        ;;  ("nntp-ssl-port"         . 119)
        ;;  ("nntp-size"             . 0)
        ;;  ("nntp-header-only"      . t)
        ;;  ("nntp-newsgroup"        . "cn.bbs.comp.emacs"))
        ))

  (when (boundp 'utf-translate-cjk)
    (setq utf-translate-cjk t)
    (custom-set-variables
     '(utf-translate-cjk t)))
  (if (fboundp 'utf-translate-cjk-mode)
      (utf-translate-cjk-mode 1))

  ;;------------------------------------------------------------------
  ;; REF: (@url :file-name "http://zerodoo.appspot.com/emacs.mew.1.0001.html" :display "Post")

  (setq mew-charset-m17n "utf-8")
  (setq mew-internal-utf-8p t)
  ;; (setq mew-passwd-timer-unit 60) ; 60 minutes = 1 hour
  ;; (setq mew-passwd-lifetime 24)   ; timer-unit x 24 = 24 hours
  (set-default 'mew-decode-quoted 't)
  (setq mew-arrivedmail-pending 0)

  ;; biff（新邮件通知）
  (setq mew-use-cached-passwd t);;必须
  (when (try-require 'biff)
    (setq mew-use-biff t)
    (setq mew-use-biff-bell t)
    (setq mew-biff-interval 5) ; 一定要小于timer-unit和lifetime值
    ;; (setq mew-pop-biff-interval 3)
    ;; (message "[ biff setting is OK ! ]")
    )
  ;; todochiku 新邮件通知
  ;; (when window-system
  (when (try-require 'todochiku)
    (defadvice mew-biff-bark (before fj/mew-biff-bark (arg) activate)
      "Use Todochiku to pop-up a notification, if new Mail arrives"
      (cond ((and (> arg 0) (> arg mew-arrivedmail-pending))
             (setq mew-arrivedmail-pending arg)
             ;; NOTE: replace sndplay with your favorite command to
             ;; play a sound-file
             ;; (start-process-shell-command
             ;;  "biff-bark"
             ;;  "*Messages*"
             ;;  (format (concat "cscript "
             ;;                  fj/tool-path "/newmail.vbs %d") arg))
             (todochiku-message "emacs mew"
                                (format "New mail (%d) arrived." arg)
                                (todochiku-icon 'mail)))
            ((= arg 0)
             (if (> mew-arrivedmail-pending 0)
                 (setq mew-arrivedmail-pending 0))))))

  ;; auto complete email address in various fields
  (defvar mew-field-completion-switch
    '(("To:"        . mew-complete-address)
      ("Cc:"        . mew-complete-address)
      ("Dcc:"       . mew-complete-address)
      ("Bcc:"       . mew-complete-address)
      ("Reply-To:"  . mew-complete-address)
      ("Fcc:"       . mew-complete-folder)
      ("Resent-To:" . mew-complete-address)
      ("Resent-Cc:" . mew-complete-address)
      ("Config:"    . mew-complete-config)))

  ;; news groups
  ;; (setq mew-nntp-header-only t
  ;;       mew-nntp-port "119"
  ;;       mew-nntp-ssl nil
  ;;       mew-nntp-server "news.virginmedia.com"
  ;;       mew-nntp-newsgroup "-cn.bbs.comp.emacs"
  ;;       mew-nntp-size 1000
  ;;       ;; mew-nntp-user "Allen Yang"
  ;;       mew-nntp-msgid-user "etimecowboy"
  ;;       mew-nntp-msgid-domain "gmail.com")

   ;; org-mime for mew
  (when (try-require 'org-mime)
    (add-hook 'mew-draft-mode-hook
              (lambda ()
                (local-set-key "\C-c\M-o" 'org-mime-htmlize))))

  (message "* ---[ mew post-load configuration is complete ]---"))

(provide 'xy-rc-mew)
