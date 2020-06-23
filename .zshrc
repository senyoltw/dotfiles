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

  # 補完のときに小文字でも大文字の候補を補完
  zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

  # update dotfiles
  alias update-zinit='zinit self-update && zinit update'
fi

# update command
if  [ -e ~/.dash ] && [ -e ~/dotfiles ]; then
  alias update-brewfile='brew bundle dump && mv ./Brewfile ~/dotfiles/osx'
  alias update-dotfiles='git -C ~/dotfiles/ pull'
  alias update-dash='~/.dash/bin/update'
  alias update-all='update-dotfiles && update-zinit && update-dash'
fi

# Google Cloud SDK
if  [ -e /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]; then
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# コマンドがエラーだった場合エラーコードも出力
setopt print_exit_value

# 画面出力
# 合成文字を正しく表示
if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
    setopt combining_chars
fi

# history
HISTSIZE=1000                # zshターミナルメモリ上で記憶しておく件数
SAVEHIST=10000               # zsh_history上で記憶しておく件数
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt extended_history      # タイムスタンプを追加
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
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
