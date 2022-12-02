export PATH=$HOME/.local/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"

plugins=( 
    git
    zsh-autosuggestions
    zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

bindkey -s ^f "tm-sesh\n"
bindkey -s ^x "session-kilL\n"
alias spot="tmuxinator start music"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.secrets ] && source ~/.secrets

alias ls='exa --git --icons --color=always --group-directories-first'

eval "$(zoxide init zsh)"
alias cd='z'
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

