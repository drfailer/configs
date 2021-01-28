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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy yasnippet-snippets xterm-color which-key wgrep-ag web-mode virtualenvwrapper use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil spaceline-all-the-icons slime-company scss-mode popup-kill-ring paredit ox-twbs ox-reveal org-bullets multiple-cursors modus-vivendi-theme markdown-mode hungry-delete htmlize highlight-indent-guides helm-projectile haskell-mode graphviz-dot-mode gnuplot git-timemachine git-gutter ggtags flycheck-clang-analyzer expand-region dracula-theme doom-themes dashboard counsel company-shell company-jedi company-irony company-c-headers clang-format+ autothemer all-the-icons-ivy all-the-icons-dired))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 7.0)))))
