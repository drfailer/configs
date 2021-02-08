(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-linum-mode 1)
(global-hl-line-mode 1)
(setq-default auto-fill-function 'do-auto-fill)
(setq-default fill-column 80)

(show-paren-mode 1)

 (setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            (?\~ . ?\~)
                            ))
 (electric-pair-mode t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq spaceline-buffer-encoding-abbrev-p nil)
  (setq spaceline-line-column-p t)
  (setq spaceline-line-p nil)
  (setq spaceline-all-the-icons-separator-type 'arrow)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (powerline-reset))

(use-package spaceline-all-the-icons 
  :ensure t
  :after spaceline
  :config (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu)
  )

(use-package dashboard
:ensure t
:config
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner "~/.emacs.d/dashboard/drfailer_black.png")
(setq dashboard-items '((recents  . 7)
                        (bookmarks . 5)
                        (agenda . 5)
                        (registers . 5)
                        (projects . 5)))
(setq dashboard-banner-logo-title "Welcome home Mr Failer.")
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
)

(unless (member "all-the-icons" (font-family-list))
  (all-the-icons-install-fonts t))

(use-package all-the-icons 
:ensure t
:defer 0.5)
 (use-package all-the-icons-ivy
  :ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

(use-package all-the-icons-dired
  :ensure t)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package undo-tree
 :ensure t
 :config
(progn
   (global-undo-tree-mode)
   (setq undo-tree-visualizer-timestamps t)
   (setq undo-tree-visualizer-diff t)))

(setq kill-ring-max 100) ;; passer la taille du kill-ring à 100 (par défaut 60)
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring)
  :diminish)

(use-package which-key
  :ensure t
  :config (which-key-mode)
  :diminish)

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region)
  :diminish)

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char-timer)
  :diminish)

(use-package ace-window
  :ensure t
  :init (progn (global-set-key [remap other-window] 'ace-window)
	       (custom-set-faces
                '(aw-leading-char-face
                  ((t (:inherit ace-jump-face-foreground :height 7.0))))))
  :diminish)

(use-package wgrep
  :ensure t)

(use-package wgrep-ag
  :ensure t)

(require 'wgrep-ag)

(delete-selection-mode t)

(use-package hungry-delete
  :ensure t
  :config
    (global-hungry-delete-mode)
  :diminish)

(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) )

(setq ispell-local-dictionary-alist- 
      '(("francais" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "fr") nil utf-8)
        ("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
        ))
(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
      ispell-dictionary   "francais")

(defun switch-dictionary-fr-en ()
  "Switch french and english dictionaries."
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new (if (string= dict "francais") "en_US"
                   "francais")))
    (ispell-change-dictionary new)
    (message "Switched dictionary from %s to %s" dict new)))

