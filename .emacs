(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

 ;; cl - Common Lisp Extension
 (require 'cl)
;; Add Packages
 (defvar my/packages '(
                ;; --- Auto-completion ---
                company
                ;; --- Better Editor ---
                selected

                htmlize
                ;;hungry-delete

                swiper
                counsel
                smartparens
                popwin
                ;; --- Major Mode ---
                auctex
                company-math
                company-auctex
                latex-preview-pane
                latex-extra
                yasnippet
                markdown-mode
                ;; --- Minor Mode ---
                ;;nodejs-repl
                ;;exec-path-from-shell
                ;; --- Themes ---
                ;;monokai-theme
                exotica-theme
                ;; solarized-theme
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))




(setq user-full-name "Liangzu Peng")
(setq user-mail-address "penglz@shanghaitech.edu.com")
;; general user interface and appearance
(tool-bar-mode -1)                ; No toolbar
;;(menu-bar-mode -1)              ; No menubar
(scroll-bar-mode -1)              ; No scrollbar
;; (set-scroll-bar-mode 'right)    ; Scrollbar on the right
(tooltip-mode -1)
(setq inhibit-startup-message t)  ; No message at startup
(setq inhibit-splash-screen t)
(setq visible-bell t)             ; No beep when reporting errors
(setq ring-bell-function 'ignore)
(global-font-lock-mode 1)         ; Color enabled
(global-linum-mode)
(setq-default show-trailing-whitespace t)


;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; cursor and mouse
(blink-cursor-mode 0)                    ; No blinking cursor
(setq-default cursor-type 'bar)
(setq track-eol nil)                     ; Cursor don't track end-of-line
(setq mouse-yank-at-point t)             ; Paste at cursor position
;;(setq scroll-preserve-screen-position t) ; Scroll without moving cursor
(mouse-avoidance-mode 'jump)             ; Mouse avoids cursor
;;(set-cursor-color "black")               ; Cursor color
(column-number-mode t)                   ; Show column number in mode-line
(mouse-wheel-mode t)                     ; Mouse-wheel enabled
(setq select-enable-clipboard t)

;; buffers and windows
(setq pop-up-frame t)                          ; Buffers in separate frames
(setq frame-title-format "%b - Emacs")         ; Use buffer name as frame title
(setq window-min-height 10)                    ; Minimal height of windows
(setq enable-recursive-minibuffers t)          ; Stack  minibuffers
(icomplete-mode t)                             ; Completion in mini-buffer
(setq read-buffer-completion-ignore-case 't)   ; Ignore case when completing buffer names
(setq-default case-fold-search t)              ; Search is case sensitive



;; useful minor modes
(mapc (lambda (mode) (funcall mode 1))
      '(auto-compression-mode
        column-number-mode
        global-auto-revert-mode ;;  reverts any buffer associated with a file when the file changes on disk
        ido-mode
        line-number-mode
        show-paren-mode
        transient-mark-mode
        which-function-mode))

(global-auto-revert-mode 1)
;; smooth scrolling
(setq smooth-scroll-mode t)
(setq scroll-step 1
      scroll-conservatively 10000)


(put 'narrow-to-region  'disabled nil)         ; Allow narrow-to-region command
(setq disabled-command-hook nil)               ; Allow all disabled commands
(setq undo-limit 100000)                       ; Increase number of undo
(defalias 'qrr 'query-replace-regexp)          ; Define an alias
(setq default-major-mode 'text-mode)           ; Text-mode is default mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)  ; auto-formatting in text-mode
(defalias 'yes-or-no-p 'y-or-n-p)              ; y/n instead of yes/no

;;(setq show-paren-style 'expression)            ; Highlight text between parens
;;(mouse-avoidance-mode 'animate)
(setq fill-column 80)
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq debug-on-error t
      global-hl-line-mode t
      gc-cons-threshold 100000000
      load-prefer-newer t
      time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S"
      initial-scratch-message (format ";; Happy hacking - Started on %s\n\n" (current-time-string))
      kill-whole-line t
      require-final-newline t  ;; add a newline automatically at the end of the file.
      next-line-add-newlines t
      backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil

      vc-follow-symlinks t
      password-cache-expiry nil
      highlight-tabs t
      show-trailing-whitespace t
      whitespace-line-column 80
      whitespace-style '(tabs tab-mark face lines-tail)
      whitespace-global-modes '(not org-mode web-mode)
      uniquify-buffer-name-style 'forward uniquify-separator "/")




;; Locale
(setq locale-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)



;; Indentation
(setq-default indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4
              c-hanging-comment-ender-p nil)

;; Look'n'feel
(blink-cursor-mode 0)              ; No blinking cursor


;;(speedbar t)

(selected-minor-mode)
(define-key selected-keymap (kbd "q") #'selected-off)
(define-key selected-keymap (kbd "c") #'comment-region)
(define-key selected-keymap (kbd "x") #'uncomment-region)
(define-key selected-keymap (kbd "u") #'upcase-region)
(define-key selected-keymap (kbd "d") #'downcase-region)
(define-key selected-keymap (kbd "w") #'count-words-region)
(define-key selected-keymap (kbd "m") #'apply-macro-to-region-lines)

;; key bindings
(global-set-key (kbd "C-c <C-left>")  'windmove-left)
(global-set-key (kbd "C-c <C-right>") 'windmove-right)
(global-set-key (kbd "C-c <C-up>")    'windmove-up)
(global-set-key (kbd "C-c <C-down>")  'windmove-down)

(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c C-q") 'mark-whole-buffer)

(global-set-key (kbd "C-x k") 'kill-this-buffer)


(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


(global-set-key (kbd "C-x 2")
                (lambda ()
                  (interactive)(split-window-vertically)
                  (other-window 1)))

(global-set-key (kbd "C-x 3")
                (lambda ()
                  (interactive)(split-window-horizontally)
                  (other-window 1)))

(when (display-graphic-p)
  (global-unset-key (kbd "C-z")))



(when (eq system-type 'darwin)
  (setq mac-option-modifier nil
        mac-right-alternate-modifier nil
        mac-command-modifier 'meta
        select-enable-clipboard t))

(global-set-key [delete] 'delete-char)


(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(global-set-key (kbd "M-/") 'hippie-expand)


(global-set-key (kbd "M-*") 'pop-tag-mark)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key (kbd "M-o") 'occur)
(global-set-key (kbd "C-S-s") 'find-grep)
(global-set-key (kbd "C-S-f") 'imenu)


(defun open-init-file()
  (interactive)
  (find-file "~/.emacs"))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "<f3>") 'recentf-open-files)
(global-set-key (kbd "<f4>") 'open-init-file)
(global-set-key (kbd "<f1>") 'eshell)
(global-set-key (kbd "<f2>") 'speedbar)
(global-set-key (kbd "<f5>") 'eval-buffer)


(defun spacemacs/smart-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun spacemacs/backward-kill-word-or-region (&optional arg)
  "Calls `kill-region' when a region is active and
`backward-kill-word' otherwise. ARG is passed to
`backward-kill-word' if no region is active."
  (interactive "p")
  (if (region-active-p)
      ;; call interactively so kill-region handles rectangular selection
      ;; correctly (see https://github.com/syl20bnr/spacemacs/issues/3278)
      (call-interactively #'kill-region)
    (backward-kill-word arg)))

(global-set-key (kbd "C-a") 'spacemacs/smart-move-beginning-of-line)
(global-set-key (kbd "C-w") 'spacemacs/backward-kill-word-or-region)

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))


;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;----------------------------------------------------------------------------
;; String utilities missing from core emacs
;;----------------------------------------------------------------------------
(defun sanityinc/string-all-matches (regex str &optional group)
  "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
  (let ((result nil)
        (pos 0)
        (group (or group 0)))
    (while (string-match regex str pos)
      (push (match-string group str) result)
      (setq pos (match-end group)))
    result))

(defun sanityinc/string-rtrim (str)
  "Remove trailing whitespace from `STR'."
  (replace-regexp-in-string "[ \t\n]+$" "" str))


;;----------------------------------------------------------------------------
;; Find the directory containing a given library
;;----------------------------------------------------------------------------
(autoload 'find-library-name "find-func")
(defun sanityinc/directory-of-library (library-name)
  "Return the directory in which the `LIBRARY-NAME' load file is found."
  (file-name-as-directory (file-name-directory (find-library-name library-name))))


;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;;(load-theme 'monokai 1)
(load-theme 'exotica 1)


;; (global-hungry-delete-mode)
(smartparens-global-mode t)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)



(setq TeX-auto-save t)
(setq TeX-parse-self t)

;;(setq-default TeX-master nil)


(mapc (lambda (mode)
         (add-hook 'LaTeX-mode-hook mode))
         (list 'auto-fill-mode
               'LaTeX-math-mode
               'TeX-fold-mode
               'autopair-mode
               ;;'autoline-minor-mode

               'turn-on-reftex))
(add-hook 'LaTeX-mode-hook
              (lambda ()
                (setq TeX-auto-untabify t     ; remove all tabs before saving
                      TeX-engine 'xetex       ; use xelatex default
                      TeX-show-compilation t) ; display compilation windows
                (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
                (setq TeX-save-query nil)
                (imenu-add-menubar-index)
                ;;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
                ))

(setq TeX-view-program-list
      '(("Okular" "okular --unique %o")
        ("SumatraPDF" "SumatraPDF.exe %o")
        ("Gsview" "gsview32.exe %o")
        ("Evince" "evince %o")
        ("Firefox" "firefox %o")))

(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))
 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince")))))))


;; configuration for TeX-fold-mode
;; add entries you want to be fold, or comment that needn't to be fold.
(setq TeX-fold-env-spec-list
      (quote (("[figure]" ("figure"))
              ("[table]" ("table"))
              ("[itemize]" ("itemize"))
              ("[description]" ("description"))
              ("[tabular]" ("tabular"))
              ("[frame]" ("frame"))
              ("[array]" ("array"))
              ("[code]" ("lstlisting"))
;;              ("[eqnarray]" ("eqnarray"))
              )))

;; make the toc displayed on the left
(setq reftex-toc-split-windows-horizontally t)
;; adjust the fraction
(setq reftex-toc-split-windows-fraction 0.3)

;; local configuration for TeX modes
(company-auctex-init)
(defun my-latex-mode-setup ()
  (setq-local company-backends
              (append '((company-math-symbols-latex company-latex-commands))
                      company-backends)))

(add-hook 'tex-mode-hook 'my-latex-mode-setup)
(add-hook 'TeX-mode-hook 'my-latex-mode-setup)
(company-auctex-init)

(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(add-hook 'TeX-mode-hook 'latex-preview-pane-mode)
(add-hook 'TeX-mode-hook 'latex-extra-mode)


(setq org-latex-to-pdf-process
'("xelatex -interaction nonstopmode %f"
  "xelatex -interaction nonstopmode %f"))
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("cn-article"
               "\\documentclass[fontset = ubuntu]{ctexart}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
\\usepackage{graphicx}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



(setq org-export-backends
      '(ascii beamer html latex md deck rss s5 odt))

(setq ;org-hide-leading-stars t
                ;org-hide-emphasis-markers t
           org-fontify-done-headline t
           org-html-validation-link nil
           org-src-tab-acts-natively t
           org-confirm-babel-evaluate nil
           org-src-fontify-natively  t
           org-html-postamble nil
           ;; org-html-postamble-format
           ;; '(("en" "<p class=\"author\">Author: %a (%e)</p>\n<p class=\"date\">Date: %C</p>"))
                ;;org-html-preamble-format
                 ;;'(("en" "<p><a href=\"http://www.zju.edu.cn\">ZJU</a>  |  <a href=\"http://www.liangzu.org\">Liangzu</a>  |  <a href=\"http://\">Sina Weibo</a>  |  <a href=\"http://isocpp.org\">C++</a></p>"))
           )


(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "DONE(s)")))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("STARTED" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))
;; (setq org-todo-keyword-faces
;; '(("TODO" . org-warning) ("STARTED" . "yellow")
;;   ("CANCELED" . (:foreground "blue" :weight bold))
;;   ("IN TROUBLE" . (:foreground org-warning :weight bold))
;;   ("DONE" . (:foreground "gray" :weight bold))))

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R . t)
     (shell . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (python . t)
     (ruby . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql . nil)
     (sqlite . t))))


(with-eval-after-load 'org
    ;; here goes your Org config :)
  ;; ....


  (setq org-publish-project-alist
        '((
           "blogs"
           :base-directory "~/blog/org"
           :base-extension "org"
           :publishing-directory "~/blog/liangzu.github.com"
           :recursive t
           :publishing-function org-html-publish-to-html
           ;; :section-numbers nil
           ;;	:with-toc nil
           ;;	:with-creator nil
           ;;	:with-email t
           ;;	:makeindex "index.org"
           :html-validation-link nil
           :headline-levels 5
           :author "Liangzu Peng"
           :email "penglz@shanghaitech.edu.cn"
           ;;	:sitemap-filename "sitemap.org"
           :html-viewport nil
           :html-preamble nil
           :html-head-include-default-style nil
           :html-head "<link rel=\"stylesheet\" href=\"./css/my-css.css\" type=\"text/css\"/>"
           :html-postamble nil
           ;;	:sitemap-title "Sitemap"
                                        ;:sitemap-sort-files anti-chronologically
           ;;	:sitemap-file-entry-format "%d %t"
           ;;	:html-head-include-scripts nil
 ;       :html-preamble-format (("en" "<p><a href=\"http://www.zju.edu.cn\">ZJU</a>  |  <a href=\"http://www.liangzu.org\">Homepage</a>  |  <a href=\"http://www.liangzu.org\">Homepage</a></p>"))
;	:html-postamble-format "<p class=\"author\">Author: %a (%e)</p>\n<p class=\"date\">Date: %C</p>"
	)
	(
	"images"
	:base-directory "~/blog/org/images"
        :base-extension "jpg\\|gif\\|png\\|svg"
	:publishing-directory "~/blog/liangzu.github.com/images"
	:recursive t
    :publishing-function org-publish-attachment)

	(
	"css"
	:base-directory "~/blog/org/css"
	:base-extension "css"
	:publishing-directory "~/blog/liangzu.github.com/css"
	:recursive t
	:publishing-function org-publish-attachment)

	("blog" :components ("blogs" "images" "css"))
        )
      )
)



(defun hook-text-mode ()
  "Hook for Text mode."
  (make-local-variable 'linum-format)
  (linum-mode (if (< (buffer-size) (* 9999 80)) 1 -1))
  (electric-indent-local-mode -1)
  (setq linum-format " %d "))

(add-hook 'text-mode-hook #'hook-text-mode)
