;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Paul Kalupnieks"
      user-mail-address "paul@karrupa.com"
      magit-repository-directories '(("~/src" . 4))
      dumb-jump-prefer-searcher 'ripgrep
      )

(setq doom-font (font-spec :family "Hack Nerd Font" :size 13)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "Hack Nerd Font")
      doom-big-font (font-spec :family "Fira Mono" :size 19)
      )

(load-theme 'doom-vibrant t)

(when IS-MAC
  (setq ns-use-thin-smoothing t))

(after! company
  (setq company-tooltip-flip-when-above t
        ))

(setq js-indent-level 2
      js2-basic-offset 2)

(after! typescript-mode
  (add-hook 'typescript-mode-hook #'flycheck-mode)
  (setq typescript-indent-level 2))

(after! web-mode
  (add-hook 'web-mode-hook #'flycheck-mode)

  (setq web-mode-markup-indent-offset 2 ;; Indentation
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil ;; disbale adding "" after an =
        web-mode-auto-close-style 2))
