;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:45 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-term.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `term' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun term-send-kill-whole-line ()
  "Kill whole line in term mode."
  (interactive)
  (term-send-raw-string "\C-a")
  ;; 没有`sleep-for'有时候就不行, 不知道为什么
  (sleep-for 0 1)
  (kill-line)
  (term-send-raw-string "\C-k"))

;;;###autoload
(defun term-send-kill-line ()
  "Kill line in term mode."
  (interactive)
  (call-interactively 'kill-line)
  (term-send-raw-string "\C-k"))

;;;###autoload
(defun term-send-yank ()
  "Yank in term mode."
  (interactive)
  (yank)
  (term-send-raw-string (current-kill 0)))

;;;###autoload
(defun term-send-copy-line ()
  "Copy left line in term mode."
  (interactive)
  (term-send-home)
  (sleep-for 0 1)
  (term-send-copy-line-left))

;;;###autoload
(defun term-send-copy-line-left ()
  "Copy current left line in term mode."
  (interactive)
  (term-send-kill-line)
  (term-send-raw-string "\C-_"))

;;;###autoload
(defun term-send-backward-kill-semi-word ()
  "Backward kill semiword in term mode."
  (interactive)
  (term-send-raw-string "\e\C-h"))

;;;###autoload
(defun term-send-undo ()
  "Undo in term mode."
  (interactive)
  (term-send-raw-string "\C-_"))

;;;###autoload
(defun term-send-esc ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "\e"))

;;;###autoload
(defun term-send-c-x ()
  "Send `C-x' to term."
  (interactive)
  (term-send-raw-string "\C-x"))

