;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Paul Kalupnieks"
      user-mail-address "paul@karrupa.com"
      doom-font (font-spec :family "Hack Nerd Font" :size 12)
      doom-theme 'doom-vibrant
      magit-repository-directories '(("~/src" . 3))
      ;; dumb-jump-prefer-searcher 'ripgrep
      )

(when IS-MAC
  (setq ns-use-thin-smoothing t))

(after! company
  (setq company-tooltip-flip-when-above t))

(add-hook! (js-mode #'indium-interaction-mode))

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))

;; (setq company-tooltip-align-annotations t)

;; (add-hook 'before-save-hook 'tide-format-before-save)
;; (add-hook! (typescript-mode web-mode
;;   #'setup-tide-mode))



;; (def-package! typescript-mode
;;   :mode "\\.ts$"
;;   :config
;;   (add-hook 'typescript-mode-hook #'rainbow-delimiters-mode)

;;   (set! :electric 'typescript-mode :chars '(?\} ?\)) :words '("||" "&&"))

;;   ;; TODO tide-jump-back
;;   ;; TODO (tide-jump-to-definition t)
;;   ;; TODO convert into keybinds
;;   ;; (set! :emr 'typescript-mode
;;   ;;       '(tide-find-references             "find usages")
;;   ;;       '(tide-rename-symbol               "rename symbol")
;;   ;;       '(tide-jump-to-definition          "jump to definition")
;;   ;;       '(tide-documentation-at-point      "current type documentation")
;;   ;;       '(tide-restart-server              "restart tide server"))
;;   )


;; (def-package! tide
;;   :after typescript-mode
;;   :config
;;   (set! :company-backend 'typescript-mode '(company-tide))
;;   (set! :jump 'typescript-mode
;;     :definition #'tide-jump-to-definition
;;     :references #'tide-references
;;     :documentation #'tide-documentation-at-point)

;;   (setq tide-format-options
;;         '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
;;           :placeOpenBraceOnNewLineForFunctions nil))

;;   (defun +typescript|init-tide ()
;;     (when (or (eq major-mode 'typescript-mode)
;;               (and (eq major-mode 'web-mode)
;;                    buffer-file-name
;;                    (equal (file-name-extension buffer-file-name) "tsx")))
;;       (tide-setup)
;;       (flycheck-mode +1)
;;       (eldoc-mode +1)
;;       (setq tide-project-root (doom-project-root))))
;;   (add-hook! (typescript-mode web-mode) #'+typescript|init-tide))
