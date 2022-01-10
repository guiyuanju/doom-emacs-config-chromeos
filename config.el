;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
;; (setq doom-font (font-spec :family "fantasque sans mono" :size 16 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "ETBembo" :size 17))

(setq doom-font (font-spec :family "fira code" :size 26 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;;; evil

(use-package! evil-escape
  :init
  (setq evil-escape-unordered-key-sequence t)) ; enable "k j"

;; Widndow management

(map! :desc "Switch to next window"
      :nvi "C-j" 'evil-window-next)

(map! :desc "Switch to previous window"
      :nvi "C-k" 'evil-window-prev)

(map! :desc "Close window"
      :nvi "C-w" '+workspace/close-window-or-workspace)

;;; Selection

(map! :desc "Expand region"
      :nvi "C-=" 'er/expand-region)

(map! :desc "Shrink region"
      :nvi "C--" 'er/contract-region)

;;; Navigation

(map! :desc "Move to the begining of a line in all modes"
      :nvi "C-a" 'doom/backward-to-bol-or-indent)

(map! :desc "Move to the end of a line in all modes"
      :nvi "C-e" 'doom/forward-to-last-non-comment-or-eol)

(map! :desc "Next line"
      :nvi "C-n" 'next-line)

(map! :desc "Previous line"
      :nvi "C-p" 'previous-line)

;;; Editing

(map! :desc "Undo"
      :nvi "M-z" 'evil-undo)

(map! :desc "Redo"
      :nvi "M-Z" 'evil-redo)

(map! :desc "Substitute"
      :v "s" 'evil-substitute)

;;; cider

(use-package! cider
  :init
  (setq clojure-toplevel-inside-comment-form nil))

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval last sexp"
      :nvi "M-<return>" 'cider-eval-last-sexp)

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval last sexp and output into a buffer"
      :nvi "M-S-<return>" 'cider-pprint-eval-last-sexp)

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval toplevel"
      :nvi "C-<return>" 'cider-eval-defun-at-point)

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval toplevel and output into a buffer"
      :nvi "C-S-<return>" 'cider-pprint-eval-defun-at-point)

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval sexp up to the point"
      :nvi "C-M-<return>" 'cider-eval-sexp-up-to-point)

(map! :map (clojurescript-map-mode clojure-mode-map)
      :desc "Eval sexp up to the point and output into a buffer"
      :nvi "C-M-S-<return>" 'cider-pprint-eval-sexp-up-to-point)

(defun cider-pprint-eval-sexp-up-to-point ()
  (interactive)
  (cider-eval-sexp-up-to-point 't))
