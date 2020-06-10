# zinit
if  [ -e ~/.zinit/bin/zinit.zsh ]; then
  source ~/.zinit/bin/zinit.zsh

  #コマンド補完
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-completions

  # シンタックスハイライト
  zinit light zdharma/fast-syntax-highlighting

  autoload -Uz compinit
  compinit
fi

# history
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt share_history         # コマンド履歴ファイルを共有
setopt hist_no_store         # historyコマンドは履歴に登録しない

# alias
alias ll='ls -l'
alias history='history 1'
