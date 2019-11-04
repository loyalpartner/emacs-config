;;; my config
(require 'package)

;; (setq debug-on-event t)

(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
 			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(defconst EMACS26+ (> emacs-major-version 25))
(defconst EMACS27+ (> emacs-major-version 26))
(defconst IS-MAC     (eq system-type 'darwin))
(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-BSD     (or IS-MAC (eq system-type 'berkeley-unix)))

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (use-package exec-path-from-shell
    :if (memq window-system '(mac ns))
    :ensure t
    :config
    (exec-path-from-shell-initialize)))


(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

(defconst emacs-root-dir "~/.emacs.d")
(defconst emacs-init-org (expand-file-name
                          (concat emacs-root-dir "/myinit.org")))
(add-subdirs-to-load-path "~/.emacs.d/local")

(org-babel-load-file emacs-init-org)

;; (setq gc-cons-threshold (* 50 1000 1000))
;; (setq gc-cons-threshold (* 2 1000 1000))
