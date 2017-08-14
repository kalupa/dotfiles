;;; init.el -*- lexical-binding: t; -*-
;; Author:  Paul Kalupnieks <paul@karrupa.com>
;; URL:     https://github.com/hlissner/
;;
;;; License: MIT

(require 'package)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(use-package try
	:ensure t)

(use-package which-key
	:ensure t 
	:config
	(which-key-mode))
