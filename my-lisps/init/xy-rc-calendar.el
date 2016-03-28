;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-03-28 Mon 13:28 by xin on zbox.soton.ac.uk>
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
(require 'xy-rc-utils)

;;;###autoload
(defun calendar-postload ()
  "Settings of `calendar.el' after it's been loaded."

  ;; years must be written in full
  (setq abbreviated-calendar-year nil)
  (setq diary-abbreviated-year-flag nil)

  ;; set the style of calendar and diary dates to ISO
  ;; this helps org-mode time-stamp to use iso format instead of other
  ;; (such as Chinese style)
  (setq calendar-date-style 'iso)

  ;; week in the calendar begins on Monday
  (setq calendar-week-start-day 1)

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
  (setq holiday-oriental-holidays nil)    ; get rid of Oriental holidays
  (setq calendar-chinese-all-holidays-flag nil)
  (setq holiday-solar-holidays nil)
  (setq holiday-christian-holidays nil)
  (setq calendar-christian-all-holidays-flag nil)
  (setq holiday-other-holidays nil)       ; user defined holidays
  ;; (setq holiday-local-holidays ;; add some holidays
  ;;       '(
  ;;         ))

  ;;------------------------------------------------------
  ;; Chinese calendar
  (require 'cal-china)

  ;; `cal-china-x'
  (try-require 'cal-china-x)

  (setq calendar-holidays ;;直接覆盖
        '(;;中国法定休息日
          (holiday-fixed 1 1 "元旦")
          (holiday-lunar 12 30 "春节" 0)
          (holiday-lunar 1 1 "春节" 0)
          (holiday-lunar 1 2 "春节" 0)
          (holiday-solar-term "清明" "清明节")
          (holiday-fixed 5 1 "劳动节")
          (holiday-lunar 5 5 "端午节" 0)
          (holiday-lunar 8 15 "中秋节" 0)
          (holiday-fixed 10 1 "国庆节")
          (holiday-fixed 10 2 "国庆节")
          (holiday-fixed 10 3 "国庆节")
        
          ;; 英国法定休息日
          (holiday-fixed 1 1 "New Year's Day")
          ;; (holiday-new-year-bank-holiday)
          ;; (holiday-fixed 2 14 "Valentine's Day")
          ;; (holiday-fixed 3 17 "St. Patrick's Day")
          ;; (holiday-fixed 4 1 "April Fools' Day")
          ;; (holiday-easter-etc -47 "Shrove Tuesday")
          ;; (holiday-easter-etc -21 "Mother's Day")
          (holiday-easter-etc -2 "Good Friday")
          ;; (holiday-easter-etc 0 "Easter Sunday")
          (holiday-easter-etc 1 "Easter Monday")
          (holiday-float 5 1 1 "Early May Bank Holiday")
          (holiday-float 5 1 -1 "Spring Bank Holiday")
          ;; (holiday-float 6 0 3 "Father's Day")
          (holiday-float 8 1 -1 "Summer Bank Holiday")
          ;; (holiday-fixed 10 31 "Halloween")
          ;; (holiday-fixed 12 24 "Christmas Eve")
          (holiday-fixed 12 25 "Christmas Day")
          (holiday-fixed 12 26 "Boxing Day")
          ;; (holiday-christmas-bank-holidays)
          ;; (holiday-fixed 12 31 "New Year's Eve")

          ;; 纪念日 -- 家人,朋友
          (holiday-lunar  1  9  "我的农历生日")
          (holiday-fixed  2 13  "我的生日")
          (holiday-fixed 12  5  "老婆生日")
          (holiday-fixed  7 28  "儿子生日")
          (holiday-fixed 10 10  "爸爸生日")
          (holiday-fixed  6  9  "妈妈生日")
          ;; (holiday-fixed 1 20 "岳父生日")
          ;; (holiday-fixed 1 19 "岳母生日")
          (holiday-fixed  1  8 "结婚纪念日")
          (holiday-fixed  2 14  "情人节")
          (holiday-lunar  7  7  "七夕")
          ))

  ;;----------------------------------------------------------------
  ;; Sunrise/Sunset
  ;; 设置所在地的经纬度和地名，calendar 中按 S，可以根据这些信息告知你
  ;; 每天的日出和日落的时间
  ;; (setq calendar-latitude [50 87 north])
  ;; (setq calendar-longitude [4 71 east])
  ;; (setq calendar-location-name "Leuven, BE")

  (message "* ---[ calendar post-load configuration is complete ]---"))

(provide 'xy-rc-calendar)
