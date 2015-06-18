;;; tern-lint.el --- JavaScript type-checker using Tern-lint and Flycheck.
;;; -*- lexical-binding: t -*-

;; Author: katspaugh@gmail.com
;; Keywords: tools
;; URL: https://github.com/katspaugh/tern-lint.el
;; Version: 0.0.21
;; Package-Requires: ((emacs "24") (flycheck "*") (tern "*"))

;;; Commentary:

;; 1) Install the tern.lint plugin. See
;; https://github.com/angelozerr/tern-lint.
;; 2) Enable the plugin in your .tern-project.
;; 3) Require this file in your .emacs.d.
;; 4) Run `flycheck-tern-lint-setup' when `tern' loads:

;;   (require 'tern-lint)
;;   (with-eval-after-load 'tern
;;     (flycheck-tern-lint-setup))

;;; Code:

(require 'tern)
(require 'flycheck)

(defun flycheck-tern-lint-parse-error (alist)
  "Parse an error ALIST from Tern-lint into a `flycheck-error'.

Return the corresponding `flycheck-error'."
  (let ((message (cdr (assoc 'message alist)))
        (pos (+ 2 (cdr (assoc 'from alist)))))
    (flycheck-error-new-at
     (line-number-at-pos pos)
     (save-excursion (goto-char pos) (current-column))
     'error
     message)))

(defun flycheck-tern-lint-start (checker callback)
  "Start a Tern-lint check with CHECKER.

CALLBACK is the status callback passed by Flycheck."
  (tern-run-query
   (apply-partially #'flycheck-tern-lint-callback checker callback (current-buffer))
   "lint" (point) :full-file))

(defun flycheck-tern-lint-callback (checker callback buffer data)
  "Pass the Tern lint CHECKER errors to Flycheck's CALLBACK.

BUFFER is the buffer the errors were found in, DATA is the errors list."
  (let ((errors (delq nil (mapcar #'flycheck-tern-lint-parse-error
                                  (cdr (assoc 'messages data))))))
    (dolist (err errors)
      (setf (flycheck-error-filename err) (buffer-file-name))
      (setf (flycheck-error-checker err) checker)
      (setf (flycheck-error-buffer err) buffer))
    (funcall callback 'finished errors)))

(flycheck-define-generic-checker 'tern-lint
  "A type checker for JavaScript using Tern-lint."
  :start #'flycheck-tern-lint-start
  :modes '(js2-mode js-mode tern-mode tj-mode))

;;;###autoload
(defun flycheck-tern-lint-setup ()
  "Enable the tern-lint checker."
  (interactive)
  (add-to-list 'flycheck-checkers 'tern-lint))

(provide 'tern-lint)

;;; tern-lint ends here
