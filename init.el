(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 80) ; chars
              (height . 48) ; lines
              (background-color . "honeydew")
              (left . 780)
              (top . 10)))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(ido-mode 1)
(global-linum-mode t)
(column-number-mode t)
(show-paren-mode t)
(set-face-underline-p 'linum nil) ;;Dont underline linenumbers
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook  #'enable-paredit-mode)
(setq scheme-program-name "scheme")
(global-set-key (kbd "C-a") 'beginning-of-line)
(global-set-key (kbd "C-e") 'end-of-line)


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

(use-package magit
  :custom-face
  (magit-branch-local ((t (:foreground "#fa88ca"))))
  (magit-branch-remote ((t (:foreground "#89ca88"))))
  (magit-process-ng ((t (:inherit magit-section-heading :foreground "#f090c0"))))
  (magit-process-ok ((t (:inherit magit-section-heading :foreground "#72e090"))))
  (magit-section-heading ((t (:foreground "#f0d270" :weight bold))))
  (magit-section-highlight ((t (:background "#f9f9f9"))))
  )

(use-package counsel
  :config (ivy-mode 1)
  :custom-face
  (ivy-current-match ((t (:background "#8a99d7" :foreground "white"))))
  (ivy-cursor ((t (:background "#caeade" :foreground "white"))))
  (ivy-minibuffer-match-face-2 ((t (:background "#f9ccda" :foreground "#8a8aba"))))
  )
;(require 'dashboard)
;(dashboard-setup-startup-hook)
(use-package dashboard
  :init
  (setq dashboard-banner-logo-title "EEEEEEEEEEEEEEmacs")
  (setq dashboard-items '((recents . 10) (bookmarks . 10)))
  :config  (dashboard-setup-startup-hook)
  (define-key dashboard-mode-map (kbd "<mouse-1>") 'widget-button-press))
;;  :config
;;  (dashboard-setup-startup-hook)
;;  :bind (:map dashboard-mode-map ("<mouse-1>" . widget-button-press))
;;  )

(use-package rainbow-delimiters
  :custom-face
  (rainbow-delimiters-depth-1-face ((t (:foreground "#eeeef8"))))
  (rainbow-delimiters-depth-2-face ((t (:foreground "#e3e3f2"))))
  (rainbow-delimiters-depth-3-face ((t (:foreground "#dedee8"))))
  (rainbow-delimiters-depth-4-face ((t (:foreground "#d8d8e0"))))
  (rainbow-delimiters-depth-5-face ((t (:foreground "#d0d0d8"))))
  (rainbow-delimiters-depth-6-face ((t (:foreground "#c8c8d0"))))
  (rainbow-delimiters-depth-7-face ((t (:foreground "#c0c0c9"))))
  (rainbow-delimiters-depth-8-face ((t (:foreground "#b8b8c0"))))
  (rainbow-delimiters-depth-9-face ((t (:foreground "#a8a8b0"))))
  (rainbow-delimiters-unmatched-face ((t (:foreground "#f4fff8" :background "#ff9999"))))
  )

(use-package rainbow-blocks
  )

(use-package racket-mode
  :init (setq racket-racket-program "racket")
  :hook ((racket-mode . paredit-mode)
	 (racket-mode . rainbow-delimiters-mode))
  :custom-face
  (racket-selfeval-face ((t (:foreground "#cfa9d6"))))
  )

(use-package paredit
  :init (autoload 'enable-paredit-mode
  "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paredit-mode racket-mode exec-path-from-shell use-package))))

(setq ansi-color-names-vector
      ["#888888" "#ff6699" "green" "#ffff22" "#403ab0" "magenta" "#70e3d0" "#f9f9f9"])
(setq ansi-color-map (ansi-color-make-color-map))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#a3a3a3" :background "#fcfcfc" :height 120 :family "Menlo"))))
 '(bold ((t (:foreground "#faaaaf"))))
 '(cursor ((t (:background "#aceab9"))))
 '(error ((t (:foreground "#f95a7a"))))
 '(font-lock-builtin-face ((t (:foreground "#e0c293"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#cfcfcf"))))
 '(font-lock-comment-face ((t (:foreground "#d8d8d8"))))
 '(font-lock-constant-face ((t (:foreground "#c8a3e0"))))
 '(font-lock-doc-face ((t (:foreground "#afd4d4"))))
 '(font-lock-function-name-face ((t (:foreground "#efcf9f"))))
 '(font-lock-keyword-face ((t (:foreground "#fc9faf"))))
 '(font-lock-negation-char-face ((t (:foreground "#d89999"))))
 '(font-lock-preprocessor-face ((t (:foreground "#bf3fbf"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#f99999"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#aaa999"))))
 '(font-lock-string-face ((t (:foreground "#7fbf8f"))))
 '(font-lock-type-face ((t (:foreground "#99a3e9"))))
 '(font-lock-variable-name-face ((t (:foreground "#afd4d4")))) ;"#80caca"
 '(font-lock-warning-face ((t (:foreground "#dd9999"))))
 '(fringe ((nil (:foreground "#aabbcc" :background "#fafafa"))))
 '(header-line-highlight ((t (:inherit nil :background "#fabbaa" :foreground "#aaaaaa"))))
 '(highlight ((t (:background "#ffdddd"))))
 '(ido-only-match ((t (:foreground "#60b770"))))
 '(ido-subdir ((t (:foreground "#ff8080"))))
 '(isearch ((t (:background "#ddaaee" :foreground "#ffffaa"))))
 '(ivy-current-match ((t (:background "#8a99d7" :foreground "white"))))
 '(ivy-cursor ((t (:background "#caeade" :foreground "white"))))
 '(ivy-minibuffer-match-face-2 ((t (:background "#f9ccda" :foreground "#8a8aba"))))
 '(link ((t (:underline "#dadafa" :foreground "#99a9da"))))
 '(linum ((t (:foreground "#e8e8e8" :background "#fafafa"))))
 '(magit-branch-local ((t (:foreground "#fa88ca"))))
 '(magit-branch-remote ((t (:foreground "#89ca88"))))
 '(magit-process-ng ((t (:inherit magit-section-heading :foreground "#f090c0"))))
 '(magit-process-ok ((t (:inherit magit-section-heading :foreground "#72e090"))))
 '(magit-section-heading ((t (:foreground "#f0d270" :weight bold))))
 '(magit-section-highlight ((t (:background "#f9f9f9"))))
 '(minibuffer-prompt ((t ((:foreground "#fcb2b5")))))
 '(mode-line ((t (:background "#faf7f7" :foreground "#d0d0d0"))))
 '(mode-line-buffer-id ((t (:background nil :foreground "#90a0e0"))))
 '(mode-line-highlight ((t (:background nil :foreground "#f0c0c0"))))
 '(mode-line-inactive ((t (:background "#f3f0f0" :foreground "#e0e0e0"))))
 '(racket-selfeval-face ((t (:foreground "#cfa9d6"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#eeeef8"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#e3e3f2"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#dedee8"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#d8d8e0"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#d0d0d8"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#c8c8d0"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#c0c0c9"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#b8b8c0"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#a8a8b0"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "#f4fff8" :background "#ff9999"))))
 '(region ((t (:foreground "#f2a3a9" :background "#f2fbf7" :distant-foreground nil))))
 '(show-paren-match ((t (:foreground "#f9fff9" :background "#c9cfe9"))))
 '(show-paren-mismatch ((t (:background "#aabbea" :foreground "white"))))
 '(vertical-border ((t (:foreground "#f8f8f8")))))
