;; ;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; ;; Time-stamp: <2012-08-02 Thu 02:14 by xin on p5q>
;; ;;--------------------------------------------------------------------
;; ;; File name:    `xy-rc-muse.el'
;; ;; Author:       Xin Yang
;; ;; Email:        xin2.yang@gmail.com
;; ;; Description:  Emacs publish system
;; ;;    ___ _ __ ___   __ _  ___ ___
;; ;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;; ;;  |  __/ | | | | | (_| | (__\__ \
;; ;;  \____|_| |_| |_|\__,_|\___|___/
;; ;;
;; ;;--------------------------------------------------------------------

;; (eval-when-compile (require 'cl))
;; (require 'xy-rc-utils)

;; ;;* Muse
;; ;; muse configurations, publishing documents in various formats
;; ;; Based on Michael Olson's example and ywb's configuration

;; ;; Add to load path
;; ;;(add-to-list 'load-path "/home/mwolson/proj/emacs/muse/git-muse/experimental")

;; ;; Initialize
;; (try-require 'outline)       ; I like outline-style faces
;; (try-require 'muse)          ; load generic module
;; (try-require 'muse-colors)   ; load coloring/font-lock module
;; (try-require 'muse-mode)     ; load authoring mode
;; ;;(require 'muse-blosxom)  ; load blosxom module
;; (try-require 'muse-docbook)  ; load DocBook publishing style
;; (try-require 'muse-html)     ; load (X)HTML publishing style
;; (try-require 'muse-latex)    ; load LaTeX/PDF publishing styles
;; (try-require 'muse-latex2png) ; publish <latex> tags
;; (try-require 'muse-project)  ; load support for projects
;; (try-require 'muse-texinfo)  ; load Info publishing style
;; (try-require 'muse-wiki)     ; load Wiki support
;; (try-require 'muse-xml)      ; load XML support
;; ;;(try-require 'muse-message)  ; load message support (experimental)

;; ;;(try-require 'muse-remote-publish)  ; load remote publish
;; ;;(load "muse-myfile.el")   ; load myfile url support

;; ;; Setup projects

;; ;; Here is an example of making a customized version of your favorite
;; ;; publisher.  All this does is run `my-muse-blosoxm-finalize' on the
;; ;; published file immediately after saving it.
;; ;;(muse-derive-style "my-blosxom" "blosxom-xhtml"
;; ;;                   :final 'my-muse-blosxom-finalize)

;; ;; This turns relative links into absolute links
;; (muse-derive-style "my-pdf" "pdf"
;;                    :before 'my-muse-pdf-prepare-buffer
;;                    :header "~/emacs/muse/addon/templates/header.tex")
;; ;;                   :footer "~/emacs/muse/addon/templates/footer.tex")

;; (muse-derive-style "my-pdfcjk" "pdfcjk"
;;                    :before 'my-muse-pdf-prepare-buffer)
;; ;;                   :header "~/emacs/muse/addon/templates/header.tex")
;; ;;                   :footer "~/emacs/muse/addon/templates/footer.tex")



;; ;; This uses a different header and footer than normal
;; (muse-derive-style "my-xhtml" "xhtml"
;;                    :header "~/emacs/muse/addon/templates/header.html"
;;                    :footer "~/emacs/muse/addon/templates/footer.html")

;; ;; Define a draft style which provides extra space between sections
;; (defvar muse-latex-draft-markup-strings
;;   '((chapter      . "\\bigskip\n\\bigskip\n\\chapter{")
;;     (section      . "\\bigskip\n\\bigskip\n\\section{")
;;     (subsection   . "\\bigskip\n\\bigskip\n\\subsection{")
;;     (subsubsection . "\\bigskip\n\\bigskip\n\\subsubsection{"))
;;   "Strings used for marking up Latex draft text.")

;; (muse-derive-style "latex-draft" "latex"
;;                    :strings 'muse-latex-draft-markup-strings
;;                    ;;                   :header "~/muse/addon/templates/header.tex")
;;                    :footer "~/emacs/muse/addon/templates/footer.tex")

