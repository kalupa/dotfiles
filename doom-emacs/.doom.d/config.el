;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Paul Kalupnieks"
      user-mail-address "paul@karrupa.com"
      dumb-jump-prefer-searcher 'ripgrep
      display-line-numbers-type nil
  )

(setq js-doc-mail-address user-mail-address
       js-doc-author (format "%s <%s>" user-full-name js-doc-mail-address)
       js-doc-url "https://pau.lk"
       js-doc-license "license name")

;; enable to debug tide-typescript problems `tail -f /tmp/tss.log`
;; (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

;; enable word-wrap (almost) everywhere
;; (+global-word-wrap-mode +1)

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 13))
;; (setq doom-font (font-spec :family "iA Writer Mono S" :size 12))

(load-theme 'solarized-dark-high-contrast t)
(setq
  ;; solarized-distinct-fringe-background t ;; make the fringe stand out from the background
  ;; solarized-high-contrast-mode-line t ;; make the modeline high contrast
  solarized-use-more-italic t ;; Use more italics
  )


(setq
  doom-modeline-project-detection 'auto ;; How to detect the project root.
  doom-modeline-icon (display-graphic-p) ;; Whether display icons in the mode-line. While using the server mode in GUI, should set the value explicitly.
  doom-modeline-major-mode-icon t ;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
  doom-modeline-major-mode-color-icon t ;; Whether display the colorful icon for `major-mode'. It respects `all-the-icons-color-icons'.
  doom-modeline-buffer-state-icon t ;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
  doom-modeline-buffer-modification-icon t ;; Whether display the modification icon for the buffer. It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
  doom-modeline-minor-modes nil ;; Whether display the minor modes in the mode-line.
  doom-modeline-github t ;; Whether display the GitHub notifications. It requires `ghub' package.
  )

(setq find-file-visit-truename t) ;; properly display symlink paths

(when IS-MAC
  (setq ns-use-thin-smoothing t))

(after! company
  (setq company-tooltip-flip-when-above t
        ))

(setq js-indent-level 2
      js2-basic-offset 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)

(add-hook 'js2-mode-hook
  #'(lambda ()
      (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
      (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(after! typescript-mode
  (add-hook 'typescript-mode-hook #'prettier-js-mode)
  ;; (add-hook 'typescript-mode-hook #'flycheck-mode)
  (setq typescript-indent-level 2))

(after! web-mode
  ;; (add-hook 'web-mode-hook #'flycheck-mode)
  (add-hook 'web-mode-hook #'prettier-js-mode)

  (setq web-mode-markup-indent-offset 2 ;; Indentation
        web-mode-code-indent-offset 2
        web-mode-auto-close-style 2))

(map! :leader
      "h L" #'global-keycast-mode
      "f t" #'find-in-dotfiles
      "f T" #'browse-dotfiles)

;; magit
(setq
  magit-repository-directories '(("$HOME/src" . 4))
  magit-save-repository-buffers 'dontask
)

(after! haskell-mode
  (add-hook 'haskell-mode-hook #'lsp)
  )
