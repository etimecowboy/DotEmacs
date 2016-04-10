;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2016-04-10 Sun 15:17 by xin on zbox.soton.ac.uk>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-elscreen.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `elscreen.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------
(require 'xy-rc-utils)

;;;###autoload
(defun elscreen-postload ()
  "Settings of `elscreen.el' after it's been loaded."

  (require 'elscreen-color-theme)
  (require 'elscreen-dired)
  (require 'elscreen-server)
  (require 'elscreen-dnd)
  ;; (require 'elscreen-gf)
  ;; (require 'elscreen-goby)
  ;; (require 'elscreen-howm)
  (require 'elscreen-speedbar)
  (require 'elscreen-w3m)

  (setq elscreen-display-screen-number nil
        ;; elscreen-tab-display-control t
        ;; elscreen-tab-display-kill-screen t
        elscreen-display-tab t
        elscreen-prefix-key (kbd "C-z"))

  ;; TODO: Keep settings in different frames
  ;; (remove-hook 'after-make-frame-functions 'elscreen-make-frame-confs)
  ;; (remove-hook 'delete-frame-functions 'elscreen-delete-frame-confs)


 (defmacro elscreen-create-automatically (ad-do-it)
   (` (if (not (elscreen-one-screen-p))
          (, ad-do-it)
        (elscreen-create)
        (elscreen-notify-screen-modification 'force-immediately)
        (elscreen-message "New screen is automatically created"))))
 
 (defadvice elscreen-next (around elscreen-create-automatically activate)
   (elscreen-create-automatically ad-do-it))
 
 (defadvice elscreen-previous (around elscreen-create-automatically activate)
   (elscreen-create-automatically ad-do-it))
 
 (defadvice elscreen-toggle (around elscreen-create-automatically activate)
   (elscreen-create-automatically ad-do-it))

 ;; FIXME: not work
 ;; (defun elscreen-frame-title-update ()
 ;;   (when (elscreen-screen-modified-p 'elscreen-frame-title-update)
 ;;     (let* ((screen-list (sort (elscreen-get-screen-list) '<))
 ;; 	   (screen-to-name-alist (elscreen-get-screen-to-name-alist))
 ;; 	   (title (mapconcat
 ;; 		   (lambda (screen)
 ;; 		     (format "%d%s %s"
 ;; 			     screen (elscreen-status-label screen)
 ;; 			     (get-alist screen screen-to-name-alist)))
 ;; 		   screen-list " ")))
 ;;       (if (fboundp 'set-frame-name)
 ;;           (set-frame-name title)
 ;;         (setq frame-title-format title)))))

 ;; (eval-after-load "elscreen"
 ;;   '(add-hook 'elscreen-screen-update-hook 'elscreen-frame-title-update))
 
  ;;; elscreen-buffer-group
  ;; (when (try-require 'elscreen-buffer-group)
  ;;   (setq elscreen-buffer-group-exclusive t)
  ;;   ;; (setq 'elscreen-buffer-group-skip-commands
  ;;   ;;       `(my-special-buffer-switching-command))
  ;; )


  
  (message "* ---[ elscreen post-load configuration is complete ]---"))

(provide 'xy-rc-elscreen)