;; (muse-derive-style "pdf-draft" "latex-draft"
;;                    :final   'muse-latex-pdf-generate
;;                    :browser 'muse-latex-pdf-browse-file
;;                    :link-suffix 'muse-latex-pdf-extension
;;                    :osuffix 'muse-latex-pdf-extension)

;; ;; Define a style with unnumbered titles
;; (defvar muse-latex-uh-markup-strings
;;   '((chapter      . "\\chapter*{")
;;     (section      . "\\section*{")
;;     (subsection   . "\\subsection*{")
;;     (subsubsection . "\\subsubsection*{"))
;;   "Strings used for marking up Latex text with unnumbered headings.")

;; (muse-derive-style "latex-uh" "latex"
;;                    :strings 'muse-latex-uh-markup-strings)
;; (muse-derive-style "pdf-uh" "latex-uh"
;;                    :final   'muse-latex-pdf-generate
;;                    :browser 'muse-latex-pdf-browse-file
;;                    :link-suffix 'muse-latex-pdf-extension
;;                    :osuffix 'muse-latex-pdf-extension)

;; ;; Here is my master project listing.
;; ;; Publish this directory and its subdirectories.  Arguments
;; ;; are as follows.  The above `muse-project-alist-dirs' part
;; ;; is also needed.
;; ;;   1. Source directory
;; ;;   2. Output directory
;; ;;   3. Publishing style
;; ;;   remainder: Other things to put in every generated style
;; (setq muse-project-alist
;;       `(
;;         ("ideas"
;;          (,@(muse-project-alist-dirs
;;              "~/emacs/muse/source/ideas/")
;;           :base-url "http://192.168.1.100/muse/ideas/"
;;           :force-publish ("index")
;;           :default "index")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/ideas"
;;             "/ftp:nobody@192.168.1.100:/muse/ideas"
;;             "my-xhtml")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/ideas"
;;             "~/emacs/muse/pdf/ideas"
;;             "my-pdfcjk"))
;;         ("readings"
;;          (,@(muse-project-alist-dirs
;;              "~/emacs/muse/source/readings/")
;;           :base-url "http://192.168.1.100/muse/readings/"
;;           :force-publish ("index")
;;           :default "index")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/readings"
;;             "/ftp:nobody@192.168.1.100:/muse/readings"
;;             "my-xhtml")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/readings"
;;             "~/emacs/muse/pdf/readings"
;;             "my-pdfcjk"))
;;         ("research"
;;          (,@(muse-project-alist-dirs
;;              "~/emacs/muse/source/research/")
;;           :base-url "http://192.168.1.100/muse/research/"
;;           :force-publish ("index")
;;           :default "index")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/research/"
;;             "/ftp:nobody@192.168.1.100:/muse/research/"
;;             "my-xhtml")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/research"
;;             "~/emacs/muse/pdf/research"
;;             "my-pdf")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/research"
;;             "~/emacs/muse/pdf/research"
;;             "latex-draft"))
;;         ("software"
;;          (,@(muse-project-alist-dirs
;;              "~/emacs/muse/source/software/")
;;           :base-url "http://192.168.1.100/muse/software/"
;;           :force-publish ("index")
;;           :default "index")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/software"
;;             "/ftp:nobody@192.168.1.100:/muse/software"
;;             "my-xhtml")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/software"
;;             "~/emacs/muse/pdf/software"
;;             "my-pdfcjk"))
;;         ("hardware"
;;          (,@(muse-project-alist-dirs
;;              "~/emacs/muse/source/hardware/")
;;           :base-url "http://192.168.1.100/muse/hardware/"
;;           :force-publish ("index")
;;           :default "index")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/hardware"
;;             "/ftp:nobody@192.168.1.100:/muse/hardware"
;;             "my-xhtml")
;;          ,@(muse-project-alist-styles
;;             "~/emacs/muse/source/hardware"
;;             "~/emacs/muse/pdf/hardware"
;;             "my-pdfcjk"))
;;         ))

