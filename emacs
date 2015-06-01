;; Find which system we are on
(setq sean-aquamacs (featurep 'aquamacs))
(setq sean-linux (featurep 'x))
(setq sean-win32 (not (or sean-aquamacs sean-linux)))

;; Get rid of the tool bar
(if window-system
    (tool-bar-mode 0))
(menu-bar-mode 0)

;; Automatically indent by 2
(setq-default c-basic-offset 2)

;; Clang format
(load "/usr/share/emacs/site-lisp/clang-format-3.4/clang-format.el")
(global-set-key (kbd "M-p") 'clang-format-buffer)

;; Set Editor style
;; Set colours
(global-hl-line-mode 1)

;; set font
(setq complication-directory-locked nil)
(setq enable-local-variables nil)
(setq sean-font "outline-DejaVu Sans Mono")

(load-library "view")
(require 'cc-mode)
(require 'ido)
(require 'compile)
(ido-mode t)

;; Smooth scrolling
(setq scroll-step 3)

;; Clock
(display-time)

;; Bright red TODOS
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
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

(global-set-key (kbd "M-[") 'compile)

(set-foreground-color "burlywood3")
(set-background-color "#161616")
(set-cursor-color "#40FF40")
