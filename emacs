;; Get rid of the tool bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Automatically indent by 2
(setq-default c-basic-offset 2)

;; Clang format
(load "/usr/share/emacs/site-lisp/clang-format-3.4/clang-format.el")
(global-set-key (kbd "M-p") 'clang-format-buffer)
