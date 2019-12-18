;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Paul Kalupnieks"
      user-mail-address "paul@karrupa.com"
      dumb-jump-prefer-searcher 'ripgrep
      )

(setq doom-font (font-spec :family "Hack Nerd Font" :size 13))

(load-theme 'solarized-dark-high-contrast t)
(setq solarized-distinct-fringe-background t ;; make the fringe stand out from the background
      solarized-high-contrast-mode-line t ;; make the modeline high contrast
      solarized-use-more-italic t ;; Use more italics
      )

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

(map! :leader
      "h L" #'global-keycast-mode
      "f t" #'find-in-dotfiles
      "f T" #'browse-dotfiles)

;; magit
(setq
  magit-repository-directories '(("~/src" . 4))
  magit-save-repository-buffers 'dontask
)
