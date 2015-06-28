;;; package -- Emacs configuration
;;; Commentary:
;;;  I like cheese

;; -*- Mode: emacs-lisp; -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-c++-modes (quote (c++-mode c-mode java-mode)))
 '(align-dq-string-modes
   (quote
    (vhdl-mode emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode c++-mode c-mode java-mode perl-mode cperl-mode python-mode)))
 '(align-open-comment-modes
   (quote
    (vhdl-mode emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode c++-mode c-mode java-mode perl-mode cperl-mode python-mode makefile-mode js2-mode)))
 '(align-text-modes (quote (text-mode outline-mode markdown-mode)))
 '(auto-image-file-mode t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-matching-paren-dont-ignore-comments t)
 '(comment-auto-fill-only-comments t)
 '(compilation-message-face (quote default))
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "358738e12848b6acba290352cd8d4625a6ec9e79122dcbda11e2ea9e4b0f00c4" default)))
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
 '(helm-autoresize-mode t)
 '(indicate-buffer-boundaries (quote ((t . right) (top . left))))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(js2-concat-multiline-strings nil)
 '(js2-global-externs nil)
 '(js2-highlight-level 3)
 '(js2-include-jslint-globals nil)
 '(js2-include-node-externs t)
 '(js2-indent-switch-body t)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-show-parse-errors nil)
 '(line-number-mode nil)
 '(magit-diff-use-overlays nil)
 '(mouse-avoidance-mode (quote banish) nil (avoid))
 '(mouse-wheel-progressive-speed nil)
 '(osx-clipboard-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-very-old-color nil))

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
(setq-default url-http-attempt-keepalives nil)

;; Use Emacs terminfo, not system terminfo
(setq-default system-uses-terminfo nil)

(setq-default default-frame-alist '((width . 180) (height . 90)))

;; highlight when past 90
(setq-default column-enforce-column 90)
(add-hook 'js2-mode-hook 'column-enforce-mode)
(add-hook 'coffee-mode-hook 'column-enforce-mode)

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq-default helm-quick-update t)
(setq-default helm-bookmark-show-location t)
(setq-default helm-buffers-fuzzy-matching t)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

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

(setq-default shift-width 2)
;; (dtrt-indent-mode 1)

(evil-mode t)

;; not sure if I like the vim or emacs default
(define-key global-map (kbd "RET") 'newline-and-indent)

(evilnc-default-hotkeys)
(setq-default evil-want-C-i-jump nil)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(setq-default evil-leader/in-all-states 1)

(setq-default evilnc-hotkey-comment-operator ",,")

(evil-leader/set-key
  "<SPC>" 'helm-my-buffers
  "l" (kbd "C-w l")
  "h" (kbd "C-w h")
  "j" (kbd "C-w j")
  "k" (kbd "C-w k")
  )

(setq-default evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(global-evil-surround-mode 1)
(global-evil-matchit-mode 1)


(setq-default evil-emacs-state-cursor '("green" box))
(setq-default evil-normal-state-cursor '("red" box))
(setq-default evil-visual-state-cursor '("orange" box))
(setq-default evil-insert-state-cursor '("green" bar))
(setq-default evil-replace-state-cursor '("green" bar))
(setq-default evil-operator-state-cursor '("green" hollow))

;; escape all the things
;; (setq-default evil-escape-key-sequence "jk")
;;; use jk for going to command mode
;; (key-chord-mode 1)
;; (key-chord-define-global "jk" 'evil-normal-state)

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
(setq-default evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq-default evil-emacs-state-modes nil)

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

(setq-default linum-format "%4d \u2502")
(global-linum-mode 1)

(global-git-gutter-mode t)
(git-gutter:linum-setup)

(global-hl-line-mode)
(display-time-mode t)

(setq-default magit-last-seen-setup-instructions "1.4.0")

(load-theme 'solarized)

(setq sml/theme 'respectful)
(setq sml/no-confirm-load-theme t
      sml/shorten-directory t
      sml/shorten-modes t
      sml/name-width 40
      sml/mode-width "full")

(setq rm-blacklist '(" GitGutter"
                     " Helm"
                     " Undo-Tree"
                     " OSX-Clipboard"
                     " ColorIds"
                     " AC"
                     " yas"
                     " 90col"))

(sml/setup)
(add-to-list 'sml/replacer-regexp-list '("^~/apps/lp-builder" " Bldr ") t)
(add-to-list 'sml/replacer-regexp-list '("^~/apps/builder-tools" " BldTls ") t)
(add-to-list 'sml/replacer-regexp-list '("^~/dotfiles/emacs" "Emcs") t)



; active Babel languages
(require 'evil-org)
(setq-default org-src-fontify-natively t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((css . t)
   (js . t)
   (ruby . t)
   (sh . t)
   (python . t)
   (haskell . t)
   ))

(setq-default js2-basic-indent 2)
(setq-default js2-basic-offset 2)
(setq-default js2-bounce-indent-p t)
(setq-default js2-auto-indent-p nil)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)

(add-hook 'js2-mode-hook 'flycheck-mode)


(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'auto-mode-alist '(".jshintrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jscsrc$" . json-mode))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers 
;;   (append flycheck-disabled-checkers    
;;     '(javascript-jshint)))             

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))

;; color any defined variables with color-identifiers-mode
;; (add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'js2-mode-hook 'rainbow-identifiers-mode)
(add-hook 'coffee-mode-hook 'rainbow-identifiers-mode)

;; (defun align-colons (beg end)
;;   (interactive "r")
;;   (align-regexp beg end ":\\(\\s-*\\)" 1 1 t))

;; adjust indents for web-mode to 2 spaces
;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode. Adjust indent"
;;   ;;; http://web-mode.org/
;;   (setq-default web-mode-markup-indent-offset 2)
;;   (setq-default web-mode-css-indent-offset 2)
;;   (setq-default web-mode-code-indent-offset 2))
;; (add-hook 'web-mode-hook  'my-web-mode-hook)

;; Paradox
(setq-default paradox-github-token "c9186f445f57866c06142e94e5b31e7749d4f11d")

;; auto-complete
(setq-default ac-auto-show-menu t)
(setq-default ac-auto-start t)
(setq-default ac-quick-help-delay 0.3)
(setq-default ac-quick-help-height 30)
(setq-default ac-show-menu-immediately-on-auto-complete t)

(ac-config-default)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

(tool-bar-mode -1)
(setq-default frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; prefer fringe
(setq-default next-error-highlight 'fringe-arrow)

;; (diminish 'visual-line-mode)
;; (diminish 'undo-tree-mode)
;; (diminish 'auto-complete-mode)
;; (diminish 'git-gutter-mode)
;; (diminish 'osx-clipboard-mode)
;; (diminish 'helm-mode)
;; (diminish 'column-enforce-mode)
;; (diminish 'dtrt-indent-mode)
;; (diminish 'projectile-mode)
;; (diminish 'golden-ratio-mode)
;; (diminish 'color-identifiers-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
