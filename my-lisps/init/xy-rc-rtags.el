;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2017-06-26 Mon 10:21 by xin on xinud>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-rtags.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `rtags.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)



;;;###autoload
(defun rtags-postload ()
  "Settings for `rtags-mode' after it's been loaded."

  ;; CHECK: ``Integration with systemd (GNU Linux)''
  ;; (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
  ;; (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
  
  (message "* ---[ rtags post-load configuration is complete ]---"))

(provide 'xy-rc-rtags)

;; Integration with systemd (GNU Linux)
;;
;; On GNU/Linux distributions based on the systemd service manager, rdm can also be socket acivated.
;;
;; 1. Add the following to ~/.config/systemd/user/rdm.socket
;; [Unit]
;; Description=RTags daemon socket
;;
;; [Socket]
;; ListenStream=%t/rdm.socket
;;
;; [Install]
;; WantedBy=default.target
;;  
;; 2. Add the following to ~/.config/systemd/user/rdm.service
;; [Unit]
;; Description=RTags daemon
;;
;; Requires=rdm.socket
;;
;; [Service]
;; Type=simple
;; ExecStart=$RDM -v --inactivity-timeout 300 --log-flush
;; ExecStartPost=/bin/sh -c "echo +19 > /proc/$MAINPID/autogroup"
;; Nice=19
;; CPUSchedulingPolicy=idle
;;
;; 3. Replace =$RDM= with the path to your copy of =rdm=, and add any command
;; line parameters you might usually use.
;;
;; You have to use absolute paths here. =%h= is expanded to your home
;; directory.  Environment variables are not expanded inside strings.
;;
;; 4. Run the following command from the terminal:
;;
;; systemctl --user enable rdm.socket
;; systemctl --user start rdm.socket
;;
;; =Systemd= will create the =rdm= socket automatically.
;;
;; Usage
;;
;; Now that your files are indexed you can start using RTags. Normally you
;; would do this from your editor but the way to extract this information from
;; =rdm= is to use the command line tool =rc=.
;;
;; E.g.
;;
;; $ rdm &
;; $ ninja -t commands | rc -c
;; $ rc --follow-location Job.cpp:20:10
;; /home/abakken/dev/rtags/src/Job.h:10:18      List<RegExp> *mPathFiltersRegExp;