;; ;; Wiki settings
;; ;; (setq muse-wiki-interwiki-alist
;; ;;       '(("PlugWiki" . "http://wiki.purduelug.org/")
;; ;;         ("EmacsWiki" . "http://www.emacswiki.org/cgi-bin/wiki/")
;; ;;         ("ArchWiki" . "http://gnuarch.org/gnuarchwiki/")
;; ;;         ;; abbreviations
;; ;;         ("CERIAS" . "http://www.cerias.purdue.edu/")
;; ;;         ("PlannerMode" . "http://www.emacswiki.org/cgi-bin/wiki/PlannerMode")
;; ;;         ("RememberMode" . "http://www.emacswiki.org/cgi-bin/wiki/RememberMode")
;; ;;         ("GP2X" . "http://www.gp2x.co.uk/")
;; ;;         ("UbuntuLinux" . "http://ubuntulinux.org/")
;; ;;         ("PLUG" . "http://purduelug.org/")
;; ;;         ("PAC" . "http://web.ics.purdue.edu/~pac/")))

;; ;;; Functions

;; ;; relative path handle function

;; ;; (defvar ywb-muse-publish-directory "~/emacs/muse/source")
;; ;; (defun ywb-muse-relative-path (file)
;; ;;   "use <lisp>(ywb-muse-relative-path \"path/to/file\"</lisp> in
;; ;; header or footer, will resolve the relative path from
;; ;; `ywb-muse-publish-directory' to output path. For example, if your
;; ;; page output path is \"~/emacs/muse/publish_html/project1\", and you
;; ;; want a file \"~/emacs/muse/publish_html/images/foo.png\", just write a
;; ;; relative path to `ywb-muse-publish-directory', that is
;; ;; <lisp>(ywb-muse-relative-path \"images/foo.png\"</lisp>, then the
;; ;; function will convert this relative path to \"../images/foo.png\"
;; ;; which is relative path to output path. In summary, just give the
;; ;; relative path to `ywb-muse-publish-directory' to the function,
;; ;; this function will resolve the link to the right path"
;; ;;   (concat
;; ;;    (file-relative-name
;; ;;     ywb-muse-publish-directory
;; ;;     (file-name-directory muse-publishing-current-output-path))
;; ;;    file))

;; ;; Turn relative links into absolute ones
;; (defun my-muse-pdf-make-links-absolute (str &rest ignored)
;;   "Make relative links absolute."
;;   (when str
;;     (save-match-data
;;       (if (string-match "\\`[/.]+" str)
;;           (replace-match "file://home/xin/.emacs.d/wrok/muse/pdf" nil t str)
;;         str))))

