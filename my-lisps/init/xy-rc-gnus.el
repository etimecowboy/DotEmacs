;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:20 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-gnus.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `gnus' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun gnus-postload ()
  "Settings of `gnus' after it's been loaded."

  ;; Set Gnus directorys
  (setq gnus-init-file "~/.emacs.d/init-gnus.el" ;gnus设置文件
        gnus-default-directory "~/emacs/gnus"   ;默认目录
        gnus-home-directory "~/emacs/gnus"      ;主目录
        gnus-dribble-directory "~/emacs/gnus"   ;恢复目录
        gnus-startup-file "~/emacs/gnus/newsrc" ;初始文件
        gnus-directory "~/emacs/gnus/news"      ;新闻组的存储目录
        gnus-article-save-directory "~/emacs/gnus/news"  ;文章保存目录
        gnus-kill-files-directory "~/emacs/gnus/news"    ;文件删除目录
        gnus-agent-directory "~/emacs/gnus/news/agent"    ;代理目录
        gnus-cache-directory "~/emacs/gnus/news/cache"    ;缓存目录
        gnus-cache-active-file "~/emacs/gnus/news/cache/active" ;缓存激活文件
        gnus-newsgroup-maximum-articles 1000    ;最大的文章获取量，避免内存消耗过大
        message-directory "~/emacs/gnus/mail"   ;邮件的存储目录
        message-auto-save-directory "~/emacs/gnus/mail/drafts" ;自动保存的目录
        mail-source-directory "~/emacs/gnus/mail"  ;邮件的源目录
        mail-source-crash-box "~/emacs/gnus/emacs-mail-crash-box" ;邮件源崩溃目录
        ;; nnml-newsgroups-file "~/emacs/gnus/mail/newsgroup"      ;邮件新闻组解释文件
        nnmail-message-id-cache-file "~/emacs/gnus/nnmail-cache" ;nnmail的消息ID缓存
        nntp-marks-directory "~/emacs/gnus/news/marks"          ;nntp组存储目录
        ;; mml-default-directory "~/emacs/gnus/attachement"   ;附件的存储位置
        nntp-authinfo-file "~/emacs/gnus/authinfo" ;nntp用户身分认证文件
        nnimap-authinfo-file "~/emacs/gnus/authinfo" ;imap 用户身分认证文件
        )

  ;; canlock 密码
  (setq canlock-password "7a4a2fd70bf79c29088dbd76df1a2029301428ed")

  ;; 基本设置
  (setq gnus-agent t ;开启代理功能, 以支持离线浏览
        gnus-inhibit-startup-message t  ;关闭启动时的画面
        gnus-novice-user nil ;关闭新手设置, 不进行确认
        gnus-expert-user t   ;不询问用户
        gnus-show-threads t  ;显示邮件线索
        gnus-interactive-exit t ;退出时进行交互式询问
        gnus-use-dribble-file t   ;创建恢复文件
        gnus-always-read-dribble-file t ;读取恢复文件
        gnus-asynchronous t       ;异步操作
        gnus-large-newsgroup 100  ;设置大容量的新闻组默认显示的大小
        gnus-large-ephemeral-newsgroup nil  ;和上面的变量一样, 只不过对于短暂的新闻组
        gnus-summary-ignore-duplicates t    ;忽略具有相同ID的消息
        gnus-treat-fill-long-lines t        ;如果有很长的行, 不提示
        gnus-summary-display-while-building 100
        gnus-ignored-from-addresses nil     ; 在 Summary 中显示自己的名字
        message-confirm-send t              ;防止误发邮件, 发邮件前需要确认
        gnus-confirm-mail-reply-to-news t   ;防止在新闻组中将 f 按成 r
        message-kill-buffer-on-exit t       ;设置发送邮件后删除buffer
        message-from-style 'angles          ;`From' 头的显示风格
        message-syntax-checks '((sender . disabled)) ;语法检查
        nnmail-expiry-wait 7   ;邮件自动删除的期限 (单位: 天)
        nnmairix-allowfast-default t)       ;加快进入搜索结果的组

  ;;==================================================================
  ;; 源设置：Gnus 支持订阅多个源，一个主多个从，源可以是 news，可以是
  ;; mail。
  ;; NOTE: 这是个用本地文件做主源的例子
  ;; ;首要选择方法, 从本地缓冲文件中读取新闻 (leafnode抓取)
  ;; (setq gnus-select-method '(nntp "localhost"))
  ;; ;抓取文章的方法, 和 `gnus-select-method' 一样
  ;; (setq gnus-refer-article-method '(nntp "localhost"))
  ;; ;次要选择方法
  ;; (setq gnus-secondary-select-methods
  ;;       '((nnmaildir "Gmail" ;从本地文件中读邮件 (getmail 抓取)
  ;;            (directory "~/emacs/mail/")) ;读取目录
  ;;         ))
  ;; (setq mail-sources ;邮件源设置
  ;;       '((maildir :path "~/emacs/mail/"  ;本地邮件存储位置
  ;;                  :subdirs ("cur" "new" "tmp")))) ;本地邮件子目录

  ;;==================================================================
  ;; nntp server
  ;; NOTE: 这是个多个新闻组服务器的例子
  ;; (setq gnus-select-method '(nntp "news.yaako.com")
  ;;       ;; 这些是其他的。
  ;;       gnus-secondary-select-methods
  ;;       '(;;(nnml "private") ;; 这个是本地邮件
  ;;         (nntp "news.newsfan.net") ;; 新帆
  ;;         ;;(nntp "news.cnnb.net") ;; 宁波
  ;; NOTE: a list of free news servers
  ;;       - news.cn99.com
  ;;       - freenews.netfront.net
  ;;       - news.aioe.org
  ;;       - news.motzarella.org
  (setq gnus-select-method
        ;; '(nntp "news.aioe.org"))
        '(nntp "news.aioe.org"))
  (UKDesktop
   (setq gnus-select-method
         '(nntp "news.virginmedia.com"
                (nntp-port-number 119))))

  ;;==================================================================
  ;; Email settings
  ;; Recieving
  ;; NOTE: 现在不用 gnus 收邮件了，可以加快速度
  ;; NOTE: 以前成功的Gmail设置
  ;; Gnus Email settings
  ;; Recieving
  ;; (setq gnus-secondary-select-methods
  ;;       '((nnimap "Gmail-etimecowboy"
  ;;                   (nnimap-address "imap.gmail.com")
  ;;                   (nnimap-server-port 993)
  ;;                   (nnimap-stream ssl))
  ;;         ;; (nnimap "UWE-staff"
  ;;         ;;           (nnimap-address "ses-smtp.uwe.ac.uk")
  ;;         ;;           (nnimap-server-port 993)
  ;;         ;;           (nnimap-stream ssl))
  ;;         ))
  ;; NOTE: 不成功的多账户设置
  ;; (setq mail-sources
  ;;         '((imap :server "imap.gmail.com"
  ;;                   :user "xin2.yang"
  ;;                   :password "13971167383"
  ;;                   :port 993
  ;;                   :connection ssl
  ;;                   :leave t)
  ;;           (imap :server "ses-imap.uwe.ac.uk"
  ;;                   :user "x4-yang"
  ;;                   :password "2bh25E"
  ;;                   :port 993
  ;;                   :connection ssl
  ;;                   :leave t)))
  ;;   ;;------------------------------------------------------------------
  ;;   ;; Initialize the Gnus daemon, check new mail every two minutes.
  ;;   ;; 每隔 20 分钟查一下信
  ;;   ;; (setq gnus-use-demon t)
  ;;   ;; (gnus-demon-init)
  ;;   ;; (gnus-compile)
  ;;   ;; (gnus-demon-add-handler 'gnus-demon-update-group-buffer 2 nil)
  ;;   ;; (gnus-demon-add-handler 'gnus-demon-scan-mail 20 t)
  ;;   ;; (gnus-demon-add-handler 'gnus-demon-scan-news 20 t)


  ;;------------------------------------------------------------------
  ;; Sending
  ;; Windows 下 gnus 收发 gmail 邮件
  ;; REF:
  ;;     - (@url :file-name "http://hi.baidu.com/kton/blog/item/4fb26159f8ae312c2934f047.html" :display "1")
  ;;     - (@url :file-name "http://deebo.posterous.com/setting-up-emacs-gnus-on-windows-to-read-gmai" :display "2")
  ;;     - (@url :file-name "http://www.mail-archive.com/info-gnus-english@gnu.org/msg08606.html" :display "3")
  ;;------------------------------------------------------------------
  ;; tls smtp server , NOTE: Windows下很难设置
  ;; REF: (@url :file-name "http://ejd.posterous.com/send-email-through-gmail-with-gnu-emacs" :display "Post")
  ;; NOTE: In linux environment,You will need starttls which is now
  ;;       (included in emacs release), which is used to set up the
  ;;       SSL encrypted connection to the GMail server.
  ;;       This is contained in the "gnutls-bin"
  ;;       package on earlier versions of debian and ubuntu.
  ;;       With later versions (at least Ubuntu 9.10), starttls is
  ;;       in its own package, and the "gnutls-bin" package is not
  ;;       needed. For Redhat Enterprise Linux 5 or CentOS 5,
  ;;       "gnutls" and "gnutls-utils" packages are needed.
  ;;       If you don’t have starttls installed, you’ll get a
  ;;       (rather generic) “smtpmail-send-it: Sending failed;
  ;;       SMTP protocol error” error message.
  ;; (GNULinux
  ;;  (setq
  ;;     send-mail-function 'smtpmail-send-it
  ;;     message-send-mail-function 'smtpmail-send-it
  ;;     smtpmail-auth-credentials (expand-file-name
  ;;                                "~/emacs/gnus/authinfo")
  ;;     smtpmail-debug-info t
  ;;     smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
  ;;     smtpmail-default-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-server "smtp.gmail.com"
  ;;     smtpmail-smtp-service 587))
  ;;------------------------------------------------------------------
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/GnusMSMTP" :display "emacswiki")
  ;; (Windows
  ;;  (setq
  ;;     message-send-mail-function 'message-send-mail-with-sendmail
  ;;     ;; we substitute sendmail with msmtp
  ;;     sendmail-program (expand-file-name "~/.emacs.d/bin/win32/msmtp.exe")
  ;;     ;;need to tell msmtp which account we're using
  ;;     message-sendmail-extra-arguments '("-a" "gx2")
  ;;   ;; you might want to set the following too
  ;;     mail-host-address "gmail.com"))

  ;; NOTE: 现在Windows下只能用普通smtp服务器，tls不支持
  (require 'smtpmail)
  ;; (require 'starttls)

  ;; non-tls smtp server
  (setq send-mail-function 'smtpmail-send-it
        message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-service 25
        smtpmail-debug-info t)
  ;; @home
  (UKDesktop
   (setq
    smtpmail-default-smtp-server "smtp.blueyonder.co.uk"
    smtpmail-smtp-server "smtp.blueyonder.co.uk"))
  ;; @brl
  (OfficePC
   (setq
    smtpmail-default-smtp-server "staf-smtp.uwe.ac.uk"
    smtpmail-smtp-server "staf-smtp.uwe.ac.uk"))

  ;;==================================================================
  ;; 语言环境设定
  (setq gnus-default-charset 'utf-8)
  (add-to-list 'gnus-group-charset-alist
               '("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" gb2312)) ;; gbk))
  (setq gnus-summary-show-article-charset-alist
        '((1 . utf-8)
          (2 . big5)
          (3 . gb18030)
          (4 . gbk)
          (5 . gb2312)
          (6 . utf-7)))
  ;;解决gb18030乱码
  (setq gnus-newsgroup-ignored-charsets
        '(unknown-8bit x-unknown x-gbk gb18030))

  ;;==================================================================
  ;;设置发送风格

  ;; 统一的风格
  ;; Message posting
  ;; (setq gnus-posting-styles
  ;;       '((".*"
  ;;          (gnus-face-from-file "~/.emacs.d/me.jpg")
  ;;          (organization "University of Manitoba")
  ;;          (signature "http://www.cnliufeng.com/"))))

  ;;------------------------------------------------------------------
  ;; 针对不同版块使用不同风格
  (setq gnus-posting-styles
        '(
          ;; all
          (".*"
           (name "Allen Yang")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                      "/cock32.png")))
           ;; (organization "your-pc-name")
           ;;          (signature "
           ;; oooOOOOoo...
           ;; >  Life is too short ! ...")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 gb2312 gbk gb18030 utf-8)))
           ;;(body "")
           )
          ;;cn.bbs.com
          ("^cn\\.bbs"
           (name "日积月累")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                      "/cock32.png")))
           ;;          (organization "your-pc-name")
           (signature "
;;
;; >  。。。。。用水滴穿石的精神消灭一切困难")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 gb2312 gbk gb18030 utf-8)))
           ;;(body "")
           )
          ;;tw
          ("^tw\\.comp"
           (name "日積月累")
           (address "etimecowboy@gmail.com")
           ;; (face (gnus-convert-png-to-face (concat gnus-home-directory
           ;;                                      "/cock32.png")))
           ;;          (organization "your-pc-name")
           (signature "
;;
;; >  。。。。。用水水滴穿石的精神消滅一切苦難")
           (eval (setq mm-coding-system-priorities
                       '(iso-8859-1 big5 utf-8)))
           ;;(body "")
           )
          ))

  (add-hook 'message-mode-hook
            (lambda ()
              (auto-fill-mode 1)
              (set-fill-column 64)
              (if window-system
                    (auto-image-file-mode 1)
                  (auto-image-file-mode -1))))


  ;;引用设置：不要原来的签名，引用全文
  (setq message-cite-function 'message-cite-original-without-signature)

  ;; 用 Supercite 显示多种多样的引文形式
  ;; BUG: 下面的设置会在“F”后Window布局出错，可能supercite需要重设。
  ;; (setq sc-attrib-selection-list nil
  ;;       sc-auto-fill-region-p nil
  ;;       sc-blank-lines-after-headers 1
  ;;       sc-citation-delimiter-regexp "[>]+\\|\\(: \\)+"
  ;;       sc-cite-blank-lines-p nil
  ;;       sc-confirm-always-p nil
  ;;       sc-electric-references-p nil
  ;;       sc-fixup-whitespace-p t
  ;;       sc-nested-citation-p nil
  ;;       sc-preferred-header-style 4
  ;;       sc-use-only-preference-p nil)
  ;; (add-hook 'mail-citation-hook 'sc-cite-original) ;; this works

  ;;==================================================================
  ;; 阅读设置
  (setq mm-text-html-renderer 'w3m) ;用W3M显示HTML格式的邮件
  ;; (setq mm-text-html-renderer nil)  ;调用外部浏览器

  (defun wicked/gnus-article-show-html ()
    "Show the current message as HTML mail."
    (interactive)
    (let ((mm-automatic-display (cons "text/html"
                                      mm-automatic-display)))
      (gnus-summary-show-article)))

  (define-key gnus-article-mode-map "WH"
    'wicked/gnus-article-show-html)

  ;; multimedia content reading
  (eval-after-load "mm-decode"
    '(progn
       (add-to-list 'mm-discouraged-alternatives "text/html")
       (add-to-list 'mm-discouraged-alternatives "text/richtext")
       (if window-system
           (setq mm-inline-large-images t)
         (setq mm-inline-large-images nil))
       (add-to-list 'mm-attachment-override-types "image/*")))

  ;;==================================================================
  ;; Summary 显示设置
  (setq gnus-summary-gather-subject-limit 'fuzzy) ;聚集题目用模糊算法
  (setq gnus-summary-line-format "%4P %U%R%z%O %{%5k%}
%{%14&user-date;%} %{%-20,20n%} %{%ua%} %B %(%I%-60,60s%)\n")
  (defun gnus-user-format-function-a (header) ;用户的格式函数 `%ua'
    (let ((myself (concat "<" my-mail ">"))
          (references (mail-header-references header))
          (message-id (mail-header-id header)))
      (if (or (and (stringp references)
                   (string-match myself references))
              (and (stringp message-id)
                   (string-match myself message-id)))
          "X" "│")))
  (setq gnus-user-date-format-alist ;用户的格式列表 `user-date'
        '(((gnus-seconds-today) . "TD %H:%M")   ;当天
          (604800 . "W%w %H:%M")                ;七天之内
          ((gnus-seconds-month) . "%d %H:%M")   ;当月
          ((gnus-seconds-year) . "%m-%d %H:%M") ;今年
          (t . "%y-%m-%d %H:%M")))              ;其他

  ;; topic mode 参考这里：(info "(gnus)Group Topics")
  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

  ;; 主题模式外观, `%B'
  (setq gnus-summary-same-subject "Re:►")
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-single-indent "☉ ")
  (setq gnus-sum-thread-tree-root "★ ")
  (setq gnus-sum-thread-tree-false-root "☆")
  (setq gnus-sum-thread-tree-vertical "┃ ")
  (setq gnus-sum-thread-tree-leaf-with-other "┣━")
  (setq gnus-sum-thread-tree-single-leaf "┗━")

  ;; 主题设置
  (setq gnus-use-trees t               ;联系老的标题
        gnus-tree-minimize-window nil  ;用最小窗口显示
        gnus-fetch-old-headers  nil    ;不取老的标题
        ;;NOTE: 对于文章巨多的一些组，任何获取老标题的企图都会消耗大量
        ;;内存而导致emacs崩溃。
        gnus-generate-tree-function
             'gnus-generate-horizontal-tree   ;生成水平树
        gnus-summary-thread-gathering-function
             'gnus-gather-threads-by-subject) ;聚集函数根据标题聚集

  (add-hook 'gnus-article-prepare-hook ; 将邮件的发出时间转换为本地时间
            'gnus-article-date-local)
  (add-hook 'gnus-select-group-hook    ; 跟踪组的时间轴
            'gnus-group-set-timestamp)
  (add-hook 'gnus-group-mode-hook      ; 新闻组分组
            'gnus-topic-mode)

  (setq gnus-thread-sort-functions       ;; 排序
        '((not gnus-thread-sort-by-date) ;时间的逆序
          (not gnus-thread-sort-by-number))) ;跟踪的数量的逆序
  (setq gnus-summary-stripe-regexp        ;设置斑纹化匹配的正则表达式
        (concat "^[^" gnus-sum-thread-tree-vertical "]*"))

  ;; 自动跳到第一个没有阅读的组
  ;; (add-hook 'gnus-switch-on-after-hook 'gnus-group-first-unread-group) ; gnus切换时
  ;; (add-hook 'gnus-summary-exit-hook 'gnus-group-first-unread-group) ;退出Summary时
  ;; 自动更新新消息，功能不错，但在我的机器上会很慢...
  ;; (add-hook 'gnus-summary-exit-hook 'gnus-notify+) ;退出summary模式后
  ;; (add-hook 'gnus-group-catchup-group-hook 'gnus-notify+) ;当清理当前组后
  ;; (add-hook 'mail-notify-pre-hook 'gnus-notify+) ;更新邮件时

  ;; 窗口布局
  (gnus-add-configuration
   '(article
     (horizontal 1.0
                 (vertical 1.0
                           (summary 0.35 point)
                           (article 1.0)))))

  ;; Summary buffer 表格样式
  (setq gnus-summary-line-format
        "%U %R %B %s %-60= | %4L | %-20,20f | %&user-date; \n")

  ;;设定要显示的头消息格式
  (setq gnus-visible-headers
        "^\\(^To:\\|^CC:\\|^From:\\|^Subject:\\|^Date:\\|^Followup-To:
\\|^X-Newsreader:\\|^User-Agent:\\|^X-Mailer:
\\|Line:\\|Lines:\\|Content-Type:\\|NNTP-Posting-Host\\)")

  ;;==================================================================
  ;; 新闻存档
  ;; 如何存档有趣的消息？例如在 gnu.emacs.gnus 中，你偶然发现一个有趣
  ;; 的消息，想要存档，有好几种方法。第一种，也是最简单的，另存为文件
  ;; `O f'。但是，Gnus 自动保存发送的帖子, 保存的文本都加密过了，得在
  ;; group选单里按 `^' 进入到相应的组里查看。用一般的编辑器打开就是乱
  ;; 码。把 Frank Haun &lt;pille3003@fhaun.de&gt; 的这个代码片断放入
  ;; ~/.gnus。
  (defun my-archive-article (&optional n)
    "Copies one or more article(s) to a corresponding `nnml:' group,
e.g. `gnus.ding' goes to `nnml:1.gnus.ding'. And `nnml:List-gnus.ding'
goes to `nnml:1.List-gnus-ding'.

     Use process marks or mark a region in the summary buffer to
archive more then one article."
    (interactive "P")
    (let ((archive-name
           (format "nnml:archives.%s"
                   (if (featurep 'xemacs)
                       (replace-in-string gnus-newsgroup-name "^.*:" "")
                     (replace-regexp-in-string "^.*:" ""
                                               gnus-newsgroup-name)))))
      (gnus-summary-copy-article n archive-name)))
  ;; 此时，可以在 summary buffer 中用 `M-x my-archive-article' 把光标处
  ;; 的文章存档到一个 nnml 组（当然，可以改为你想要的其他后端）。
  ;; 很简单的得到文本形式的备份。

  ;;------------------------------------------------------------------
  ;; 当然，也可以使用缓冲：
  (setq gnus-use-cache t)
  ;; 看到有价值的帖子，只要按下`*'键，这篇帖子就会被拷贝到本地的cache中
  ;; 保存起来，即使服务器那边删除了帖子，也没关系了。如果不想要了，用
  ;; `Meta-*'就可以把帖子从缓存中删掉。这样，你只需设置 tick 或者
  ;; dormant 标记来保存，在缓冲中设置已读标记可以删除（文章）。
  (setq nnml-use-compressed-files t)  ;;压缩保存的邮件

  ;;==================================================================
  ;; 发帖备份
  ;; 默认的message-archive 这个方法建立了一系列的文件夹来识别不同的新闻组
  ;; 或收件人。很多人并不喜欢。
  ;; 这是一种对默认分组方式的修改
  ;; (setq gnus-outgoing-message-group
  ;;       '(nnml "archives"
  ;;              (nnml-directory   "~/emacs/gnus/mail/archives")
  ;;              (nnml-active-file "~/emacs/gnus/mail/archives/active")
  ;;              (nnml-get-new-mail nil)
  ;;              (nnml-inhibit-expiry t)))
  ;; 这是干脆关闭默认分组方法
  (setq gnus-message-archive-group nil)

  ;; 自己建立分组方法：
  ;; 方法1：将发往新闻组的信和其它信件分开存放
  (setq gnus-message-archive-group
        '((if (message-news-p)
              "nnml:sent_news"
            "nnml:sent_mails")))

  ;; 方法2：按news和mail分开，再按月分。也没必要
  ;; (setq gnus-message-archive-group
  ;;       '((if (message-news-p)
  ;;             (concat "news." (format-time-string "%Y-%m"))
  ;;           (concat "mail." (format-time-string "%Y-%m")))))

  ;;A function that selects a reasonable group for Gcc'ing this mail.
  ;;You can change it to filter mails to different newsgroups.
  ;;(defun MySendedMail ()
  ;;  (cond ((and gnus-newsgroup-name
  ;;              (not (message-news-p))
  ;;              (stringp gnus-newsgroup-name))
  ;;         gnus-newsgroup-name)
  ;;        (t ted-default-gcc-group)))

  ;;==================================================================
  ;; 积分设定
  (setq gnus-use-adaptive-scoring t  ;开启积分
        gnus-save-score t)           ;保存积分

  (setq  gnus-score-find-score-files-function
         '(gnus-score-find-hierarchical gnus-score-find-bnews
                                        bbdb/gnus-score))

  (add-hook 'message-sent-hook 'gnus-score-followup-article)
  (add-hook 'message-sent-hook 'gnus-score-followup-thread)

  (defvar gnus-default-adaptive-score-alist
    '((gnus-kill-file-mark (from -10))
      (gnus-unread-mark)
      (gnus-read-mark (from 10) (subject 30))
      (gnus-catchup-mark (subject -10))
      (gnus-killed-mark (from -1) (subject -30))
      (gnus-del-mark (from -2) (subject -15))
      (gnus-ticked-mark (from 10))
      (gnus-dormant-mark (from 5))))

  ;; Thread sorting
  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date)
          (not gnus-thread-sort-by-number)))

  ;; Message replying
  (setq gnus-confirm-mail-reply-to-news t
        message-kill-buffer-on-exit t
        message-elide-ellipsis "[...]\n")

  (add-hook 'gnus-article-prepare-hook
            (lambda ()
              (gnus-article-fill-long-lines)
              (gnus-article-date-local)))

  ;;==================================================================
  ;; Additional lisps

  ;; gnus-notify+
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/gnus-notify%2B.el" :display "emacswiki")
  ;; 邮件新闻通知
  ;; (try-require 'gnus-notify+)

  ;;------------------------------------------------------------------
  ;; org-mime
  (when (try-require 'org-mime)
    (add-hook 'message-mode-hook
              (lambda ()
                (local-set-key "\C-c\M-o" 'org-mime-htmlize))))

  ;;------------------------------------------------------------------
  ;; ansit, by crazycool@newsmth
  ;; 把emacs里的代码按照当前模式的语法加上ANSI色彩，以方便贴在BBS上
  ;; (try-require 'ansit) ;; 新闻组不好用。加在这里只是为了贴到BBS
  
  (message "* ---[ gnus post-load configuration is complete ]---"))

(provide 'xy-rc-gnus)
