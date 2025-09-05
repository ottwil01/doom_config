;;; stack-commands.el --- Custom Stack commands for Haskell projects -*- lexical-binding: t -*-

(defun my/get-executable-from-cabal ()
  "Attempt to find the executable name from the .cabal file in the project root."
  (let ((cabal-file (car (directory-files (projectile-project-root) t "\\.cabal$"))))
    (if cabal-file
        (with-temp-buffer
          (insert-file-contents cabal-file)
          (goto-char (point-min))
          (if (re-search-forward "^executable \\([[:word:]-]+\\)" nil t)
              (match-string 1)
            nil))
      nil)))

(defun my/stack-build-and-exec ()
  "Run stack build followed by stack exec in the project root, prompting for executable if needed."
  (interactive)
  (let* ((default-directory (projectile-project-root))
         (executable (or (my/get-executable-from-cabal)
                         (read-string "Enter executable name: "))))
    (if executable
        (progn
          (async-shell-command (format "stack build && stack exec %s" executable))
          (pop-to-buffer (get-buffer "*Async Shell Command*")))
      (message "No executable found or provided."))))

(map! :leader
      :desc "Run stack build and exec"
      "z" #'my/stack-build-and-exec)

(provide 'stack-commands)
;;; stack-commands.el ends here
