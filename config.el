(setq user-full-name "William Otto"
      user-mail-address "ottwil01@gmail.com")

(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq default-frame-alist '((fullscreen . maximized)))

(setq fancy-splash-image "~/.config/doom/Emacs_Splash.png")

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

(setq
 mu4e-maildir "~/mail/gmail"
 mu4e-get-mail-command "mbsync -a"
 mu4e-update-interval nil
 mu4e-drafts-folder "/[Gmail].Drafts"
 mu4e-sent-folder "/[Gmail].Sent Mail"
 mu4e-trash-folder "/[Gmail].Trash"
 message-send-mail-function 'msmtp-send-it)

;; (add-to-list 'load-path (expand-file-name "~/.config/doom/zone"))
;; (require 'zone-matrix)
;; (require 'zone-matrix-settings)
;; (require 'zone-settings)

;; (setq zone-programs [zone-matrix])
;; (zone-when-idle 60)

(setq haskell-ghc-config-notify-if-nix-on-path nil)
(load! "custom/stack-commands")
(setenv "PATH" (concat (getenv "PATH") ":/Users/will/.local/bin:/Users/will/.ghcup/bin"))
(after! lsp-haskell
  (setq lsp-haskell-server-path "/Users/will/.ghcup/bin/haskell-language-server-wrapper")
  (setq lsp-haskell-server-args '("--lsp" "-d" "-l" "/Users/will/.cache/lsp-haskell.log"))
  (setq lsp-log-io t))
(after! haskell-mode
  (setq haskell-process-auto-start-on-load nil)
  (setq haskell-completion-backend 'lsp))

(setq mouse-yank-at-point t)
(define-key minibuffer-local-map [mouse-1] nil)
(define-key minibuffer-local-map [mouse-2] nil)
(define-key minibuffer-local-map [mouse-3] nil)
