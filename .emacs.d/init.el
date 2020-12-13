(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
