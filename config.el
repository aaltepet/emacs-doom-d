;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(add-hook! 'emacs-startup-hook
  (setq uniquify-buffer-name-style
	'post-forward))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andy  Altepeter"
      user-mail-address "andyaltepeter@invenshure.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Mono" :size 12 :swight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;(setq doom-theme 'doom-one)
(setq doom-theme 'monokai)

;; https://github.com/seagle0128/doom-modeline
(setq doom-modeline-buffer-file-name-style 'buffer)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/dev/org")
(setq org-agenda-files '("~/dev/org/" "~/dev/my-power-pak/"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(require 'prettier-js)
(add-hook! 'typescript-mode-hook 'prettier-js-mode)
(add-hook! 'js2-mode-hook 'prettier-js-mode)
(add-hook! 'js-mode-hook 'prettier-js-mode)
(add-hook! 'web-mode-hook 'prettier-js-mode)

(setq-default tab-width 2)
'(js-indent-level 2)


(setq company-idle-delay 1)
;(setq company-minimum-prefix-length 4)

(defun my-web-mode-hook ()
  "Hooks for web-mode"
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq-default tab-always-indent t)

;; run gofmt before saving a golang file
;; (add-hook! 'before-save-hook 'gofmt-before-save)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; emacs incorrectly sets up the path, so my go/bin is part of an Emacs/cellar path
;; instead of determining why, I'm just appending the correct go path
;; onto the end of PATH and exec-path, this makes gopls and lsp-mode happy
;(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/Users/andy/go/bin"))
;(message "%s" exec-path)
;(setq exec-path (append exec-path '("/Users/andy/go/bin")))

(add-hook! 'ibuffer-hook
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
    (ibuffer-do-sort-by-alphabetic)))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              vc-relative-file)))