;;;###autoload
(defun term-mode-hook-settings ()
  "Settings for `term-mode-hook'"
  ;; emacs gui版本如果不把scroll-margin设为0
  ;; 当光标最屏幕底部时，有可能使得屏幕发生抖动
  (make-local-variable 'scroll-margin)
  (setq scroll-margin 0)
  (kill-buffer-when-shell-command-exit))

;;;###autoload
(defun switch-term-and-text ()
  "if current in `term-mode', switch to `text-mode',
   else switch to `term-mode'."
  (interactive)
  (if (equal major-mode 'term-mode)
      (text-mode)
    (enter-term-mode)))

;;;###autoload
(defun enter-term-mode ()
  "Enter in `term-mode'."
  (interactive)
  (term-mode)
  (term-char-mode))

;;;###autoload
(defun enter-text-mode ()
  "Enter in `text-mode'."
  (interactive)
  (text-mode))

;;;###autoload
(defun term-postload ()
  "Settings for `term' after it's been loaded."

  ;; multi-term: a mode based on term.el,
  ;; for managing multiple terminal buffers in Emacs.
  (require 'multi-term)
  (add-hook 'term-mode-hook 'term-mode-hook-settings)

  (setq term-unbind-key-list '("C-x" "<ESC>" "<up>" "<down>" "C-j"))
  (setq term-bind-key-alist
      `(("C-c"   . term-send-raw)
        ("C-p"   . term-send-raw)
        ("C-n"   . term-send-raw)
        ("C-s"   . isearch-forward)
        ("C-r"   . term-send-raw)
        ("C-m"   . term-send-raw)
        ("C-k"   . term-send-kill-whole-line)
        ("C-y"   . term-send-raw)
        (,(if window-system "C-/" "C-_") . term-send-undo)
        ("C-M-h" . term-send-backward-kill-semi-word)
        ("M-H"   . enter-text-mode)
        ("M-J"   . switch-term-and-text)
        ("M-f"   . term-send-raw-meta)
        ("M-b"   . term-send-raw-meta)
        ("M-d"   . term-send-raw-meta)
        ("M-K"   . term-send-kill-line)
        ("M-p"   . previous-line)
        ("M-n"   . next-line)
        ("M-u"   . term-send-raw-meta)
        ("M-w"   . term-send-copy-line)
        ("M-W"   . term-send-copy-line-left)
        ("M-y"   . term-send-raw-meta)
        ("M-."   . term-send-raw-meta)
        ("M-/"   . term-send-raw-meta)
        ("M-0"   . term-send-raw-meta)
        ("M-1"   . term-send-raw-meta)
        ("M-2"   . term-send-raw-meta)
        ("M-3"   . term-send-raw-meta)
        ("M-4"   . term-send-raw-meta)
        ("M-5"   . term-send-raw-meta)
        ("M-6"   . term-send-raw-meta)
        ("M-7"   . term-send-raw-meta)
        ("M-8"   . term-send-raw-meta)
        ("M-9"   . term-send-raw-meta)))

  (message "* ---[ term-mode post-load configuration is complete ]---"))

;; emacs上水木的一些配置
;; (@url :file-name "http://www.newsmth.net/bbsanc.php?path=%2Fgroups%2Fcomp.faq%2FEmacs%2Fmode%2Fdired%2Frokia" :display "Emacs版 (精华区)@newsmth.net")

;1.调整一些颜色，因为我的emacs是白底的，所以改一些颜色否则看不清。不喜
;欢的话直接去掉就好了。
;; (defvar ansi-term-color-vector
;;   [unspecified "white" "red3" "green3" "red3" "blue2"
;;                "magenta3" "cyan3" "black"])

;; 防止idle,就是每过20分钟发一个@字符过去。　这个功能写的不好，因为只是
;; 机械的每过20分钟就发，即使你正在上面发文。还好是20分钟，影响不是太大
(setq dd-anti-idle-timer (run-at-time "15 min" 900
                                      'dd-send-noidle-to-term))
;;;###autoload
(defun dd-send-noidle-to-term()
  "send noidle to term , such as smth"
  (interactive)
  (cancel-timer dd-anti-idle-timer)
  (let* ((oldbuf (buffer-name)))
    (set-buffer dd-newsmth-buffer-name)
    (if(string= "term-mode" (format "%s" major-mode))
        (term-send-raw-string "@")
      ((lambda ()
         (message "no ansi-term found")
         (insert "oh, I am disconnected")
         (cancel-timer dd-anti-idle-timer)
         ))
      )
    (switch-to-buffer oldbuf)
    )
  )

;; 还加了一个自动登录，你把里面的username,password改成你的，就好了。但
;; 是这个功能也不完善，如果登录时间太慢的话，就发不出去了
;;;###autoload
(defun dd-auto-logon (user pwd)
  (term-send-raw-string (concat user "\n" pwd "\n" ))
  )

;;;###autoload
(defun dd-term-telnet(host)
  "dd telnet"
  (interactive "Maddress:")
  (ansi-term "telnet")
  (term-line-mode)
  (insert (concat (concat "open " host ) "\n"))
  (term-char-mode))

;;;###autoload
(defun dd-logon-newsmth()
  "log on newsmth.net"
  (interactive)
  ;; (dd-set-color 1)
  (cancel-timer dd-anti-idle-timer)
  ;; (set-w32-system-coding-system 'chinese-gbk)
  (set-terminal-coding-system 'gbk-dos)
  (dd-term-telnet "newsmth.net")
  (sit-for 5)
  ;; (term-send-raw-string "rokia\n")
  (dd-auto-logon "username" "password")
  (setq dd-anti-idle-timer (run-at-time "15 min" 900 'dd-send-noidle-to-term))
  (setq dd-newsmth-buffer-name (buffer-name (current-buffer)))
  )

(setq dd-newsmth-buffer-name nil)
;设置了一个F9键，切换水木，就是象老板键的意思，这个比较适合在公司用。
;;;###autoload
(defun dd-switch-newsmth()
  "switch  newsmth"
  (interactive)
  (if (get-buffer dd-newsmth-buffer-name)
      (if (string= (buffer-name (current-buffer)) (buffer-name (get-buffer dd-newsmth-buffer-name)))
          (bury-buffer)
        (switch-to-buffer dd-newsmth-buffer-name)
        )
    (dd-logon-newsmth)
    )
  )

;; (global-set-key [f9] 'dd-switch-newsmth)

(provide 'xy-rc-term)
