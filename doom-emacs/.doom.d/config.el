;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Paul Kalupnieks"
      user-mail-address "paul@karrupa.com"
      doom-font (font-spec :family "Hack Nerd Font" :size 12)
      doom-theme 'doom-vibrant
      magit-repository-directories '(("~/src" . 4))
      ;; dumb-jump-prefer-searcher 'ripgrep
      )

(when IS-MAC
  (setq ns-use-thin-smoothing t))

(after! company
  (setq company-tooltip-flip-when-above t
        ))
