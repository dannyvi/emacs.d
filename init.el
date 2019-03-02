(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 84) ; chars
              (height . 48) ; lines
              (background-color . "honeydew")
              (left . 770)
              (top . 10)))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq custom-safe-themes t)
(load-theme 'light-Q)

(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))

(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(ido-mode 1)
(column-number-mode t)
(show-paren-mode t)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook  #'enable-paredit-mode)
(setq scheme-program-name "scheme")
(global-set-key (kbd "C-a") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)


(define-globalized-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (unless (or (minibufferp)
                (derived-mode-p 'doc-view-mode 'shell-mode 'pdf-view-mode))
      (linum-mode 1)
      (set-face-underline-p 'linum nil) ;;Dont underline linenumbers
      )))
 
(my-global-linum-mode 1)

(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package evil
  :config
  (evil-mode t)
  (evil-define-key 'insert global-map (kbd "C-a") 'evil-first-non-blank)
  (evil-define-key 'insert global-map (kbd "C-e") 'end-of-line)
  (evil-define-key 'insert global-map (kbd "C-k") 'kill-line)
  (evil-define-key 'normal global-map (kbd "C-e") 'evil-end-of-line)
  (evil-define-key 'normal global-map (kbd "TAB") 'indent-for-tab-command)
)

(use-package magit)

(use-package counsel :config (ivy-mode 1))

(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "EEEEEEEEEEEEEEmacs")
  (setq dashboard-items '((recents . 10) (bookmarks . 10)))
  :config  (dashboard-setup-startup-hook)
  (define-key dashboard-mode-map (kbd "<mouse-1>") 'widget-button-press))

(use-package rainbow-delimiters)

(use-package rainbow-blocks)

(use-package racket-mode
  :init (setq racket-racket-program "racket")
  :hook ((racket-mode . paredit-mode)
	 (racket-mode . rainbow-delimiters-mode))
  )

(use-package paredit
  :init (autoload 'enable-paredit-mode
  "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  )

(use-package pdf-tools
  :pin manual ;; manually update
  :init (linum-mode -1)
 :config
 ;; initialise
 (pdf-tools-install)
 ;; open pdfs scaled to fit page
 (setq-default pdf-view-display-size 'fit-page)
 ;; automatically annotate highlights
 (setq pdf-annot-activate-created-annotations t)
 ;; use normal isearch
 (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
 (define-key pdf-view-mode-map
   (kbd "<double-wheel-right>") 'image-forward-hscroll)
 (define-key pdf-view-mode-map
   (kbd "<double-wheel-left>") 'image-backward-hscroll)
 )

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cfb86aa3fb07ac9ed5e55bfd5d82bf591303f236db1294b9210e03ae14d41faf" default)))
 '(package-selected-packages
   (quote
    (pdf-tools paredit-mode racket-mode exec-path-from-shell use-package))))

(setq ansi-color-names-vector
      ["#888888" "#ff6699" "green" "#ffff22"
       "#403ab0" "magenta" "#70e3d0" "#f9f9f9"])
(setq ansi-color-map (ansi-color-make-color-map))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
