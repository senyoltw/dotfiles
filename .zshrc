# zinit (zinitがなくてもエラー出ないようにifでくくる)
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

# 画面出力
# 合成文字を正しく表示
if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
    setopt COMBINING_CHARS
fi

# 補完のときに小文字でも大文字の候補を補完
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# history
HISTSIZE=1000                # zshターミナルメモリ上で記憶しておく件数
SAVEHIST=10000               # zsh_history上で記憶しておく件数
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt extended_history      # タイムスタンプを追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
# share_history と inc_append_history は排他関係
# setopt share_history         # コマンド履歴を他のターミナルのメモリと共有
setopt inc_append_history    # コマンドが入力されるとすぐにzsh_historyに追加

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

# update command
alias update-dotfiles='git -C ~/dotfiles/ pull ; zinit self-update'
alias update-dash='~/.dash/bin/update'
alias update-all='dotfiles-update && dash-update'
