;;; gtags
;; http://qiita.com/kota65535/items/39aa4d6e8adf6ab5f98c
;; http://qiita.com/alpha22jp/items/90f7f2ad4f8b1fa089f4
;; https://github.com/Andersbakken/rtags
(package-ensure-install 'rtags)
(when (require 'rtags nil 'noerror)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (rtags-is-indexed)
                (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
                (local-set-key (kbd "M-;") 'rtags-find-symbol)
                (local-set-key (kbd "M-@") 'rtags-find-references)
                (local-set-key (kbd "M-,") 'rtags-location-stack-back)))))

;;; undo-tree
(package-ensure-install 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)
