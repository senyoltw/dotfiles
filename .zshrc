# update command
if  [ -e ~/.dash ] && [ -e ~/dotfiles ]; then
  alias update-dash-brewfile='brew bundle dump --all -f && diff -u ~/dotfiles/osx ./Brewfile ; mv ./Brewfile ~/dotfiles/osx'
  alias update-dash-dotfiles='git -C ~/dotfiles/ pull'
  alias update-dash='update-dash-dotfiles && ~/.dash/bin/update'
fi

# homebrew
if  [ -e /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# nodebrew
if  [ -e $HOME/.nodebrew/current/bin ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

### 以下zshのデフォルトオプション群

# コマンドがエラーだった場合エラーコードも出力
setopt print_exit_value

# 補完候補表示時にビープ音を鳴らさない
setopt nolistbeep

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
alias his='history -100'
