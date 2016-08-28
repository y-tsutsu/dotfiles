;;; rtags
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

;;; nlinum
(package-ensure-install 'nlinum)
;; バッファの左側に行番号を表示する
(global-nlinum-mode t)
;; 5 桁分の表示領域を確保する
(setq nlinum-format "%5d ")

;;; jedi
(el-get 'sync '(jedi))
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
