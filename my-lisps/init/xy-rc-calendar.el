;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-07-01 Sun 23:25 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-calendar.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `calendar.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(require 'cl)
(require 'xy-rc-utils)

;;;###autoload
(defun animals(birthyear)
  "Calculate the Chinese aninal by year"
  (let ((x (% (- 1997 birthyear) 12)))
    (cond ((or (= x 1) (= x -11))  "鼠")
          ((= x 0)                 "牛")
          ((or (= x 11) (= x -1))  "虎")
          ((or (= x 10) (= x -2))  "兔")
          ((or (= x 9) (= x -3))   "龙")
          ((or (= x 8) (= x -4))   "蛇")
          ((or (= x 7) (= x -5))   "马")
          ((or (= x 6) (= x -6))   "羊")
          ((or (= x 5) (= x -7))   "猴")
          ((or (= x 4) (= x -8))   "鸡")
          ((or (= x 3) (= x -9))   "狗")
          ((or (= x 2) (= x -10))  "猪"))))

;;;###autoload
(defun calendar-settings ()
  "Settings of `calendar.el'."

  ;; years must be written in full
  (setq abbreviated-calendar-year nil)
  (setq diary-abbreviated-year-flag nil)

  ;; set the style of calendar and diary dates to ISO
  ;; this helps org-mode time-stamp to use iso format instead of other
  ;; (such as Chinese style)
  (setq calendar-date-style 'iso)

  ;; week in the calendar begins on Monday
  (setq calendar-week-start-day 1)

  (setq calendar-chinese-celestial-stem
        ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
  (setq calendar-chinese-terrestrial-branch
        ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

  ;; mark all visible dates that have diary entries
  (setq calendar-mark-diary-entries-flag t)
  ;; (add-hook 'initial-calendar-window-hook 'mark-diary-entries)

  ;; mark all holidays
  (setq calendar-mark-holidays-flag t)

  ;; marks the current date, by changing its face
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)

  ;; remove some holidays
  (setq holiday-bahai-holidays nil)       ; get rid of Baha'i holidays
  (setq holiday-general-holidays nil)     ; get rid of too U.S.-centric holidays
  (setq holiday-hebrew-holidays nil)      ; get rid of religious holidays
  (setq holiday-islamic-holidays nil)     ; get rid of religious holidays
  (setq holiday-oriental-holidays t)    ; get rid of Oriental holidays
  (setq holiday-solar-holidays t)
  (setq holiday-christian-holidays nil)
  (setq calendar-christian-all-holidays-flag nil)
  (setq holiday-other-holidays nil)       ; user defined holidays
  ;; (setq holiday-local-holidays ;; add some holidays
  ;;       '(
  ;;         ))

  (setq calendar-holidays ;;直接覆盖
        '(;;公历节日
          (holiday-fixed 1 1 "元旦")
          (holiday-fixed 2 14 "情人节")
          (holiday-fixed 4 1 "愚人节")
          (holiday-float 5 0 2 "母亲节")
          (holiday-float 6 0 3 "父亲节")
          ;; 英国节日
          (holiday-float 4 5 1 "Good Friday")
          (holiday-float 4 1 2 "Easter Bank Holiday")
          (holiday-float 5 1 1 "Early May Bank Holiday")
          (holiday-float 6 1 1 "Spring Bank Holiday")
          (holiday-float 8 1 4 "Summer Bank Holiday")
          (holiday-fixed 12 25 "Christmas")
          (holiday-fixed 12 26 "Boxing Day")
          ;; 中国节日
          (holiday-chinese 1 1 "春节")
          (holiday-chinese 1 2 "春节")
          (holiday-chinese 1 3 "春节")
          (holiday-chinese 1 15 "元宵节")
          (holiday-chinese 7 7 "七夕")
          (holiday-chinese 8 15 "中秋节")
          (holiday-chinese 5 5 "端午节")
          ;; Need `cal-china-x.el'
          ;; (holiday-solar-term "清明" "清明节")
          (holiday-fixed 3 8 "妇女节")
          (holiday-fixed 5 1 "劳动节")
          (holiday-fixed 6 1 "儿童节")
          (holiday-fixed 9 10 "教师节")
          (holiday-fixed 10 1 "国庆节")
          (holiday-fixed 10 2 "国庆节")
          (holiday-fixed 10 3 "国庆节")
          ;; 生日纪念日 -- 家人,朋友
          (holiday-fixed 2 13 "我的生日")
          (holiday-fixed 12 05 "老婆生日")
          (holiday-fixed 7 28 "牛牛生日")
          (holiday-fixed 10 10 "爸爸生日")
          (holiday-fixed 6 9 "妈妈生日")
          (holiday-fixed 1 20 "岳父生日")
          (holiday-fixed 1 19 "岳母生日")
          (holiday-fixed 1 8 "结婚纪念日")
          ))

  ;;------------------------------------------------------------------
  ;; cal-china-x ;; 农历扩展 BUG: 使用后calendar崩溃
  ;; (require 'cal-china-x)
  ;; (setq holiday-xy-holidays
  ;;       '(;;公历节日
  ;;         (holiday-fixed 1 1 "元旦")
  ;;         (holiday-fixed 2 14 "情人节")
  ;;         (holiday-fixed 4 1 "愚人节")
  ;;         (holiday-float 5 0 2 "母亲节")
  ;;         (holiday-float 6 0 3 "父亲节")
  ;;         (holiday-fixed 12 25 "圣诞节")
  ;;         ;; 英国节日
  ;;         (holiday-float 4 5 1 "Good Friday")
  ;;         (holiday-float 4 1 2 "Easter Bank Holiday")
  ;;         (holiday-float 5 1 1 "Early May Bank Holiday")
  ;;         (holiday-float 6 1 1 "Spring Bank Holiday")
  ;;         (holiday-float 8 1 3 "Summer Bank Holiday")
  ;;         (holiday-fixed 12 26 "Boxing Day")
  ;;         ;; 中国节日
  ;;         (holiday-lunar 12 30 "春节" 0)
  ;;         (holiday-lunar 1 1 "春节" 0)
  ;;         (holiday-lunar 1 2 "春节" 0)
  ;;         (holiday-lunar 1 15 "元宵节" 0)
  ;;         (holiday-solar-term "清明" "清明节")
  ;;         (holiday-lunar 5 5 "端午节" 0)
  ;;         (holiday-fixed 3 8 "妇女节")
  ;;         (holiday-fixed 5 1 "劳动节")
  ;;         (holiday-fixed 6 1 "儿童节")
  ;;         (holiday-lunar 8 15 "中秋节" 0)
  ;;         (holiday-fixed 9 10 "教师节")
  ;;         (holiday-fixed 10 1 "国庆节")
  ;;         (holiday-fixed 10 2 "国庆节")
  ;;         (holiday-fixed 10 3 "国庆节")
  ;;         ;; 生日纪念日 -- 家人,朋友
  ;;         (holiday-fixed 2 13 "我的生日")
  ;;         (holiday-fixed 12 05 "老婆生日")
  ;;         (holiday-fixed 7 28 "牛牛生日")
  ;;         (holiday-fixed 10 10 "爸爸生日")
  ;;         (holiday-fixed 6 9 "妈妈生日")
  ;;         (holiday-fixed 1 20 "岳父生日")
  ;;         (holiday-fixed 1 19 "岳母生日")
  ;;         (holiday-fixed 1 8 "结婚纪念日")
  ;;         ))
  ;; (setq calendar-holidays holiday-xy-holidays) ;;直接覆盖

  ;;----------------------------------------------------------------
  ;; Sunrise/Sunset
  ;; 设置所在地的经纬度和地名，calendar 中按 S，可以根据这些信息告知你
  ;; 每天的日出和日落的时间
  ;; (setq calendar-latitude [50 87 north])
  ;; (setq calendar-longitude [4 71 east])
  ;; (setq calendar-location-name "Leuven, BE")

  (message "* ---[ calendar configuration is complete ]---"))

(provide 'xy-rc-calendar)
