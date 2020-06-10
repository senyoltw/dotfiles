# zinit (zinitがなくても大丈夫なようにifでくくる)
# https://github.com/zdharma/zinit
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

# コマンドがエラーだった場合エラーコードも出力
setopt PRINT_EXIT_VALUE

# history
HISTSIZE=100000
SAVEHIST=1000000
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを他のターミナルと共有
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt inc_append_history    # コマンドが入力されるとすぐに追加

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias sl='ls'
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ll="ls -alGF"
  ;;
linux*)
  alias ll="ls -alF --color"
  ;;
esac
alias grep='grep --color=auto'
alias his='history'
