;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-03-29 Fri 14:58 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-server.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `server.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;--------------------------------------------------------------------
;; From emacs@newsmth
;; By lisd <alonewolf.lei@gmail.com>
;; 控制server-start ，当server已经开启了，再启动第二个emacs的时候就不会
;; 再开启。这样，关闭没有启动server的emacs时不会影响已启动server的那个。
;;;###autoload
(defun server-start-if-not-exists ()
  "Start the emacs server if it has not been started yet, or \
leave it alone."

  (require 'server)
  (interactive)
  (let* ((server-file (expand-file-name
                       server-name
                       (if server-use-tcp server-auth-dir server-socket-dir))))
    (if (file-exists-p server-file)
        (progn
          (set-buffer (get-buffer-create "*Netstat*"))
          (erase-buffer)
          (set-process-sentinel
           (start-process "Netstat" (current-buffer) "netstat" "-nao")
           '(lambda (process state)
              (let* ((server-file (expand-file-name
                                   (if server-use-tcp server-auth-dir
                                     server-socket-dir)))
                     (current-server-sock)
                     (current-server-pid)
                     (full-sock-info)
                     (full-string))

                (set-buffer (get-buffer-create "*Netstat*"))
                (setq full-sock-info (buffer-string))
                (kill-buffer (current-buffer))
                (set-buffer (find-file-noselect server-file))
                (setq full-string (buffer-string))
                (kill-buffer (current-buffer))

                (setq current-server-sock
                      (substring full-string 0 (string-match " " full-string)))
                (setq current-server-pid
                      (substring full-string (1+ (string-match " " full-string))
                                 (string-match "\n" full-string)))
                (setq full-string
                      (concat current-server-sock " .* LISTENING *"
                              (if (string-match
                                   full-string
                                   full-sock-info)
                                  t
                                (server-start)
                                (add-hook ;; 启动emacs server之后，就会
                                 ;; 生成server文件
                                 ;; /tmp/emacs${UID}/server ，
                                 ;; 而且不会自动删除，所以，关
                                 ;; 闭emacs之后，会导致下次启
                                 ;; 动失败。
                                 'kill-emacs-hook
                                 `(lambda()
                                    (ignore-errors (delete-file ,server-file)))))))))

      ;;;; then block.
           (server-start)
           (add-hook
            'kill-emacs-hook
            `(lambda()
               (ignore-errors (delete-file ,server-file)))))))))

;;;###autoload
(defun server-preload ()
  "Settings of `server.el' before it's been loaded."

  ;; (setq-default server-auth-dir (concat my-var-path "/server"))

  (message "* ---[ server pre-load configuration is complete ]---"))

;;;###autoload
(defun server-postload ()
  "Settings of `server.el' after it's been loaded."

  ;; Any server function that may delete the server file should never
  ;; move it to trash instead.
  ;; macro `bypass-trash-in-function(fun)' sets FUN to always use
  ;; normal deletion, and never trash.
  (mapc (lambda (fun) (eval `(bypass-trash-in-function ,fun)))
        '(server-start server-sentinel server-force-delete))

  (message "* ---[ server post-load configuration is complete ]---"))

(provide 'xy-rc-server)
