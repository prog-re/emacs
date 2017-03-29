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
(color-theme-calm-forest)
