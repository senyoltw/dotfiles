# zinit (zinitがなくても大丈夫なようにifでくくる)
if  [ -e ~/.zinit/bin/zinit.zsh ]; then
  source ~/.zinit/bin/zinit.zsh

  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit

  # シンタックスハイライト
  zinit light zdharma/fast-syntax-highlighting

  # Ctrl+r でコマンド履歴を検索
  zinit load zdharma/history-search-multi-word

  #コマンド自動補完
  zinit light zsh-users/zsh-autosuggestions
  zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
  zsh-users/zsh-completions
fi

# history
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを他のターミナルと共有
setopt hist_no_store         # historyコマンドは履歴に登録しない

# alias
alias ll='ls -l'
alias sl='ls'
alias grep='grep --color=auto'
alias history='history 1'
alias his='history'
