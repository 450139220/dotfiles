export ZSH="$HOME/.config/zsh"

[[ -f ~/.config/zsh/.p10k.zsh ]] && source ~/.config/zsh/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 设置历史记录保存位置
HISTFILE=~/.config/zsh/.zsh_history
# （可选）设置 zsh-sessions 插件的会话文件路径（如果你在用）
ZSH_SESSION_DIR=~/.config/zsh/.zsh_sessions
ZSH_COMPDUMP="$HOME/.config/zsh/.zcompdump-${HOST}"

# oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# http proxy config
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

# homebrew config
export HOMEBREW_HTTP_PROXY=http://127.0.0.1:7890
export HOMEBREW_HTTPS_PROXY=http://127.0.0.1:7890
eval "$(/opt/homebrew/bin/brew shellenv)"

# open tmux
if command -v tmux >/dev/null 2>&1; then
  [ -z "$TMUX" ] && exec tmux
fi

alias vim="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^I' autosuggest-accept
