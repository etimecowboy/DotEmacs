;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:37 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-twittering-mode.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `twittering-mode.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun twittering-mode-settings ()
  "Settings of `twittering-mode'."

  ;; 避免每次都需要输入密码 (需要安装 gpg )
  (setq twittering-use-master-password t)

  ;; 一些网站（如 sina）不喜欢 SSL.
  (setq twittering-allow-insecure-server-cert t)
  (setq twittering-oauth-use-ssl nil)
  (setq twittering-use-ssl nil)

  ;; 状态栏上显示未读推数；显示头像
  (twittering-enable-unread-status-notifier)
  (setq-default twittering-icon-mode t)

  ;; 启动时默认打开的 timeline.
  ;; (setq twittering-initial-timeline-spec-string
  ;;       `( "http://weibo.com/u/2817412634"
  ;;          ;; ":home@douban"
  ;;       ))

  (setq twittering-enabled-services '(sina))
  (setq twittering-accounts '((sina (username "15327122549"))))
                                    ;; (auth oauth))))

  (message "* ---[ twittering-mode configuration is complete ]---"))

(provide 'xy-rc-twittering-mode)
