;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-08 Wed 17:50 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-net.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My web packages' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;* url
(eval-after-load "url" '(url-postload)) ;; proxy setting is in it

;; Abbrev quickurl
;; (setq quickurl-url-file (concat my-emacs-path "/quickurls"))


;; Use external program as the default web browser in X-window
(if window-system
    (progn
      (Windows
       (setq browse-url-browser-function
             'browse-url-default-windows-browser))
      (GNULinux
       (setq browse-url-browser-function
             'browse-url-default-browser)))
  (setq browse-url-browser-function 'w3m-browse-url))


;;* w3m
(eval-after-load "w3m"
  '(progn
     (w3m-postload)
     (eal-define-keys
      'w3m-mode-map
      `(("C-x W f"      w3m-external-view-current-url)
        ("C-x W F"      w3m-external-view-this-url)
        ("C-x W o"      org-w3m-copy-for-org-mode) ;; copy region as org format
        ("S-<mouse-1>"  w3m-mouse-view-this-url-new-session)
        ("<mouse-3>"    w3m-mouse-major-mode-menu)
        ("C-x W s"      w3m-save-current-buffer)
        ("C-x W w"      w3m-weather)
        ("C-x W l"      w3m-copy-current-url)))))

(eal-define-keys-commonly
 global-map
 `(("C-x W n"     w3m-goto-url-new-session)
   ("C-x W b"     view-w3m-bookmark)
   ("C-x W w"     switch-to-w3m)
   ("<f8> u"      browse-url)
   ;; ("<f8> d"      lookup-word-definition)
   ;; ("<f8> w"      lookup-wikipedia) ;; not very useful
   ;; ("<f8> s"      google-region)
   ))

(setq browse-url-generic-program "w3m") ;; It won't affect emacs
                                        ;; default browser
(global-set-key (kbd "<f8> w") 'w3m)


;;* erc
;; (eval-after-load "erc" '(erc-postload))


;;* weblogger
;; (eval-after-load "weblogger" '(weblogger-postload))


;;* org2blog
;; use publish org to HTML then use xml-rpc to blog
;; NOTE: Moved to `xy-rcroot-write.el'
;; (eval-after-load "org2blog" '(org2blog-postload))


;;* babel
;; 网络翻译接口
(autoload 'babel "babel"
   "Use a web translation service to translate the message MSG." t)
(autoload 'babel-region "babel"
  "Use a web translation service to translate the current region." t)
(autoload 'babel-as-string "babel"
  "Use a web translation service to translate MSG, returning a string." t)
(autoload 'babel-buffer "babel"
  "Use a web translation service to translate the current buffer." t)
(eval-after-load "babel" '(babel-postload))
;; (global-set-key [f12] 'babel)
(global-set-key (kbd "<f12> r") 'babel-region)
;; (global-set-key (kbd "S-<f12>") 'babel-buffer)


;;* dictionary
;; Web dictionary via dictd
;; (require 'dictionary-autoloads)
;; (global-set-key "\C-cS" 'dictionary-search)
;; (global-set-key "\C-cM" 'dictionary-match-words)
(global-set-key (kbd "<f12> d") 'dictionary-search)
(global-set-key (kbd "<f12> m") 'dictionary-match-words)


;;* eagle
;; twitter client


;; * weibo.emacs

;;      (@url :file-name "http://emacser.com/weibo.htm" :display "Post@emacser.com")
;; TODO: Make it work
;; (autoload 'weibo-timeline "weibo-timeline"
;;   "Check your sina weibo timeline." t)
(when (try-require 'weibo)
  (setq oauth-use-curl t))
;; (try-require 'weibo)


;; * twittering-mode
;; REF: (@url :file-name "http://emacser.com/twittering-mode.htm" :display "Post@emacser.com")
;;      (@url :file-name "http://harfang.yo2.cn/?p=11522" :display "Another Post")
;; TODO: Make it work
;; (eval-after-load "twittering-mode"
;;   '(progn
;;     (twittering-mode-postload)))


;;* google-maps
;; REF: (@url :file-name "http://emacser.com/emacs-google-map.htm" :display "emacswiki")
;; (eval-after-load "google-maps"
;;   '(progn
;;     (google-maps-postload)))
;; (eal-define-keys
;;  'google-maps-static-mode-map
;;  `(("t"   sb-toggle-keep-buffer)
;;    ("'"   switch-to-other-buffer)
;;    ("="   google-maps-static-zoom-in)
;;    ("1"   delete-other-windows)
;;    ("2"   split-window-vertically)
;;    ("3"   split-window-horizontally)
;;    ("o"   other-window)
;;    ("C-t" google-maps-static-set-maptype)))
;; (require 'google-maps)


;;* cn-weather
;; (require 'cn-weather)
;; (defalias 'weather 'cn-weather-today)
;; (defalias 'weather-tomorrow 'cn-weather-forecast)


;;* emms
;; Emacs 音乐播放器
(eval-after-load "emms-playlist-mode"
  '(progn
     (emms-postload)
     (eal-define-keys
     'emms-playlist-mode-map
      `(("<double-mouse-1>" emms-pause)))))

(eal-define-keys-commonly
 dired-mode-map
 `(("C-x a"    emms-add-dired)
   ("C-x p"    emms-play-dired)))

(eal-define-keys-commonly
 global-map
 `(("<f8> e"  xy/emms-start)
   ("C-x E b" emms-browser)
   ("C-x E f" emms-play-file)
   ("C-x E l" emms-play-playlist)
   ("C-x E s" emms-playlist-save)
   ("C-x E d" emms-play-directory)
   ("C-x E m" emms-playlist-mode-go)
   ("C-x E p" emms-playlist-mode-go-popup)
   ("C-x E a" emms-add-directory)
   ("C-x E t" emms-add-directory-tree)
   ("C-x E <up>"      emms-start)
   ("C-x E <down>"    emms-pause)
   ("C-x E <left>"    emms-previous)
   ("C-x E <right>"   emms-next)
   ;; ("C-x E <right>"   emms-seek-forward)
   ;; ("C-x E <left>"    emms-seek-backward)
   ;; BUG: Only works in Linux with `amixer' installed
   ("C-x E +"  emms-volume-raise)
   ("C-x E -"  emms-volume-lower)))


;;* gnus
;; 新闻组阅读
(eval-after-load "gnus"
  '(progn
     (gnus-postload)
     (define-key gnus-summary-mode-map (kbd "C-c C-x C-s")
       'my-archive-article)))
(global-set-key (kbd "<f8> g") 'gnus)


;;* mew
;; email client
(eval-after-load "mew" '(mew-postload))
(setq mail-user-agent 'mew-user-agent) ;; set mew as emacs email agent
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
(autoload 'mew-user-agent-compose "mew" nil t)
(global-set-key (kbd "<f8> m") 'mew)


;;* ansit
;; 把emacs中的代码以ansi高亮形式贴到bbs上
(autoload 'ansit "ansit" nil t)
(autoload 'ansit-buffer "ansit" nil t)
(autoload 'ansit-copy-and-kill-buffer "ansit" nil t)


;;* edit-server
;; Chrome extension: Edit with Emacs
;; REF: (@url :file-name "https://chrome.google.com/webstore/detail/ljobjlafonikaiipfkggjbhkghgicgoh" :display "website")
(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))


;;* gist
;; Github gist service
;; Online code snippet for sharing and version controlling
(pcache-preload)
(eval-after-load "gist" '(gist-postload))
;; NOTE: Change the location of cache file (by pcache)
(eval-after-load "pcache" '(pcache-postload))
(global-set-key (kbd "C-x G y") 'gist-region-or-buffer)
(global-set-key (kbd "C-x G p") 'gist-region-or-buffer-private)
(global-set-key (kbd "C-x G l") 'gist-list)


(provide 'xy-rcroot-net)
