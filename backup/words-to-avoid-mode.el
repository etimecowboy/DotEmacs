;; words-to-avoid-mode.el - A minor mode to help avoid various words.
;; Copyright (c) 2011 Rob Myers <rob@robmyers.org>
;; Based on fic-mode.el
;; Copyright (C) 2010, Trey Jackson <bigfaceworm(at)gmail(dot)com>
;; Words from: https://www.gnu.org/philosophy/words-to-avoid.html
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;; To use, save words-to-avoid-mode.el to a directory in your load-path.
;;
;; (require 'words-to-avoid-mode)
;; (add-hook 'text-mode-hook 'turn-on-words-to-avoid-mode)
;; (add-hook 'org-mode-hook 'turn-on-words-to-avoid-mode)
;;
;; or
;;
;; M-x words-to-avoid-mode
;;
;; NOTE: If you manually turn on words-to-avoid-mode,
;; you you might need to force re-fontification initially:
;;
;;   M-x font-lock-fontify-buffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defcustom words-to-avoid-foreground-color "Red"
  "Font foreground colour"
  :group 'words-to-avoid-mode)

(defcustom words-to-avoid-background-color "Yellow"
  "Font background color"
  :group 'words-to-avoid-mode)

(defcustom font-lock-words-to-avoid-face 'font-lock-words-to-avoid-face
  "variable storing the face for words-to-avoid mode"
  :group 'words-to-avoid-mode)

(make-face 'font-lock-words-to-avoid-face)
(modify-face 'font-lock-words-to-avoid-face words-to-avoid-foreground-color
             words-to-avoid-background-color nil t nil t nil nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Words
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst words-to-avoid-search-list-re "\\b\\(bsd-style\\|closed\\|cloud computing\\|commercial\\|compensation\\|consume\\|consumer\\|content\\|creator\\|digital goods\\|digital rights management\\|ecosystem\\|for free\\|freely available\\|freeware\\|give away software\\|hacker\\|intellectual property\\|LAMP\\|lamp system\\|linux kernel\\|linux system\\|market\\|mp3 player\\|open\\|open source\\|pc\\|photoshop\\|piracy\\|powerpoint\\|protection\\|rand\\|sell software\\|software industry\\|theft\\|trusted computing\\|vendor\\)\\b")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlighting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun words-to-avoid-search-for-keyword (limit)
  (let ((match-data-to-set nil)
	found)
    (save-match-data
      (while (and (null match-data-to-set)
		  (re-search-forward words-to-avoid-search-list-re limit t))
	(print (match-beginning 0))
	(print (match-end 0))
	    (setq match-data-to-set (match-data))))
    (when match-data-to-set
      (set-match-data match-data-to-set)
      (goto-char (match-end 0)) 
      t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(define-minor-mode words-to-avoid-mode "highlight words to avoid in text"
  :lighter " WORDS-TO-AVOID"
  :group 'words-to-avoid-mode
  (let ((kwlist '((words-to-avoid-search-for-keyword 
		   (0 'font-lock-words-to-avoid-face t)))))
    (if words-to-avoid-mode
        (font-lock-add-keywords nil kwlist)
      (font-lock-remove-keywords nil kwlist))))

(defun turn-on-words-to-avoid-mode ()
  "turn words-to-avoid-mode on"
  (interactive)
  (words-to-avoid-mode 1))

(provide 'words-to-avoid-mode)
