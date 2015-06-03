;;; package -- Emacs configuration
;;; Commentary:
;;;  I like cheese

;; -*- Mode: emacs-lisp; -*-

(require 'server)
;;; Code:
(if (server-running-p)
    (message "Server is running")
  (progn
    (message "Starting server")
    (server-start)))

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)

(add-to-list 'auto-mode-alist '("\\Cask\\'" . emacs-lisp-mode))
(require 'pallet)
(pallet-mode t)

;(package-initialize)
;(setq package-archives '(
                         ;("melpa" . "http://melpa.milkbox.net/packages/")
                         ;("ELPA" . "http://tromey.com/elpa/")
                         ;("org" . "http://orgmode.org/elpa/")
                         ;("gnu" . "http://elpa.gnu.org/packages/")
                         ;))

(when (not package-archive-contents)
  (package-refresh-contents))

(setq url-http-attempt-keepalives nil)

;; js2 settings
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 1.0)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(blink-matching-paren-dont-ignore-comments t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(display-time-24hr-format t)
 '(display-time-day-and-date nil)
 '(display-time-format nil)
 '(display-time-use-mail-icon nil)
 '(dynamic-completion-mode t)
 '(electric-pair-inhibit-predicate (quote electric-pair-default-inhibit))
 '(electric-pair-mode t)
 '(electric-pair-pairs (quote ((34 . 34) (39 . 39))))
 '(electric-pair-text-pairs (quote ((34 . 34) (39 . 39))))
 '(evil-cross-lines t)
 '(evil-display-shell-error-in-message t)
 '(evil-search-module (quote isearch))
 '(evil-shift-width 2)
 '(evil-symbol-word-search t)
 '(evil-vsplit-window-right t)
 '(flycheck-completion-system (quote grizzl))
 '(flycheck-highlighting-mode (quote symbols))
 '(flycheck-indication-mode (quote right-fringe))
 '(flycheck-javascript-jscs-executable "jscs")
 '(flycheck-javascript-jshint-executable "jshint")
 '(global-whitespace-mode nil)
 '(golden-ratio-mode nil)
 '(line-number-mode nil)
 '(mouse-avoidance-mode (quote banish) nil (avoid))
 '(mouse-wheel-progressive-speed nil)
 '(osx-clipboard-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-less-bold t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))

;;; begin the evil ;;;
(setq-default tab-width 2 indent-tabs-mode nil)
(setq-local shift-width 2)
(dtrt-indent-mode 1)

(evilnc-default-hotkeys)

(evilnc-default-hotkeys)
(setq evil-want-C-i-jump nil)

(require 'evil-org)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(setq evil-leader/in-all-states 1)

(setq evilnc-hotkey-comment-operator ",,")

(evil-leader/set-key
  "p" 'projectile-find-file
  "f" 'projectile-ag
  "b" 'projectile-switch-to-buffer
  "l" (kbd "C-w l")
  "h" (kbd "C-w h")
  "j" (kbd "C-w j")
  "k" (kbd "C-w k")
  )

  ;; "cc" 'evilnc-comment-or-uncomment-lines
  ;; "c<spc>" 'evilnc-comment-or-uncomment-lines
  ;; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;; "cc" 'evilnc-copy-and-comment-lines
  ;; "cy" 'evilnc-copy-and-comment-lines
  ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;; "cr" 'comment-or-uncomment-region
  ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;; "\\" 'evilnc-comment-operator


(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)

(evil-mode t)

(setq evil-emacs-state-cursor '("green" box))
(setq evil-normal-state-cursor '("red" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("green" bar))
(setq evil-replace-state-cursor '("green" bar))
(setq evil-operator-state-cursor '("green" hollow))

;; escape all the things
(setq-default evil-escape-key-sequence "jk")
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;;; use jk for going to command mode
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

;; os x clipboard to killring
(osx-clipboard-mode +1)

;;; shift key is my enemy, adds W as a valid save ex-command
(evil-ex-define-cmd "W[rite]" 'evil-write)

;;; use vim movement everywhere
(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

;;; RET and space should be more vim
(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))

(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

;;; end EVIL ;;;

(require 'powerline)

;; Not sure what these were again
;; (setq sml/theme 'powerline-evil-vim-color-theme)
;; (sml/setup)

(setq linum-format "%4d \u2502")
(global-linum-mode 1)
(global-git-gutter-mode t)
(git-gutter:linum-setup)

(when (member "inconsolata-g for powerline" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata-g for Powerline"))

; active Babel languages
(setq org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((css . t)
   (js . t)
   (ruby . t)
   (sh . t)
   (python . t)
   (haskell . t)
   ))

;; (add-hook 'prog-mode-hook 'relative-line-numbers-mode t)

;; (add-hook 'prog-mode-hook 'line-number-mode t)
;; (add-hook 'prog-mode-hook 'column-number-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; Paradox
(setq paradox-github-token "c9186f445f57866c06142e94e5b31e7749d4f11d")

;;;;;;;;; KEYS

(projectile-global-mode t)
(setq projectile-completion-system 'grizzl)

;; auto-complete
(setq ac-auto-show-menu t)
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.3)
(setq ac-quick-help-height 30)
(setq ac-show-menu-immediately-on-auto-complete t)

(ac-config-default)

(setq make-backup-files nil)

;; (scroll-bar-mode -1)
;; (menu-bar-mode -1)
(tool-bar-mode -1)

(diminish 'visual-line-mode)
(diminish 'undo-tree-mode)
(diminish 'auto-complete-mode)
(diminish 'projectile-mode)
(diminish 'git-gutter-mode)
(diminish 'osx-clipboard-mode)
(diminish 'golden-ratio-mode)

;; (diminish 'autopair-mode)
;; (diminish 'smartparens-mode)
;; (diminish 'yas-minor-mode)
;; (diminish 'guide-key-mode)
;; (diminish 'eldoc-mode)
;; (diminish 'company-mode)
;; (diminish 'elisp-slime-nav-mode)
;; (diminish 'magit-auto-revert-mode)
;; (diminish 'hs-minor-mode)
;; (diminish 'color-identifiers-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
