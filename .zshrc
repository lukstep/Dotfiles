# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/lukaszs/.oh-my-zsh"
export FZF_BASE=/path/to/fzf/install/dir

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=7

DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
	git
	macos
	virtualenv
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
    docker
)

#Colorls - https://github.com/athityakumar/colorls
source /Library/Ruby/Gems/2.6.0/gems/colorls-1.4.4/lib/tab_complete.sh
alias lc='colorls -lA --sd'

source $ZSH/oh-my-zsh.sh

# Prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)"
  fi
}

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Git aliases
alias gs="git status"
alias gb="git branch"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
