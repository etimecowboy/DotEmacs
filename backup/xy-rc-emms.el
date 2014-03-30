;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:16 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-emms.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `emms.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun xy/emms-start ()
  "Initial emms"
  (interactive)
  (require 'emms-setup)
  (emms-all))

;;;###autoload
(defun xwl-emms-track-description-function (track)
  "Return a description of the current track."
  (let* ((name (emms-track-name track))
         (type (emms-track-type track))
         (short-name (file-name-nondirectory name))
         (play-count (or (emms-track-get track 'play-count) 0))
         (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
         (empty "..."))
    (prog1
        (case (emms-track-type track)
          ((file url)
           (let* ((artist (or (emms-track-get track 'info-artist) empty))
                  (year (emms-track-get track 'info-year))
                  (playing-time (or (emms-track-get track 'info-playing-time) 0))
                  (min (/ playing-time 60))
                  (sec (% playing-time 60))
                  (album (or (emms-track-get track 'info-album) empty))
                  (tracknumber (emms-track-get track 'info-tracknumber))
                  (short-name (file-name-sans-extension
                               (file-name-nondirectory name)))
                  (title (or (emms-track-get track 'info-title) short-name))

                  ;; last track
                  (ltrack xwl-emms-playlist-last-track)
                  (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                               empty))
                  (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                              empty))

                  (same-album-p (and (not (string= lalbum empty))
                                     (string= album lalbum))))
             (format "%10s  %3d   %-20s%-60s%-35s%-15s%s"
                     (emms-last-played-format-date last-played)
                     play-count
                     artist

                     ;; Combine indention, tracknumber, title.
                     (concat
                      (if same-album-p ; indention by album
                          (setq xwl-emms-playlist-last-indent
                                (concat " " xwl-emms-playlist-last-indent))
                        (setq xwl-emms-playlist-last-indent "\\")
                        "")
                      (if (and tracknumber ; tracknumber
                               (not (zerop (string-to-number tracknumber))))
                          (format "%02d." (string-to-number tracknumber))
                        "")
                      title        ; title
                      )

                     ;; album
                     (cond ((string= album empty) empty)
                           ;; (same-album-p "  ")
                           (t (concat "ã€Š" album "ã€‹")))

                     (or year empty)
                     (if (or (> min 0)  (> sec 0))
                         (format "%02d:%02d" min sec)
                       empty))))
          ((url)
           (concat (symbol-name type) ":" name))
          (t
           (format "%-3d%s"
                   play-count
                   (concat (symbol-name type) ":" name))))
      (setq xwl-emms-playlist-last-track track))))

;;;###autoload
(defun emms-postload ()
  "Settings of `emms.el' after it's been loaded."
  ;;------------------------------------------------------------------
  ;; REF: (@url :file-name "http://www.gnu.org/software/emms/configs/xwl-emms.el" :display "Official example")

  ;; Track Show Format (for playlist buffer)
  (setq emms-last-played-format-alist
        '(((emms-last-played-seconds-today) . "%a %H:%M")
          (604800                           . "%a %H:%M") ; this week
          ((emms-last-played-seconds-month) . "%d")
          ((emms-last-played-seconds-year)  . "%m/%d")
          (t                                . "%Y/%m/%d")))

  (setq xwl-emms-playlist-last-track nil)
  (setq xwl-emms-playlist-last-indent "\\")
  (setq emms-track-description-function
          'xwl-emms-track-description-function)


  ;;------------------------------------------------------------------
  ;; REF: (@url :file-name "http://www.emacswiki.org/emacs/init-emms.el" :display "from emacswiki `init-emms.el'")

  ;; (require 'emms-extension)
  (emms-devel) ;选择开发者模式
  (emms-standard)
  (emms-default-players)
  (emms-i18n-set-default-coding-system 'gbk-dos 'utf-8-unix)
  ;; 目录
  (setq emms-directory ;设置EMMS的目录
        (concat my-emacs-path "/emms"))
  (setq emms-history-file          ;播放列表历史记录
        (concat emms-directory "/emms-history-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (unless (file-exists-p emms-history-file)
    (shell-command (concat "touch " emms-history-file)))
  (setq emms-cache-file            ;缓存文件
        (concat emms-directory "/emms-cache-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (unless (file-exists-p emms-cache-file)
    (shell-command (concat "touch " emms-cache-file)))
  (setq emms-stream-bookmarks-file ;网络电台保存文件
        (concat emms-directory "/emms-streams"))
  (unless (file-exists-p emms-stream-bookmarks-file)
    (shell-command (concat "touch " emms-stream-bookmarks-file)))
  (setq emms-score-file            ;分数文件
        (concat emms-directory "/emms-scores-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  (unless (file-exists-p emms-score-file)
    (shell-command (concat "touch " emms-score-file)))
  (setq emms-source-file-default-directory ;设定默认的播放目录
        emms-directory)
  ;; 播放设置
  (setq emms-playlist-default-major-mode 'emms-playlist-mode)   ;设定EMMS用播放列表的主模式
  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track) ;设定音轨初始化信息
  (setq emms-player-next-function 'emms-next)                                ;修复该死的播放完后的BUG
  (setq emms-repeat-playlist t)                                              ;设定EMMS启动列表循环播放
  (setq emms-history-start-playing t)
  (setq emms-playlist-sort-function       ;设置播放列表用自然的方法排序: 艺术家 -> 专辑 -> 序号
        'emms-playlist-sort-by-natural-order)
  ;; (require 'emms-mode-line)
  ;; (emms-mode-line 1)
  ;; (emms-mode-line-blank)
  (emms-mode-line-disable)                    ;不在Mode-line上显示歌曲信息
  ;; (require 'emms-playing-time)
  ;; (emms-playing-time 1)
  (setq emms-playing-time-display-format "")  ;不显示歌曲播放时间
  (when (fboundp 'emms-cache) (emms-cache 1)) ;设置EMMS缓存
  (GNULinux
   (setq emms-player-list                      ;设定EMMS播放器的优先顺序
         '(emms-player-mplayer
           emms-player-timidity
           emms-player-mpg321
           emms-player-ogg123)))
  (setq emms-info-asynchronously nil)            ;关闭EMMS信息异步模式, 不然会处错
  (setq emms-playlist-buffer-name "*Music*")     ;设定播放列表的缓存标题
  (setq emms-source-file-directory-tree-function ;设定更快和灵活的文件目录查找模式
        'emms-source-file-directory-tree-find)
  (setq emms-show-format "%s")                 ;设置 `emms-show' 的显示格式
  ;; (add-hook 'emms-player-finished-hook 'emms-random) ;当播放完当前的歌曲时随机选择下一首歌曲
  ;; 歌词设置
  ;; (require 'emms-lyrics)
  ;; (ad-activate 'emms-lyrics-find-lyric)       ;自动下载歌词
  (setq emms-lyrics-dir (concat my-emacs-path "/emms/lyrics"))   ;EMMS的歌词目录
  (setq emms-lyrics-dir emms-directory)
  (setq emms-lyrics-display-format "%s")       ;设置歌词显示格式
  (setq emms-lyrics-scroll-timer-interval 1.0) ;歌词滚动延迟
  (setq emms-lyrics-display-on-minibuffer nil) ;在minibuffer中显示歌词
  (setq emms-lyrics-display-on-modeline nil)   ;在modeline中显示歌词
  ;; 解析歌手和歌名
  ;; (add-to-list 'emms-info-functions 'kid-emms-info-simple)
  ;; Emms-browser
  (setq emms-browser-info-genre-format "%i● %n"
        emms-browser-info-artist-format "%i● %n"
        emms-browser-info-album-format "%i◎ %n"
        emms-browser-info-title-format "%i♪ %n")
  ;; ;; 设置时间显示格式
  ;; (setq emms-last-played-format-alist                      ;最后播放时间格式化
  ;;         '(((emms-last-played-seconds-today) . "%H:%M")     ;今天
  ;;           (604800                           . "W%w %H:%M") ;这个星期
  ;;           ((emms-last-played-seconds-month) . "%d")        ;这个月
  ;;           ((emms-last-played-seconds-year)  . "%m-%d")     ;今年
  ;;           (t                                . "")))
  ;; ;; 设置播放列表显示
  ;; (setq emms-track-description-function
  ;;         'lazycat/emms-info-track-description)

  ;; EMMS 浏览器
  ;; (require 'emms-browser)
  ;; (emms-browser-make-filter               ;显示所有
  ;;  "EVERYTHING" 'ignore)
  ;; (emms-browser-set-filter                ;设置默认的为显示所有
  ;;  (assoc "EVERYTHING" emms-browser-filters))
  ;; (emms-browser-make-filter               ;只显示文件
  ;;  "ALL-FILES" (emms-browser-filter-only-type 'file))
  ;; (emms-browser-make-filter               ;最近一个月播放的
  ;;  "LAST-MONTH-PLAYED" (emms-browser-filter-only-recent 30))
  ;; (emms-browser-make-filter               ;最近一个月都没有播放的
  ;;  "LAST-MONTH-NOT-PLAYED"
  ;;  (lambda (track)
  ;;      (not (funcall (emms-browser-filter-only-recent 30) track))))
  (put 'emms-browser-delete-files 'disabled nil) ;删除文件不提醒
  (add-hook 'emms-browser-delete-files-hook ;删除封面和目录, 如果删除当前文件后目录已经没有音乐文件了
            'de-kill-covers-and-parents)
  ;; 设定 mplayer 支持的格式
  ;; (emms-player-set emms-player-mplayer 'regex
  ;;                    "\\.ogg\\|\\.mp3\\|\\.wav\\|\\.mpg\\|\\.mpeg\\|\\.wmv\\|\\.wma\\|\\.mov\\|\\.avi\\|\\.divx\\|\\.ogm\\|\\.asf\\|\\.mkv\\|http://\\|mms://\\|\\.rm\\|\\.rmvb\\|\\.mp4\\|\\.flac\\|\\.vob\\|\\.m4a\\|\\.ape\\|\\.mpc")

  (message "* ---[ emms post-load configuration is complete ]---"))

(provide 'xy-rc-emms)
