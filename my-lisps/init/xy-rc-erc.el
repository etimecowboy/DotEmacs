;; ;;;###autoload
;; (defun login-irc ()
;;   "Login to irc."
;;   (interactive)
;;   (erc :server "irc.oftc.net"))

;; ;;;###autoload
;; (defun erc-postload ()
;;   "Settings of `erc' after it's been loaded."
;;   (require 'erc-nicklist)
;;   (require 'erc-highlight-nicknames)

;;   (add-to-list 'erc-modules 'highlight-nicknames)
;;   (erc-update-modules)

;;   (setq erc-nick-uniquifier "2"))
