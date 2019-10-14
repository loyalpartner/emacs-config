;;; my config
(require 'package)

;; (setq debug-on-event t)

(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(defconst emacs-root-dir "~/emacs-config")
(add-subdirs-to-load-path "~/emacs-config/local")
(org-babel-load-file (expand-file-name
		      (concat
		       emacs-root-dir "/myinit.org")))

;; (setq gc-cons-threshold (* 50 1000 1000))
;; (setq gc-cons-threshold (* 2 1000 1000))
