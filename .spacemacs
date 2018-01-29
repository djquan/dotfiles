;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     clojure
     docker
     elixir
     (elm :variables
          elm-format-command "elm-format-0.18"
          elm-sort-imports-on-save t
          elm-format-on-save t)
     erlang
     emacs-lisp
     git
     go
     html
     markdown
     racket
     ruby
     (rust :variables
           rust-format-on-save t
           rust-rustfmt-bin "~/.cargo/bin/rustfmt")
     sml
     syntax-checking
     version-control
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-themes '(spacemacs-dark)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Inconsolata"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-guide-key-delay 0.4
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-line-numbers t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   )
  )

(defun dotspacemacs/user-init ()
  (setq vc-follow-symlinks t)
  (setq exec-path-from-shell-arguments '("-l"))
  (setq-default rust-enable-racer t)
  (setq tramp-ssh-controlmaster-options"-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  (global-linum-mode)
  (add-hook 'alchemist-mode-hook 'company-mode)
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*alchemist test report*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (reusable-frames . visible)
                 (side            . right)
                 (window-width   . 0.33)))
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
