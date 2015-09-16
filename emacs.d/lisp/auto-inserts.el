(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '("Short description: "
       "//===-- " (file-name-nondirectory (buffer-file-name))
       " " (while (< (current-column) 64)
	     (insert-char ?-))
       "-*- C++ -*-===//\n"
       "//\n"
       "// This file is distributed uner the MIT license. See LICENSE.txt for details."
       > \n
       "//\n"
       "//===----------------------------------------------------------------------===//"
       > \n
       "///\n"
       "/// \\file\n"
       "/// " str > \n
       "///\n"
       "//===----------------------------------------------------------------------===//"
       > \n _ \n)))


(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(org\\)\\'" . "Org-mode skeleton")
     '("Empty"
       "#+TITLE: " _ \n
       "#+AUTHOR: Sean Jones\n"
       "#+EMAIL: neuralsandwich@gmail.com\n"
       "#+DATE: " (shell-command-to-string "echo -n $(date +%Y-%m-%d)")
       > \n)))
