;;; ~/dotfiles/doom-emacs/.doom.d/autoload/kalupa.el -*- lexical-binding: t; -*-

;; stole these dotfile finders from https://github.com/hlissner/doom-emacs-private/blob/master/autoload/hlissner.el
;;;###autoload
(defun find-in-dotfiles ()
  "Open a file somewhere in ~/dotfiles via a fuzzy filename search."
  (interactive)
  (doom-project-find-file (expand-file-name "~/dotfiles")))

;;;###autoload
(defun browse-dotfiles ()
  "Browse the files in ~/dotfiles."
  (interactive)
  (doom-project-browse (expand-file-name "~/dotfiles")))
