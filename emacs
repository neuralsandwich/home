;; Find which system we are on
(setq sean-aquamacs (featurep 'aquamacs))
(setq sean-linux (featurep 'x))
(setq sean-win32 (not (or sean-aquamacs sean-linux)))

;; Get rid of the tool bar
(when (window-system)
    (tool-bar-mode -1)
    (scroll-bar-mode -1))
(menu-bar-mode 0)

;; Get rid of splash screen
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

;; Automatically indent by 2
(setq-default c-basic-offset 2)
;; Show column ruler at 80 columns
(setq-default fci-rule-column 80)    

;; Set Editor style
;; Set colours
(global-hl-line-mode 1)

;; set font
(setq complication-directory-locked nil)
(setq enable-local-variables nil)
(setq sean-font "outline-DejaVu Sans Mono")

;; Clang format
(load "/usr/share/emacs/site-lisp/clang-format-3.4/clang-format.el")
(global-set-key (kbd "M-p") 'clang-format-buffer)

;; Load cmake mode
(setq load-path (cons (expand-file-name "~/.emacs.d/lisp") load-path))
(require 'cmake-mode)

;; Load auto-inserts
(add-to-list 'load-path "~/.emacs.d/lisp")
(load-library "auto-inserts")


(load-library "view")
(require 'cc-mode)
(require 'ido)
(require 'compile)
(ido-mode t)

;; Enable org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Setup org files
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/projects.org" 
                             "~/org/home.org"))

;; Smooth scrolling
(setq scroll-step 3)

;; Clock
(display-time)

;; Bright red TODOS
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode cmake-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
	   ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)

(define-key global-map [f9] 'first-error)
(define-key global-map [f10] 'previous-error)
(define-key global-map [f11] 'next-error)

(load-theme 'manoj-dark)

;;Initalise the GNU Emacs Lisp Package Archive
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(setq-default dotspacemacs-configuration-layers '(osx))
