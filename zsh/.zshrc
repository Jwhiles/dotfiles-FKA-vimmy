export PATH=$HOME/.local/scripts:$PATH
export ZSH="$HOME/.oh-my-zsh"

plugins=( 
    git
    zsh-autosuggestions
    zsh-fzf-history-search
    jj
)

source $ZSH/oh-my-zsh.sh

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Do I actually need starship?
eval "$(starship init zsh)"

# Setup NVM (should move into home since we don't use it at work
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Init Zoxide - Do I actually want / need this?
eval "$(zoxide init zsh)"

# Add stuff to PATH. The incantation must be read
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="~/.local/bin:$PATH"


[ -f ~/.zsh/aliases ] && source ~/.zsh/aliases
[ -f ~/.zsh/keys ] && source ~/.zsh/keys
[ -f ~/.work-zsh ] && source ~/.work-zsh
[ -f ~/.home-zsh ] && source ~/.home-zsh
