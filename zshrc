# This is a workaround for having a system node and NVM node
PATH="/usr/local/bin:$(getconf PATH)"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

plugins=(aws brew docker git mix node npm osx pip pyenv tmux vi-mode yarn z)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_THEME="spaceship"
export SPACESHIP_VI_MODE_SHOW=true
export KEYTIMEOUT=1

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Add cargo to the PATH
source $HOME/.cargo/env

# Use nvim as the default editor
export EDITOR=nvim

export PATH="/Users/crenwick/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# makes FZF use ripgrep (rg)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export ERL_AFLAGS="-kernel shell_history enabled"