(global-set-key (kbd "C-c d") 'switch-dictionary-fr-en)

(global-set-key (kbd "C-c f") 'flyspell-check-previous-highlighted-word)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Highlight BUG FIXME TODO NOTE keywords in the source code.
(add-hook 'find-file-hook
          (lambda()
            (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\|NOTE\\):")))

(setq user-full-name "dr failer"
      user-mail-address "drfailer.42@gmail.com")

(setq display-time-24hr-format t)
(setq display-time-format "%H:%M - %d %B %Y")
(display-time-mode 1)

(use-package counsel
:ensure t
:diminish)

(use-package multiple-cursors
 :ensure t
 :bind (:map global-map
       ("C->" . mc/mark-next-like-this)
       ("C-<" . mc/mark-previous-like-this)
       ("C-c C-," . mc/mark-all-like-this)
       ("C-S-<mouse-1>" . mc/add-cursor-on-click)))
(provide 'init-multiple-cursors)

(semantic-mode 1)

(ivy-mode 1)
   (setq ivy-use-virtual-buffers t)
   (global-set-key (kbd "C-c C-r") 'ivy-resume)
   (global-set-key (kbd "<f6>") 'ivy-resume)
;;Plus cool completion approximative dans le buffer
(setq ido-enable-flex-matching t)
(ido-mode 1)

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 3)
  :diminish company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-f") #'company-abort))

(global-set-key (kbd "C-!") 'company-complete)

  (use-package company-irony
    :ensure t
    :config
  (require 'company)
  (add-to-list 'company-backends 'company-irony)
  )

  (use-package irony
    :ensure t
    :config
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package highlight-indent-guides
    :ensure t
    :config 
    )
(setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(use-package yasnippet ;; le moteur
  :ensure t
  :config
    (use-package yasnippet-snippets ;; un pack de snippets
      :ensure t
      :diminish)
    (yas-reload-all)
    (yas-global-mode 1) ;; activé partout
  :diminish)

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.              
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))
(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently          
    (visit-tags-table default-directory nil)))

(use-package clang-format+
  :ensure t)
(load "~/.emacs.d/elpa/clang-format-20191121.1708/clang-format.el")
(add-hook 'c-mode-common-hook #'clang-format+-mode)
(add-hook 'c-mode-common-hook
	  (lambda ()
	   (local-set-key (kbd "C-x <C-tab>") 'clang-format-region)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :diminish)

(add-hook 'prog-mode-hook 'subword-mode)

(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

(use-package flycheck-clang-analyzer
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (require 'flycheck-clang-analyzer)
     (flycheck-clang-analyzer-setup)))

(with-eval-after-load 'company
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode))

(use-package company-c-headers
  :ensure t)

(use-package ggtags
:ensure t
:config 
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
)

(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "M-<right>") 'hs-show-all)
            (local-set-key (kbd "M-<left>")  'hs-hide-all)
            (local-set-key (kbd "M-<up>")    'hs-hide-block)
            (local-set-key (kbd "M-<down>")  'hs-show-block)

            ;;hide/show code-block
            (hs-minor-mode t)))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :init
    (require 'company)
    (slime-setup '(slime-fancy slime-company)))

;; setup paredit
(use-package paredit
  :ensure t
  :init
  (dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook clojure-mode-hook scheme-mode-hook))
    (add-hook hook 'paredit-mode))
  :diminish paredit-mode)

(with-eval-after-load 'company
  (add-hook 'python-mode-hook 'company-mode))

(use-package company-jedi
  :ensure t
  :config
  (require 'company)
  (add-to-list 'company-backends 'company-jedi))

(defun python-mode-company-init ()
  (setq-local company-backends '((company-jedi
				  company-etags
				  company-dabbrev-code))))

(use-package company-jedi
  :ensure t
  :config
  (require 'company)
  (add-hook 'python-mode-hook 'python-mode-company-init))

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))

(setenv "PATH" "/home/user/anaconda3/bin:/home/user/bin:/home/user/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/game")
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(setq python-shell-interpreter "python3")
(setq elpy-rpc-python-command "python3")

(add-hook 'shell-mode-hook 'yas-minor-mode)
(add-hook 'shell-mode-hook 'flycheck-mode)
(add-hook 'shell-mode-hook 'company-mode)

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))

(use-package company-shell
  :ensure t
  :config
    (require 'company)
    (add-hook 'shell-mode-hook 'shell-mode-company-init))

(use-package xterm-color
  :ensure t
  :config
  (setq comint-output-filter-functions
        (remove 'ansi-color-process-output comint-output-filter-functions))

  (add-hook 'shell-mode-hook
            (lambda () (add-hook 'comint-preoutput-filter-functions
                                 'xterm-color-filter nil t))))

(use-package haskell-mode
  :ensure t
  )

(use-package gnuplot
  :ensure t)

(use-package company-web
  :ensure t)

(require 'company)                                   ; load company mode
(require 'company-web-html)                          ; load company mode html backend
;; and/or
(require 'company-web-jade)                          ; load company mode jade backend
(require 'company-web-slim)                          ; load company mode slim backend

(use-package htmlize
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t)

(use-package css-mode
  :ensure t
  :custom (css-indent-offset 2))

(use-package scss-mode
  :ensure t
  :preface
  (defun me/scss-set-comment-style ()
    (setq-local comment-end "")
    (setq-local comment-start "//"))
  :mode ("\\.sass\\'" "\\.scss\\'")
  :hook (scss-mode . me/scss-set-comment-style))

(use-package markdown-mode
  :ensure
  :preface
  (defun my/markdown-set-ongoing-hydra-body ()
    (setq my/ongoing-hydra-body #'hydra-markdown/body))
  :mode
  ("INSTALL\\'"
   "CONTRIBUTORS\\'"
   "LICENSE\\'"
   "README\\'"
   "\\.markdown\\'"
   "\\.md\\'")
  :hook
  (markdown-mode . my/markdown-set-ongoing-hydra-body)
  :custom
  (markdown-asymmetric-header t)
  (markdown-split-window-direction 'right)
  :config
  (unbind-key "M-<down>" markdown-mode-map)
  (unbind-key "M-<up>" markdown-mode-map))

(use-package graphviz-dot-mode
  :ensure t)

(setq org-ditaa-jar-path "/usr/bin/ditaa")

;; Toggling java mode on processing files
(add-to-list 'auto-mode-alist '("\\.pde?\\'" . java-mode))

;; indentation settings
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2)))

(org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa      . t)
     (C          . t)
     (dot        . t)
     (emacs-lisp . t)
     (scheme     . t)
     (gnuplot    . t)
     (haskell    . t)
     (latex      . t)
     (js         . t)
     (ledger     . t)
     (matlab     . t)
     (ocaml      . t)
     (octave     . t)
     (plantuml   . t)
     (python     . t)
     (R          . t)
     (ruby       . t)
     (screen     . nil)
     (scheme     . t)
     (shell      . t)
     (sql        . t)
     (sqlite     . t)))
(setq org-babel-python-command "python3")

(setq org-confirm-babel-evaluate nil)

(use-package org-bullets
    :ensure t
    :config  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
    :diminish)

(setq org-ellipsis " ⬎")
(setq org-cycle-separator-lines -1)

(setq org-src-tab-acts-natively t)

(use-package ox-reveal
:ensure t)

(setq org-reveal-root "http://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-mathjax t)

(use-package ox-twbs
:ensure t)

(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))

'(org-file-apps
 (quote
   ((auto-mode . emacs)
   ("\\.mm\\'" . default)
   ("\\.x?html?\\'" . "/usr/bin/firefox %s")
   ("\\.pdf\\'" . default))))

(setq org-agenda-files (list "~/.emacs.d/org-agenda/tasks.org"))

(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "SUSPENDED" "|" "DONE" "CANCELED")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "#f1fa8c")
	("CANCELED" . (:foreground "#ff5555" :weight bold))
	("SUSPENDED" . (:foreground "#6272a4" :weight bold))))

(add-to-list 'org-latex-packages-alist '("" "listings"))
(setq org-latex-listings 'listings)
(add-to-list 'org-latex-packages-alist '("" "color"))
(setq org-latex-color 'color)
(setq org-latex-listings t
      org-latex-listings-options
      '(("backgroundcolor" "\\color[gray]{0.98}")
	("keywordstyle" "\\color{DarkOrchid}")
	("commentstyle" "\\color{BrickRed}")
	("stringstyle" "\\color{Red}")
	("keepspaces" "true")
	("deletekeywords" "{ps,scan}")
	("basicstyle" "\\ttfamily")
	("numbers" "left")
	)
      org-latex-packages-alist
      '(("usenames,dvipsnames" "color" nil)
	("" "listings" nil)))

(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)
    ))

(setq magit-status-margin
      '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(use-package projectile
    :ensure t
    :init
    (projectile-mode 1)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    :diminish)
  (use-package helm-projectile
    :ensure t
    :config
    (helm-projectile-on))

(use-package hydra 
   :ensure hydra
   :init 
   (global-set-key
   (kbd "C-* t")
	   (defhydra toggle (:color blue)
	     "toggle"
	     ("a" abbrev-mode "abbrev")
	     ("s" flyspell-mode "flyspell")
	     ("d" toggle-debug-on-error "debug")
	     ("c" fci-mode "fCi")
	     ("f" auto-fill-mode "fill")
	     ("t" toggle-truncate-lines "truncate")
	     ("w" whitespace-mode "whitespace")
	     ("q" nil "cancel")))
   (global-set-key
    (kbd "C-x j")
    (defhydra gotoline 
      ( :pre (linum-mode 1)
	     :post (linum-mode -1))
      "goto"
      ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
      ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
      ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
      ("e" (lambda () (interactive)(end-of-buffer)) "end")
      ("c" recenter-top-bottom "recenter")
      ("n" next-line "down")
      ("p" (lambda () (interactive) (forward-line -1))  "up")
      ("g" goto-line "goto-line")
      ))
   )

(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
			    :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indetntation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package helm
  :ensure t
  :bind
  ("C-x C-f" . 'helm-find-files)
  ("C-x C-b" . 'helm-buffers-list)
  ("M-x" . 'helm-M-x)
  :config
  (defun my/helm-hide-minibuffer ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face
                     (let ((bg-color (face-background 'default nil)))
                       `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))
  (add-hook 'helm-minibuffer-set-up-hook 'my/helm-hide-minibuffer)
  (setq helm-autoresize-max-height 0
        helm-autoresize-min-height 40
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-split-window-in-side-p nil
        helm-move-to-line-cycle-in-source nil
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8 
        helm-echo-input-in-header-line t)
  :init
  (helm-mode 1))

(require 'helm-config)    
(helm-autoresize-mode 1)
(define-key helm-find-files-map (kbd "C-b") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "C-f") 'helm-execute-persistent-action)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "<f5>") 'revert-buffer)

(global-unset-key (kbd "C-z"))

(defun mvup() (interactive)
       (previous-line 3)
       )
(global-set-key (kbd "M-p") 'mvup)

(defun mvdown() (interactive)
       (next-line 3)
       )
(global-set-key (kbd "M-n") 'mvdown)

(use-package async
  :ensure t
  :init (dired-async-mode 1)
  :diminish)

(setq vc-handled-backends nil)

;; choice of the backup directory
(defconst my-backup-dir
  (expand-file-name (concat user-emacs-directory "backups")))

(setq make-backup-files t ;; make backup first time a file is saved
      version-control t   ;; number and keep versions of backups
      backup-by-copying t ;; and copy (don't clobber symlinks) them to...
      backup-directory-alist `(("." . ,my-backup-dir)) ;; ...here
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t ;; don't ask about deleting old versions
      vc-make-backup-files 0 ;; don't backup files under version control (git/svn/etc.)
      ;;make-backup-files nil ;;No annoying "~file.txt"
      ;;auto-save-default nil ;;no auto saves to #file#
      auto-save-interval 180 ;; Auto save "file" to "#file#" every xxx (default 300)
      )

;; if no backup directory exists, then create it:
(if (not (file-exists-p my-backup-dir))
    (mkdir my-backup-dir t))

(setq history-delete-duplicates t)

(put 'dired-find-alternate-file 'disabled nil)

(setq-default indent-tabs-mode  nil)

(server-start)

(use-package proced
:commands proced
:config
(setq proced-auto-update-flag t)
(setq proced-auto-update-interval 1)
(setq proced-descend t)
(setq proced-filter 'user))
