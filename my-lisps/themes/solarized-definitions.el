(eval-when-compile
  (require 'cl))

(defconst solarized-description
  "Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized.")

(defcustom solarized-degrade nil
  "For test purposes only; when in GUI mode, forces Solarized to use the 256
degraded color mode to test the approximate color values for accuracy."
  :type 'boolean
  :group 'solarized)

(defcustom solarized-bold t
  "Stops Solarized from displaying bold when nil."
  :type 'boolean
  :group 'solarized)

(defcustom solarized-underline t
  "Stops Solarized from displaying underlines when nil."
  :type 'boolean
  :group 'solarized)

(defcustom solarized-italic t
  "Stops Solarized from displaying italics when nil."
  :type 'boolean
  :group 'solarized)

(defcustom solarized-termcolors 16
  "This setting applies to emacs in terminal (non-GUI) mode.
If set to 16, emacs will use the terminal emulator's colorscheme (best option as
long as you've set your emulator's colors to the Solarized palette). If set to
256 and your terminal is capable of displaying 256 colors, emacs will use the
256 degraded color mode."
  :type 'integer
  :options '(16 256)
  :group 'solarized)

(defcustom solarized-contrast 'normal
  "Stick with normal! It's been carefully tested. Setting this option to high or
low does use the same Solarized palette but simply shifts some values up or down
in order to expand or compress the tonal range displayed."
  :type 'symbol
  :options '(high normal low)
  :group 'solarized)

;; FIXME: The Generic RGB colors will actually vary from device to device, but
;;        hopefully these are closer to the intended colors than the sRGB values
;;        that Emacs seems to dislike
(defvar solarized-colors
  ;; name    sRGB      Gen RGB   degraded  ANSI(Solarized terminal)
  '((base03  "#002b36" "#042028" "#1c1c1c" "#7f7f7f")
    (base02  "#073642" "#0a2832" "#262626" "#000000")
    (base01  "#586e75" "#465a61" "#4e4e4e" "#00ff00")
    (base00  "#657b83" "#52676f" "#585858" "#ffff00")
    (base0   "#839496" "#708183" "#808080" "#5c5cff")
    (base1   "#93a1a1" "#81908f" "#8a8a8a" "#00ffff")
    (base2   "#eee8d5" "#e9e2cb" "#d7d7af" "#e5e5e5")
    (base3   "#fdf6e3" "#fcf4dc" "#ffffd7" "#ffffff")
    (yellow  "#b58900" "#a57705" "#af8700" "#cdcd00")
    (orange  "#cb4b16" "#bd3612" "#d75f00" "#ff0000")
    (red     "#dc322f" "#c60007" "#af0000" "#cd0000")
    (magenta "#d33682" "#c61b6e" "#af005f" "#cd00cd")
    (violet  "#6c71c4" "#5859b7" "#5f5faf" "#ff00ff")
    (blue    "#268bd2" "#2075c7" "#0087ff" "#0000ee")
    (cyan    "#2aa198" "#259185" "#00afaf" "#00cdcd")
    (green   "#859900" "#728a05" "#5f8700" "#00cd00"))
  "This is a table of all the colors used by the Solarized color theme. Each
   column is a different set, one of which will be chosen based on term
   capabilities, etc.")

(defun solarized-color-definitions (mode)
  (flet ((find-color (name)
           (let ((index (if window-system
                            (if solarized-degrade
                                3
                  2)
              (if (= solarized-termcolors 256)
                  3
                4))))
             (nth index (assoc name solarized-colors)))))
    (let ((base03    (find-color 'base03))
          (base02    (find-color 'base02))
          (base01    (find-color 'base01))
          (base00    (find-color 'base00))
          (base0     (find-color 'base0))
          (base1     (find-color 'base1))
          (base2     (find-color 'base2))
          (base3     (find-color 'base3))
          (yellow    (find-color 'yellow))
          (orange    (find-color 'orange))
          (red       (find-color 'red))
          (magenta   (find-color 'magenta))
          (violet    (find-color 'violet))
          (blue      (find-color 'blue))
          (cyan      (find-color 'cyan))
          (green     (find-color 'green))
          (bold      (if solarized-bold 'bold 'normal))
          (underline (if solarized-underline t nil))
          (opt-under nil)
          (italic    (if solarized-italic 'italic 'normal)))
      (when (eq 'light mode)
        (rotatef base03 base3)
        (rotatef base02 base2)
        (rotatef base01 base1)
        (rotatef base00 base0))
      (let ((back base03))
        (cond ((eq 'high solarized-contrast)
               (let ((orig-base3 base3))
                 (rotatef base01 base00 base0 base1 base2 base3)
                 (setf base3 orig-base3)))
              ((eq 'low solarized-contrast)
               (setf back      base02
                     opt-under t)))
        `((;; basic
           (default ((t (:foreground ,base0 ,:background ,back))))
           (cursor
            ((t (:foreground ,base0 :background ,base03 :inverse-video t))))
           ;; (cursor ;; HACK:
           ;;  ((t (:foreground ,base0 :background ,blue :inverse-video t))))
           (escape-glyph-face ((t (:foreground ,red))))
           (fringe ((t (:foreground ,base01 :background ,base02))))
           ;; (linum ((t (:foreground ,base01 :background ,base02 :height 0.7))))
           (linum ((t (:foreground ,base01 :height 0.7))))
           (header-line ((t (:foreground ,base0 :background ,base2))))
           (highlight ((t (:background ,base02))))
           ;; (hl-line ((t (:background ,base02))))
           (hl-line ((t (:background ,base2)))) ;; HACK:
           (isearch ((t (:foreground ,yellow :inverse-video t))))
           (isearch-fail  ((t (:background ,red)))) ;; HACK:
           (lazy-highlight ((t (:background ,base2 :foreground ,base00))))
           (link ((t (:foreground ,violet :underline ,underline))))
           (link-visited ((t (:foreground ,magenta :underline ,underline))))
           (menu ((t (:foreground ,base0 :background ,base02))))
           (minibuffer-prompt ((t (:foreground ,blue))))
           (mode-line
            ((t (:foreground ,base1 :background ,base02 :height 0.8
                             :box (:line-width 1 :color ,base1)))))
           (mode-line-buffer-id ((t (:foreground ,base1))))
           (mode-line-inactive
            ((t (:foreground ,base0  :background ,base02
                             :box (:line-width 1 :color ,base02)))))
           ;; (region ((t (:background ,base02))))
           (region ((t (:background ,base2)))) ;; HACK:
           (secondary-selection ((t (:background ,base02))))
           (trailing-whitespace ((t (:foreground ,red :inverse-video t))))
           (vertical-border ((t (:foreground ,base0))))
           ;; comint
           (comint-highlight-prompt ((t (:foreground ,blue))))
           ;; compilation
           (compilation-info ((t (:foreground ,green :weight ,bold))))
           (compilation-warning ((t (:foreground ,orange :weight ,bold))))
           ;; customize
           (custom-button
            ((t (:background ,base02
                             :box (:line-width 2 :style released-button)))))
           (custom-button-mouse
            ((t (:inherit custom-button :foreground ,base1))))
           (custom-button-pressed
            ((t (:inherit custom-button-mouse
                          :box (:line-width 2 :style pressed-button)))))
           (custom-comment-tag ((t (:background ,base02))))
           (custom-comment-tag ((t (:background ,base02))))
           (custom-documentation ((t (:inherit default))))
           (custom-group-tag ((t (:foreground ,orange :weight ,bold))))
           (custom-link ((t (:foreground ,violet))))
           (custom-state ((t (:foreground ,green))))
           (custom-variable-tag ((t (:foreground ,orange :weight ,bold))))
           ;; diff
           (diff-added ((t (:foreground ,green :inverse-video t))))
           (diff-changed ((t (:foreground ,yellow :inverse-video t))))
           (diff-removed ((t (:foreground ,red :inverse-video t))))
           (diff-header ((t (:background ,base01))))
           (diff-file-header
            ((t (:background ,base1 :foreground ,base01 :weight ,bold))))
           (diff-refine-change ((t (:background ,base1))))
           ;; ;; HACK: diff-mode
           ;; ;; (diff-added-face ((t (:foreground "Green"))))
           ;; ;; (diff-changed-face ((t (:foreground "Khaki"))))
           ;; (diff-context-face ((t (:foreground ,base01))))
           ;; ;; (diff-file-header ((t (:bold t :background "grey20"  :foreground "ivory1" :weight bold))))
           ;; ;; (diff-file-header-face ((t (:bold t :background "grey20" :foreground "ivory1" :weight bold))))
           ;; (diff-function-face ((t (:foreground ,blue))))
           ;; ;; (diff-header-face ((t (:background "SlateBlue4"))))
           ;; (diff-hunk-header-face ((t (:background ,green))))
           ;; (diff-index-face ((t (:weight bold :background ,violet :foregounr ,magenta))))
           ;; (diff-index-face ((t (:weight bold :background ,violet :foregounr ,magenta))))
           ;; (diff-nonexistent-face ((t (:weight bold :background "Black" :foreground "Wheat1"))))
           ;; (diff-removed-face ((t (:foreground ,orange))))
           ;; IDO
           (ido-only-match ((t (:foreground ,green))))
           (ido-subdir ((t (:foreground ,blue))))
           (ido-first-match ((t (:foreground ,green :weight ,bold))))
           ;; emacs-wiki
           (emacs-wiki-bad-link-face
            ((t (:foreground ,red :underline ,underline))))
           (emacs-wiki-link-face
            ((t (:foreground ,blue :underline ,underline))))
           (emacs-wiki-verbatim-face
            ((t (:foreground ,base00 :underline ,underline))))
           ;; font-lock
           (font-lock-builtin-face ((t (:foreground ,green))))
           (font-lock-comment-face ((t (:foreground ,base01 :slant ,italic))))
           (font-lock-constant-face ((t (:foreground ,cyan))))
           (font-lock-function-name-face ((t (:foreground ,blue))))
           (font-lock-keyword-face ((t (:foreground ,green))))
           (font-lock-string-face ((t (:foreground ,cyan))))
           (font-lock-type-face ((t (:foreground ,yellow))))
           (font-lock-variable-name-face ((t (:foreground ,blue))))
           (font-lock-warning-face ((t (:foreground ,red :weight ,bold))))
           (font-lock-doc-face ((t (:foreground ,cyan :slant ,italic))))
           (font-lock-color-constant-face ((t (:foreground ,green))))
           (font-lock-comment-delimiter-face
            ((t (:foreground ,base01 :weight ,bold))))
           ;; (font-lock-comment-delimiter-face ((t (:foreground
           ;; ,orange :weight ,bold)))) ;; HACK: This is too colorful?
           (font-lock-doc-string-face ((t (:foreground ,green))))
           (font-lock-preprocessor-face ((t (:foreground ,orange))))
           (font-lock-reference-face ((t (:foreground ,cyan))))
           (font-lock-negation-char-face ((t (:foreground ,red))))
           (font-lock-other-type-face ((t (:foreground ,blue :slant ,italic))))
           (font-lock-regexp-grouping-construct    ((t (:foreground ,orange))))
           (font-lock-special-keyword-face ((t (:foreground ,magenta))))
           (font-lock-exit-face ((t (:foreground ,red))))
           (font-lock-other-emphasized-face
            ((t (:foreground ,violet :weight ,bold :slant ,italic))))
           (font-lock-regexp-grouping-backslash ((t (:foreground ,yellow))))
           ;; info
           (info-xref ((t (:foreground ,blue :underline ,underline))))
           (info-xref-visited ((t (:inherit info-xref :foreground ,magenta))))
           ;; org
           (org-hide ((t (:foreground ,base03))))
           ;; (org-todo ((t (:foreground ,base03 :background ,red :weight ,bold))))
           (org-todo ((t (:foreground ,red :weight ,bold))))
           ;; (org-done ((t (:foreground ,green :weight ,bold))))
           (org-done ((t (:foreground ,cyan :weight ,bold))))
           ;; (org-todo-kwd-face ((t (:foreground ,red :background ,base03))))
           ;; (org-done-kwd-face ((t (:foreground ,green :background ,base03))))
           ;; (org-project-kwd-face
           ;;  ((t (:foreground ,violet :background ,base03))))
           ;; (org-waiting-kwd-face
           ;;  ((t (:foreground ,orange :background ,base03))))
           ;; (org-someday-kwd-face ((t (:foreground ,blue :background ,base03))))
           ;; (org-started-kwd-face
           ;;  ((t (:foreground ,yellow :background ,base03))))
           ;; (org-cancelled-kwd-face
           ;;  ((t (:foreground ,green :background ,base03))))
           ;; (org-delegated-kwd-face
           ;;  ((t (:foreground ,cyan :background ,base03))))
           ;;---------------------------------------------------------
           ;; HACK: my org
           ;; (org-agenda-clocking ((t (:background ,violet))))
           ;; (org-agenda-column-dateline ((t (:background ,base00 ))))
           ;; (org-agenda-current-time ((t (:background ,base3 :foreground ,blue :weight ,bold))))
           ;; (org-agenda-date ((t (:foreground ,blue))))
           ;; (org-agenda-date-today ((t (:foreground ,blue :slant ,italic :weight, bold))))
           ;; (org-agenda-date-weekend ((t (:foreground ,red :weight ,bold))))
           ;; (org-agenda-diary ((t (:foundry unknown :foreground ,blue))))
           ;; (org-agenda-dimmed-todo-face ((t (:foreground ,base01))))
           ;; ;; (org-agenda-todo ((t (:foreground ,base03 :background ,red :weight ,bold))))
           ;; ;; (org-agenda-done ((t (:foreground ,green :weight ,bold))))
           ;; (org-agenda-restriction-lock ((t (:background ,magenta))))
           ;; (org-agenda-structure ((t (:foreground ,magenta))))
           ;; (org-archived ((t (:foreground ,base01))))
           ;; (org-block ((t (:foreground ,base0))))
           ;; (org-checkbox ((t (:weight ,bold :foreground ,red :foundry unknown))))
           ;; (org-checkbox-statistics-done ((t (:weight ,bold :slant oblique :foreground ,green))))
           ;; (org-checkbox-statistics-todo ((t (:weight ,bold :foreground ,red))))
           ;; (org-clock-overlay ((t (:background ,blue))))
           ;; (org-code ((t (:foreground ,base00))))
           (org-column ((t (:background ,base02))))
           (org-column-title ((t (:background ,base2 :underline t :weight ,bold))))
           ;; (org-date ((t (:foreground ,cyan :underline t))))

           ;; (org-document-info ((t (:foreground ,base0))))
           ;; (org-document-info-keyword ((t (:foreground ,red))))
           ;; (org-document-title ((t (:bold t :foreground "pale turquoise" :weight bold :height 1.75))))
           ;; (org-drawer ((t (:foreground "LightSkyBlue"))))
           ;; (org-ellipsis ((t (:foreground "LightGoldenrod" :underline t))))
           ;; (org-footnote ((t (:foreground "Cyan" :underline t))))
           ;; (org-formula ((t (:foreground "chocolate1"))))
           ;; (org-headline-done ((t (:foreground "LightSalmon"))))
           ;; (org-hide ((t (:foreground "black"))))
           ;; (org-latex-and-export-specials ((t (:foreground "burlywood"))))

           ;; (org-level-1 ((t (:foreground ,magenta :weight ,bold))))
           ;; (org-level-2 ((t (:weight ,bold :foreground ,violet))))
           ;; (org-level-3 ((t (:slant ,italic :foreground ,yellow))))
           ;; (org-level-4 ((t (:slant ,italic :foreground ,orange))))
           ;; (org-level-5 ((t (:slant ,italic :foreground ,cyan))))
           ;; (org-level-6 ((t (:slant ,italic :foreground ,green))))
           ;; (org-level-7 ((t (:slant ,italic :foreground ,blue))))
           ;; (org-level-8 ((t (:slant ,italic :foreground ,red))))
           ;; (org-link ((t (:foreground ,blue :underline t))))
           ;; (org-meta-line ((t (:foreground ,cyan :foundry unknown :slant ,italic))))
           ;; (org-mode-line-clock ((t (:box (:line-width -1 :color nil :style released-button) :foreground ,blue :background ,base2))))
           ;; (org-mode-line-clock-overrun ((t (:box (:line-width -1 :color nil :style released-button) :foreground ,blue :background ,red))))
           ;; (org-quote ((t (:foreground ,base01))))
           ;; (org-scheduled ((t (:foreground ,green))))
           ;; (org-scheduled-previously ((t (:foreground ,base00))))
           ;; (org-scheduled-today ((t (:foreground ,green))))
           ;; (org-sexp-date ((t (:foreground ,cyan))))
           ;; (org-special-keyword ((t (:foreground ,orange))))
           ;; (org-table ((t (:foreground ,violet))))
           ;; (org-tag ((t (:weight bold))))
           ;; (org-target ((t (:underline t))))
           ;; (org-time-grid ((t (:foreground ,orange))))
           ;;---------------------------------------------------------
           ;; show-paren
           (show-paren-match-face ((t (:background ,cyan :foreground ,base3))))
           (show-paren-mismatch-face
            ((t (:background ,red :foreground ,base3))))
           ;; widgets
           (widget-field
            ((t (:box (:line-width 1 :color ,base00) :inherit default))))
           (widget-single-line-field ((t (:inherit widget-field))))
           ;; extra modules
           ;; --------------------------------------------------------
           ;; HACK: before gnus, add more modules
           (which-func ((t (:foreground ,blue))))
           ;; (cscope-file-face ((t (:foreground ,magenta))))
           ;; (cscope-function-face ((t (:foreground ,blue))))
           ;; (cscope-line-face ((t (:foreground ,green))))
           ;; (cscope-line-number-face ((t (:foreground ,base01 :background ,base02))))
           ;; (cscope-mouse-face ((t (:background ,green :foreground ,base3))))
           (browse-kill-ring-separator-face ((t (:foreground ,orange :weight ,bold))))
           (bbdb-company ((t (:italic t :slant italic))))
           (bbdb-field-name ((t (:bold t :weight bold))))
           (bbdb-field-value ((t (nil))))
           (bbdb-name ((t (:underline t))))
           (apropos-keybinding-face  ((t (:underline t))))
           (apropos-label-face  ((t (:italic t))))
           (apropos-match-face ((t (:background ,blue))))
           (apropos-property-face ((t (:bold t :italic t :slant italic :weight bold))))
           (apropos-symbol-face ((t (:bold t :weight bold))))
           ;;----------------------------------------------------------------
           ;; HACK: more definistions
           ;; dired+
           (diredp-compressed-file-suffix ((t (:foreground ,blue))))
           (diredp-date-time ((t (:foreground ,cyan))))
           (diredp-deletion ((t (:background ,red :foreground ,yellow))))
           (diredp-deletion-file-name ((t (:foreground ,red))))
           (diredp-dir-heading ((t (:background ,base02 :foreground ,cyan))))
           (diredp-dir-priv ((t (:background ,base02 :foreground ,cyan))))
           (diredp-display-msg ((t (:foreground ,yellow))))
           (diredp-exec-priv ((t (:background ,magenta))))
           (diredp-executable-tag ((t (:foreground ,red))))
           (diredp-file-name ((t (:foreground ,base0))))
           (diredp-file-suffix ((t (:foreground ,green))))
           (diredp-flag-mark ((t (:background ,violet :foreground ,red))))
           (diredp-flag-mark-line ((t (:background ,base01))))
           (diredp-ignored-file-name ((t (:foreground ,base01))))
           (diredp-link-priv ((t (:foreground ,violet))))
           (diredp-no-priv ((t (:background ,base02))))
           (diredp-number ((t (:foreground ,base0))))
           (diredp-other-priv ((t (:background ,blue))))
           (diredp-rare-priv ((t (:background ,magenta :foreground ,green))))
           (diredp-read-priv ((t (:background ,base01))))
           (diredp-symlink ((t (:foreground ,violet))))
           (diredp-write-priv ((t (:background ,green))))
           ;;------------------------------------------------------------------
           ;; gnus
           (gnus-cite-1 ((t (:foreground ,magenta))))
           (gnus-cite-2 ((t (:foreground ,base2))))
           (gnus-cite-3 ((t (:foreground ,base3))))
           (gnus-cite-4 ((t (:foreground ,base1))))
           (gnus-cite-5 ((t (:foreground ,magenta))))
           (gnus-cite-6 ((t (:foreground ,base2))))
           (gnus-cite-7 ((t (:foreground ,base3))))
           (gnus-cite-8 ((t (:foreground ,base1))))
           (gnus-cite-9 ((t (:foreground ,base2))))
           (gnus-cite-10 ((t (:foreground ,base3))))
           (gnus-cite-11 ((t (:foreground ,blue))))
           (gnus-group-mail-1 ((t (:foreground ,base3 :weight ,bold))))
           (gnus-group-mail-1-empty ((t (:foreground ,base3))))
           (gnus-group-mail-2 ((t (:foreground ,base2 :weight ,bold))))
           (gnus-group-mail-2-empty ((t (:foreground ,base2))))
           (gnus-group-mail-3 ((t (:foreground ,magenta :weight ,bold))))
           (gnus-group-mail-3-empty ((t (:foreground ,magenta))))
           (gnus-group-mail-low ((t (:foreground ,base00 :weight ,bold))))
           (gnus-group-mail-low-empty ((t (:foreground ,base00))))
           (gnus-group-news-1 ((t (:foreground ,base1 :weight ,bold))))
           (gnus-group-news-1-empty ((t (:foreground ,base1))))
           (gnus-group-news-2 ((t (:foreground ,blue :weight ,bold))))
           (gnus-group-news-2-empty ((t (:foreground ,blue))))
           (gnus-group-news-low ((t (:foreground ,violet :weight ,bold))))
           (gnus-group-news-low-empty ((t (:foreground ,violet))))
           (gnus-header-content ((t (:foreground ,cyan :slant ,italic))))
           (gnus-header-from ((t (:foreground ,base2))))
           (gnus-header-name ((t (:foreground ,blue))))
           (gnus-header-newsgroups ((t (:foreground ,green :slant ,italic))))
           (gnus-header-subject ((t (:foreground ,base1))))
           (gnus-server-agent ((t (:foreground ,base3 :weight ,bold))))
           (gnus-server-closed ((t (:foreground ,base1 :slant ,italic))))
           (gnus-server-denied ((t (:foreground ,base2 :weight ,bold))))
           (gnus-server-offline ((t (:foreground ,green :weight ,bold))))
           (gnus-server-opened ((t (:foreground ,cyan :weight ,bold))))
           (gnus-splash ((t (:foreground ,base2))))
           (gnus-summary-high-ancient
            ((t (:foreground ,magenta :weight ,bold))))
           (gnus-summary-high-read ((t (:foreground ,base1 :weight ,bold))))
           (gnus-summary-high-ticked ((t (:foreground ,base3 :weight ,bold))))
           (gnus-summary-high-undownloaded
            ((t (:foreground ,base2 :weight ,bold))))
           (gnus-summary-low-ancient
            ((t (:foreground ,magenta :slant ,italic))))
           (gnus-summary-low-read ((t (:foreground ,base1 :slant ,italic))))
           (gnus-summary-low-ticked ((t (:foreground ,base3 :slant ,italic))))
           (gnus-summary-low-undownloaded
            ((t (:foreground ,base2 :slant ,italic))))
           (gnus-summary-normal-ancient ((t (:foreground ,magenta))))
           (gnus-summary-normal-read ((t (:foreground ,base1))))
           (gnus-summary-normal-ticked ((t (:foreground ,base3))))
           (gnus-summary-normal-undownloaded ((t (:foreground ,base2))))
           ;; Flymake
           (flymake-errline ((t (:background ,orange))))
           (flymake-warnline ((t (:background ,violet))))
           ;; whitespace
           (whitespace-empty ((t (:foreground ,red))))
           (whitespace-hspace ((t (:foreground ,orange))))
           (whitespace-indentation ((t (:foreground ,base02))))
           (whitespace-space ((t (:foreground ,base02))))
           (whitespace-space-after-tab ((t (:foreground ,cyan))))
           (whitespace-space-before-tab ((t (:foreground ,red :weight ,bold))))
           (whitespace-tab ((t (:foreground ,base02))))
           (whitespace-trailing
            ((t (:background ,base02 :foreground ,red :weight ,bold))))
           (whitespace-highlight-face
            ((t (:background ,blue :foreground ,red))))
           ;; Message
           (message-mml ((t (:foreground ,blue))))
           (message-cited-text ((t (:foreground ,base2))))
           (message-separator ((t (:foreground ,base3))))
           (message-header-xheader ((t (:foreground ,violet))))
           (message-header-name ((t (:foreground ,cyan))))
           (message-header-other ((t (:foreground ,red))))
           (message-header-newsgroups
            ((t (:foreground ,yellow :weight ,bold :slant ,italic))))
           (message-header-subject ((t (:foreground ,base00))))
           (message-header-cc ((t (:foreground ,green :weight ,bold))))
           (message-header-to ((t (:foreground ,base1 :weight ,bold)))))
          ((foreground-color . ,base0)
           (background-color . ,base03)
           (background-mode . ,mode)
           ;; (cursor-color . ,base0) ;; HACK:
           (cursor-color . ,blue)
           ))))))

(defmacro create-solarized-theme (mode)
  (let* ((theme-name (intern (concat "solarized-" (symbol-name mode))))
         (defs (solarized-color-definitions mode))
         (theme-vars (mapcar (lambda (def) (list (car def) (cdr def)))
                             (second defs)))
         (theme-faces (first defs)))
    `(progn
       (deftheme ,theme-name ,solarized-description)
       (apply 'custom-theme-set-variables ',theme-name ',theme-vars)
       (apply 'custom-theme-set-faces ',theme-name ',theme-faces)
       (provide-theme ',theme-name))))

(provide 'solarized-definitions)
