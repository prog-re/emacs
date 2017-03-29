;; arg >= 1 enable the menu bar. menu bar is the file, edit, options,
;; buffers, tools, emacs-lisp, help
(menu-bar-mode 0)

;; with numeric arg, display the tool bar if and only if arg is
;; positive.  tool bar has icons document (read file), folder (read
;; directory), x (discard buffer), disk (save), disk+pen (save-as),
;; back arrow (undo), scissors (cut), etc.
(tool-bar-mode 0)

;; hide startupscreen
(setq inhibit-startup-message t)

 ;; ========== enable line and column numbering ==========

;; show line-number in the mode line
(line-number-mode 1)

;; show column-number in the mode line
(column-number-mode 1)

;; enable a color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-jonadabian-slate)

;;Save backup in local dir
(setq backup-directory-alist `(("." . "~/.saves")))

;; Backup by copy
(setq backup-by-copying t)

;;windows faggery
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1)               ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy nil) 

;; SHOW FILE PATH IN FRAME TITLE
(setq-default frame-title-format "%b (%f)")

(global-set-key "\M- " 'hippie-expand)

; my eclipse CTRL+ALT+G replacement
(defun grep-selected (start end)
  (interactive "r") 
  (grep (concat "grep -nH -e " 
                (buffer-substring start end)
                " * .*")))
(global-set-key "\C-\M-g" 'grep-selected)

(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;;Spelling
(setq ispell-program-name "aspell") 

;;Copy on linux
(setq x-select-enable-clipboard t)


;;Autoformat like Eclipse
(fset 'autoformat
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 114 32 114 24 104 134217848 105 110 100 101 110 116 45 114 101 103 105 111 110 return 67108896 67108896 24 114 106 114] 0 "%d")) arg)))

(global-set-key "\C-F" 'autoformat)

;;  For latex support
(require 'org-latex)

;;Line numbers
(global-linum-mode t)

(fset 'text-shrink
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 67108909 45 45 45 45 24] 0 "%d")) arg)))

(global-set-key [C-kp-subtract] 'text-shrink)


(fset 'text-embiggen
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 67108907 43 43 43 43 24] 0 "%d")) arg)))

(global-set-key [C-kp-add] 'text-embiggen)

;Rope
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

 (setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)


(add-to-list 'load-path "~/emacs/scadmode")
;;(require 'scad-mode)
(autoload 'scad-mode "scad-mode" "Major mode for editing SCAD code." t)
(add-to-list 'auto-mode-alist '("\\.scad$" . scad-mode))

(add-to-list 'load-path "~/Sync/emacs/vbmode")
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|ob\\|imp\\)$" .
                                  visual-basic-mode)) auto-mode-alist))


;;Highlight parentesis
(show-paren-mode t)
(setq blink-matching-paren t)

;;Set Window size
(add-to-list 'default-frame-alist (cons 'width 100))


;;Python header
(define-skeleton phead
"Insert standard Python header"
""
"#-------------------------------------------------------------------------------\n"
"#(C) Copyright Martin Karlsson, Sweden 2017                                     \n"
"#-------------------------------------------------------------------------------\n"
"#Project     :" (setq v1 (skeleton-read "Project: ")) \n
"#Description :" (setq v1 (skeleton-read "Description: ")) \n                   
"#Author      :Martin Karlsson                                     \n"
"#Date        :"  (setq v1 (skeleton-read "Date: ")) \n
"#-------------------------------------------------------------------------------\n"
)

;;Python divider
(define-skeleton pdiv
"Insert Python divider"
""
"#-------------------------------------------------------------------------------\n"
)

(add-hook 'python-mode-hook ;;
	  '(lambda ()
       	  	   (local-set-key "\C-ch" 'phead)
		   (local-set-key "\C-c " 'pdiv)
	   )
)

(fset 'tag-search-current
   [?\M-b ?\C-  ?\M-f escape ?w ?\M-x ?t ?a ?g ?s ?- ?s ?e ?a ?r ?c ?h return ?\C-y])

(global-set-key (kbd "M--") 'tag-search-current)

(global-set-key "\C-xc" 'compile)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


;;NODEJS
(setenv "NODE_NO_READLINE" "1")

;;Javascript indent 2 spaces
(setq js-indent-level 2)