;; ;; Make sure my interproject links become absolute when published in
;; ;; PDFs
;; (defun my-muse-pdf-prepare-buffer ()
;;   (set (make-local-variable 'muse-publish-url-transforms)
;;        (cons 'my-muse-pdf-make-links-absolute muse-publish-url-transforms)))

;; ;; Switch to the given project and prompt for a file
;; (defun my-muse-project-find-file (project)
;;   (interactive)
;;   (let ((muse-current-project (muse-project project)))
;;     (call-interactively 'muse-project-find-file)))

;; ;;(defun my-muse-blosxom-finalize (file output-path target)
;; ;;  (my-muse-prepare-entry-for-xanga output-path)
;; ;; For now, do nothing.
;; ;;  )

;; ;; Determine whether we are publishing a certain kind of output
;; ;; (defun my-muse-format-p (format)
;; ;;   (let ((base (muse-get-keyword :base muse-publishing-current-style)))
;; ;;     (when base (string-match format base))))

;; ;; Make the current file display correctly in Xanga
;; ;; I call this using C-c p x now.
;; ;; (defun my-muse-prepare-entry-for-xanga (file)
;; ;;   "Mangle FILE so that Xanga doesn't bug out, saving to X clipboard.

;; ;; Turn a word or phrase into a clickable Wikipedia link
;; (defun my-muse-dictize (beg end)
;;   (interactive "r")
;;   (let* ((text (buffer-substring-no-properties beg end))
;;          (link (concat "dict:" (replace-regexp-in-string " " "_" text t t))))
;;     (delete-region beg end)
;;     (insert "[[" link "][" text "]]")))

;; (defun my-muse-surround-math (&optional beg end)
;;   "If a region is higlighted, surround it with <math>...</math>.
;; If no region is highlighted, insert <math></math> and leave the point
;; between the two tags."
;;   (interactive (list (ignore-errors (mark)) (point)))
;;   (if (and beg end)
;;       (save-restriction
;;         (narrow-to-region beg end)
;;         (goto-char (point-min))
;;         (insert "<math>")
;;         (goto-char (point-max))
;;         (insert "</math>"))
;;     (insert "<math>")
;;     (save-excursion (insert "</math>"))))

;; (defun my-muse-cdotize-region (beg end)
;;   (interactive "r")
;;   (save-restriction
;;     (narrow-to-region beg end)
;;     (goto-char (point-min))
;;     (while (re-search-forward " *\\* *" nil t)
;;       (replace-match " \\\\cdot "))))

;; ;;; Key customizations
;; ;; (global-set-key "\C-cpc" #'my-muse-cdotize-region)
;; ;; (global-set-key "\C-cpm" #'my-muse-surround-math)
;; ;; (global-set-key "\C-cpw" #'my-muse-dictize)
;; ;; (global-set-key "\C-cpi" #'(lambda () (interactive)
;; ;;                              (my-muse-project-find-file "ideas")))
;; ;; (global-set-key "\C-cpr" #'(lambda () (interactive)
;; ;;                              (my-muse-project-find-file "readings")))
;; ;; (global-set-key "\C-cc" #'(lambda () (interactive)
;; ;;                              (my-muse-project-find-file "research")))
;; ;; (global-set-key "\C-cps" #'(lambda () (interactive)
;; ;;                              (my-muse-project-find-file "software")))
;; ;; (global-set-key "\C-cph" #'(lambda () (interactive)
;; ;;                              (my-muse-project-find-file "hardware")))

;; ;; from self-customization
;; ;;  '(muse-colors-autogen-headings (quote outline))
;; ;;  '(muse-colors-inline-image-method (quote muse-colors-use-publishing-directory))
;; ;;  '(muse-html-charset-default "utf-8")
;; ;;  '(muse-html-encoding-default (quote utf-8))
;; ;;  '(muse-html-footer "~/emacs/muse/addon/templates/generic-footer.html")
;; ;;  '(muse-html-header "~/emacs/muse/addon/templates/generic-gheader.html")
;; ;;  '(muse-html-meta-content-encoding (quote utf-8))
;; ;;  '(muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"http://192.168.1.100/muse/stylesheets/mystyle.css\" />
;; ;; <link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"screen\" href=\"http://192.168.1.100/muse/stylesheets/screen.css\" />
;; ;; <link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"print\" href=\"http://192.168.1.100/muse/stylesheets/print.css\" />")
;; ;;  '(muse-latex-pdf-browser "envince %s")
;; ;;  '(muse-latexcjk-encoding-default "{UTF8}{song}")
;; ;;  '(muse-mode-hook (quote (footnote-mode outline-minor-mode)))
;; ;;  '(muse-publish-desc-transforms (quote (muse-wiki-publish-pretty-title muse-wiki-publish-pretty-interwiki)))
;; ;;  '(muse-publish-enable-local-variables t)
;; ;;  '(muse-wiki-publish-small-title-words (quote ("the" "and" "at" "on" "of" "for" "in" "an" "a" "page")))
;; ;;  '(muse-xhtml-footer "~/emacs/muse/addon/templates/generic-footer.html")
;; ;;  '(muse-xhtml-header "~/emacs/muse/addon/templates/generic-header.html")
;; ;;  '(muse-xhtml-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"all\" href=\"http://192.168.1.100/muse/stylesheets/mystyle.css\" />
;; ;; <link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"screen\" href=\"http://192.168.1.100/muse/stylesheets/screen.css\" />
;; ;; <link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"print\" href=\"http://192.168.1.100/muse/stylesheets/print.css\" />")

;; ;; faces:
;; ;; '(muse-bad-link-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))))
;; ;; '(muse-link-face ((t (:foreground "blue" :underline "blue" :weight bold))))

;; (provide 'xy-rc-muse)
