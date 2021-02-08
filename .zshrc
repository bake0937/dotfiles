# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added 環境変数
export LANG=ja_JP.UTF-8

# ----------
#    補完
# ----------
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

## 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 日本語ファイルを扱えるようにする
setopt print_eight_bit

# ----------
#    履歴
# ----------
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

##  直前の重複を記録しない
setopt hist_ignore_dups
### END of 環境設定

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### Added zinit カスタマイズ

## コマンドに色付け
zinit ice wait'!0'; zinit load zsh-users/zsh-syntax-highlighting
## テーマ powerlevel10k を設定
zinit ice depth=1; zinit light romkatv/powerlevel10k
# 補完
zinit light zsh-users/zsh-autosuggestions
# Ctrl+r でコマンド履歴を検索
#zinit light zdharma/history-search-multi-word
# クローンしたGit作業ディレクトリで、コマンド `git open` を実行するとブラウザでGitHubが開く
zinit light paulirish/git-open

### END of zinit カスタマイズ

### powerlevel10k インストール時に追加された
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# anyframeのセットアップ
zinit light mollifier/anyframe
# Ctrl+B
# peco でディレクトリの移動履歴を表示
bindkey '^B' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Ctrl+R
# peco でコマンドの実行履歴を表示
bindkey '^R' anyframe-widget-execute-history

# Ctrl+B
# peco でGitブランチを表示して切替え
#bindkey '^B' anyframe-widget-checkout-git-branch

# Ctrl+G
# GHQでクローンしたGitリポジトリを表示
bindkey '^G' anyframe-widget-cd-ghq-repository
# End anyframe

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
