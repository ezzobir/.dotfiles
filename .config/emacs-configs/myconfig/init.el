
;; Set default font to Iosevka
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil
                    :family "Iosevka"
                    :height 140
                    :weight 'normal
                    :width 'normal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up package.el to work with MELPA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To Make Your Folder Config Clean
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist
      `(("." . "~/my_files/.dotfiles/.config/emacs-configs/myconfig//backups")))

; (setq auto-save-file-name-transforms
;       `((".*" "~/my_files/.dotfiles/.config/emacs-configs/myconfig/auto-save-list/" t)))

(setq custom-file "~/my_files/.dotfiles/.config/emacs-configs/myconfig/emacs-custom.el")
(load custom-file t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; For Completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Gruvbox Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install the gruvbox-theme if it's not already installed
(unless (package-installed-p 'gruvbox-theme)
  (package-refresh-contents)
  (package-install 'gruvbox-theme))

;; Load the Gruvbox Dark Hard theme
(load-theme 'gruvbox-dark-hard t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; UI Costomization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bar
(scroll-bar-mode -1)

;; Disable the tooltips
(tooltip-mode -1)

;; Disable the blinking cursor
(blink-cursor-mode -1)

;; hl-line
(global-hl-line-mode 1)

;; disable welcome screen
(setq inhibit-startup-message t)

;; delete comment lines from scratch buffer
(setq initial-scratch-message nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Relative Line Numbers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable line numbers globally
(global-display-line-numbers-mode)

;; Set line numbers to be relative
(setq display-line-numbers-type 'relative)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Keybinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; which-key package setup
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

;; general package setup
(use-package general
  :ensure t
  :config
  ;; Define prefix key for leader in Evil mode normal and visual states only
  (general-create-definer my/leader-keys
    :states '(normal visual)  ; Only in normal and visual states
    :prefix "SPC")

  ;; Define file management keybindings
  (my/leader-keys
    "f"  '(:ignore t :which-key "file")
    "ff" '(find-file :which-key "find file")
    "fs" '(save-buffer :which-key "save file")
    "fe" '(:ignore t :which-key "emacs")
    "fei" '(open-my-init-file :which-key "open my init.el")
    "fer" '(reload-my-init-file :which-key "reload my init.el")
    "fr" '(recentf-open-files :which-key "recent files"))

  ;; Define buffer management keybindings
  (my/leader-keys
    "b"  '(:ignore t :which-key "buffer")
    "bd" '(kill-this-buffer :which-key "delete buffer")
    "bb" '(switch-to-buffer :which-key "list buffers")
    "bn" '(next-buffer :which-key "next buffer")
    "bp" '(previous-buffer :which-key "previous buffer")
    "bM" '(delete-other-buffers :which-key "delete other buffers"))

  ;; Define window management keybindings
  (my/leader-keys
    "w"  '(:ignore t :which-key "window")
    "wv" '(split-window-right :which-key "split right")
    "wb" '(split-window-below :which-key "split below")
    "wl" '(windmove-right :which-key "move right")
    "wh" '(windmove-left :which-key "move left")
    "wj" '(windmove-down :which-key "move down")
    "wk" '(windmove-up :which-key "move up")
    "wd" '(delete-window :which-key "delete window")
    "wM" '(delete-other-windows :which-key "delete other windows")))

;; Ensure windmove commands are available
(windmove-default-keybindings)

;; Function to open the specific init.el file
(defun open-my-init-file ()
  "Open the user's custom init file."
  (interactive)
  (find-file "/home/ezzobir/my_files/.dotfiles/.config/emacs-configs/myconfig/init.el"))

;; Function to reload custom init.el
(defun reload-my-init-file ()
  "Reload the user's init file."
  (interactive)
  (load-file "/home/ezzobir/my_files/.dotfiles/.config/emacs-configs/myconfig/init.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my/latex-mode-hook ()
  (advice-add #'TeX-command-master :before (lambda (&rest r) (save-buffer)))
  (push (list 'output-pdf "Zathura") TeX-view-program-selection))

(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . my/latex-mode-hook)
  :bind (:map LaTeX-mode-map
	      ("C-c b" . my/vertico-bibtex))
  )

(defun my/bibtex-generate-autokey (&rest r)
    (let* ((names (bibtex-autokey-get-names))
	   (year (bibtex-autokey-get-year))
	   (title (bibtex-autokey-get-title)))
      (capitalize (format "%s%s" names year))))
(advice-add #'bibtex-generate-autokey :around #'my/bibtex-generate-autokey)

(defun my/vertico-bibtex--get-field (key candidate)
  "return the field matching KEY in CANDIDATE"
  (alist-get key (cdr candidate) nil nil #'string=))

(defun vertico-bibtex--maybe-truncate (field len)
  (if field
      (substring field 0 (min len (length field)))
    field))

(defun my/vertico-bibtex--build-map (candidates)
  (mapcar
   (lambda (cand)
     (let* ((key (my/vertico-bibtex--get-field "=key=" cand))
	    (title (vertico-bibtex--maybe-truncate
		    (my/vertico-bibtex--get-field "title" cand)
		    35))
	    (author (vertico-bibtex--maybe-truncate
		     (aif (my/vertico-bibtex--get-field "author" cand)
			  (string-replace " and " ", " it) it)
		     40))
	    (book (my/vertico-bibtex--get-field "booktitle" cand))
	    (journal (my/vertico-bibtex--get-field "journal" cand)))
       `(,key . (:title ,title :author ,author :journal ,(or journal book)))))
   candidates))

(defun my/vertico-bibtex (&optional arg)
  "insert a bibtex citation at point using `completing-read`. if
ARG is non-nil, refresh the bibtex-completion cache"
  (interactive "P")
  (when arg
    (bibtex-completion-clear-cache))
  (bibtex-completion-init)
  (let* ((candidates (bibtex-completion-candidates))
	 (map (my/vertico-bibtex--build-map candidates))
	 (keys (mapcar #'car map))
	 (completion-extra-properties
	  (list
	   :annotation-function
	   (lambda (key)
	     (let ((obj (alist-get key map nil nil #'string=)))
	       (marginalia--fields
		((plist-get obj :title) :width 35 :truncate 0.5 :face 'marginalia-string)
		((plist-get obj :author) :width 40 :truncate 0.5 :face 'marginalia-documentation)
		((plist-get obj :journal) :width 30 :truncate 0.5 :face 'marginalia-value))))))
	 (selection (completing-read "Insert citation: " keys)))
    (when selection
      (insert selection))))

;; this shouldn't be needed but not working for some reason
(use-package biblio-core
  :ensure t)

(use-package biblio
  :ensure t)

(use-package bibtex-completion
  :ensure t
  :config
  (setq bibtex-completion-bibliography "~/my_files/research/library/refs.bib"
	bibtex-completion-library-path "~/my_files/research/library"
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "zathura" nil 0 nil fpath))
	bibtex-completion-additional-search-fields '(journal booktitle)))

(defmacro aif (cnd then else)
  "anaphoric if from paul graham's on lisp. bind the result of CND
to IT for use in the THEN and ELSE clauses"
  `(let ((it ,cnd))
     (if it ,then ,else))) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Rust
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rust-ts-mode
  :ensure t
  :mode("\\.rs\\'")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

