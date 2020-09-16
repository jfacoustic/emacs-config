(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages
   (quote
    (evil-magit linum-relative evil-mc multiple-cursors neotree magit exec-path-from-shell cider rainbow-delimiters geiser helm slime evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(setq exec-path
      (append exec-path '("/Users/joshuamathews/.bin/lein")))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(setq geiser-mit-binary "/usr/local/bin/scheme")

(setq geiser-active-implementations '(mit))

(require 'rainbow-delimiters)

(mapcar (lambda (hook)
	  (message "Adding rainbow delimiters mode to: %s" hook)
	  (add-hook hook #'rainbow-delimiters-mode))
	(list #'scheme-mode-hook #'emacs-lisp-mode-hook #'lisp-mode-hook #'clojure-mode-hook))

(exec-path-from-shell-initialize)
(set-frame-parameter nil 'fullscreen 'fullboth)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'neotree)
(global-set-key (kbd "C-c t") 'neotree-toggle)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(require 'linum-relative)
(linum-on)
(linum-relative-mode)

(require 'evil-magit)
