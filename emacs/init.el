;;; package -- Emacs configuration
;;; Commentary:
;;;  I like cheese

;; -*- Mode: emacs-lisp; -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 1.0)
 '(align-c++-modes (quote (c++-mode c-mode java-mode js2-mode)))
 '(align-dq-string-modes
   (quote
    (vhdl-mode emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode c++-mode c-mode java-mode perl-mode cperl-mode python-mode js2-mode)))
 '(align-open-comment-modes
   (quote
    (vhdl-mode emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode c++-mode c-mode java-mode perl-mode cperl-mode python-mode makefile-mode js2-mode)))
 '(auto-image-file-mode t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(blink-matching-paren-dont-ignore-comments t)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(display-time-format nil)
 '(display-time-mode t)
 '(display-time-use-mail-icon nil)
 '(dynamic-completion-mode t)
 '(evil-cross-lines t)
 '(evil-display-shell-error-in-message t)
 '(evil-search-module (quote isearch))
 '(evil-shift-width 2)
 '(evil-symbol-word-search t)
 '(evil-vsplit-window-right t)
 '(fci-rule-color "#073642")
 '(flycheck-completion-system (quote grizzl))
 '(flycheck-highlighting-mode (quote symbols))
 '(flycheck-indication-mode (quote right-fringe))
 '(follow-auto t)
 '(frame-background-mode (quote dark))
 '(fringe-mode (quote (0)) nil (fringe))
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-linum-mode t)
 '(global-whitespace-mode nil)
 '(indicate-buffer-boundaries (quote ((t . right) (top . left))))
 '(inhibit-startup-screen t)
 '(js2-concat-multiline-strings nil)
 '(js2-global-externs nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals nil)
 '(js2-include-node-externs t)
 '(js2-indent-switch-body t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-show-parse-errors nil)
 '(magit-diff-use-overlays nil)
 '(mouse-avoidance-mode (quote banish) nil (avoid))
 '(mouse-wheel-progressive-speed nil)
 '(osx-clipboard-mode t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(sml/mode-width
   (if
       (eq powerline-default-separator
           (quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (car powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active1)
                   nil)))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (car powerline-default-separator-dir)))
                   nil
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s" powerline-default-separator
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active2)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(sml/theme (quote respectful))
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil))

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

(setq default-frame-alist '((width . 180) (height . 90)))

;; highlight when past 90
(setq column-enforce-column 90)
(add-hook 'js2-mode-hook 'column-enforce-mode)
;; (add-hook 'coffee-mode-hook 'column-enforce-mode)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)
(helm-mode 1)
;; (after 'projectile
;;   (package 'helm-projectile))

(global-set-key (kbd "M-x") 'helm-M-x)

;; (projectile-global-mode t)
;; (setq projectile-completion-system 'grizzl)
(defun helm-my-buffers ()
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-source-buffers-list
                         helm-c-source-recentf
                         helm-source-projectile-files-list
                         helm-source-elscreen
                         helm-c-source-locate)
                       "*helm-my-buffers*")))

;;; begin the evil ;;;
(setq-default tab-width 2 indent-tabs-mode nil)

(setq-local shift-width 2)
(dtrt-indent-mode 1)

;; not sure if I like the vim or emacs default
;; (define-key global-map (kbd "RET") 'newline-and-indent)

(evilnc-default-hotkeys)
(setq evil-want-C-i-jump nil)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(setq evil-leader/in-all-states 1)

(setq evilnc-hotkey-comment-operator ",,")

(evil-leader/set-key
  "<SPC>" 'helm-my-buffers
  "l" (kbd "C-w l")
  "h" (kbd "C-w h")
  "j" (kbd "C-w j")
  "k" (kbd "C-w k")
  )

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
;;; use jk for going to command mode
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

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

;; (global-evil-search-highlight-persist t)
;; (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)
;;; end EVIL ;;;

;; Markdown mode, use GFM
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(setq linum-format "%4d \u2502")
(global-linum-mode 1)

(global-git-gutter-mode t)
(git-gutter:linum-setup)

(global-hl-line-mode)
(display-time-mode t)

(load-theme 'solarized-dark)
(load-theme 'smart-mode-line-powerline)

(powerline-default-theme)
(setq sml/theme 'respectful)
(sml/setup)

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

;; Use tern for syntax highlighting, and semantic analysis
;; (require 'tern-lint)
;; (with-eval-after-load 'tern
;;   (flycheck-tern-lint-setup))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . tj-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . tj-mode))

(setq-default js2-basic-indent 2)

(setq-default js2-basic-offset 2)
(setq-default js2-auto-indent-p t)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)
;; color any defined variables with color-identifiers-mode
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-to-list 'auto-mode-alist '(".jshintrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jscsrc$" . json-mode))

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; Paradox
(setq paradox-github-token "c9186f445f57866c06142e94e5b31e7749d4f11d")

;; auto-complete
(setq ac-auto-show-menu t)
(setq ac-auto-start t)
(setq ac-quick-help-delay 0.3)
(setq ac-quick-help-height 30)
(setq ac-show-menu-immediately-on-auto-complete t)

(ac-config-default)

(tool-bar-mode -1)
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; prefer fringe
(setq next-error-highlight 'fringe-arrow)

(diminish 'visual-line-mode)
(diminish 'undo-tree-mode)
(diminish 'auto-complete-mode)
;; (diminish 'projectile-mode)
(diminish 'git-gutter-mode)
(diminish 'osx-clipboard-mode)
(diminish 'helm-mode)
;; (diminish 'golden-ratio-mode)
;; (add-hook 'color-identifiers-mode (diminish 'color-identifiers-mode))
;; (diminish 'color-identifiers-mode)
;; (diminish 'autopair-mode)
;; (diminish 'smartparens-mode)
;; (diminish 'yas-minor-mode)
;; (diminish 'guide-key-mode)
;; (diminish 'eldoc-mode)
;; (diminish 'company-mode)
;; (diminish 'elisp-slime-nav-mode)
;; (diminish 'magit-auto-revert-mode)
;; (diminish 'hs-minor-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line-highlight ((t (:underline t)))))
