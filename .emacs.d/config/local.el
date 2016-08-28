;;; テーマ変更
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-theme-directory "~/.emacs.d/themes")
;(load-theme 'my-misterioso t)
;(enable-theme 'my-misterioso)

;;; 選択行をグレーで表示
(custom-set-faces
'(hl-line ((t (:background "gray50"))))
'(header-line ((t (:background "#191970"))))
)

;;; 色変更
(eval-after-load 'magit
  '(progn
     ;; cursorが載っていない状態でのaddedのface
     (set-face-foreground 'magit-diff-added "#40ff40")
     (set-face-background 'magit-diff-added "gray20")
     ;; cursorが載っている状態のaddedのface
     (set-face-foreground 'magit-diff-added-highlight "#40ff40")
     (set-face-background 'magit-diff-added-highlight "gray20")
     ;; cursor載っていない状態のremoved
     (set-face-foreground 'magit-diff-removed "#d54e53")
     (set-face-background 'magit-diff-removed "gray20")
     ;; cursor載っている状態のremoved
     (set-face-foreground 'magit-diff-removed-highlight "#d54e53")
     (set-face-background 'magit-diff-removed-highlight "gray20")
     ;; lineを選択してstageしようとするときのface
     (set-face-background 'magit-diff-lines-boundary "blue")))

;;; スクロールを一行ずつにする
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;; 警告外し
;; shut up, emacs!
(setq display-warning-minimum-level :error)
