export PATH=$HOME/dotfiles/bin:$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

export EDITOR=nvim
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

ZSH_THEME="amuse"
export UPDATE_ZSH_DAYS=7
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  fzf
  docker
  github
  rust
  safe-paste
  zsh-syntax-highlighting
  zsh-completions
  gh
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# ** User configuration **

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Shorter history
export SAVEHIST=1000
export HISTSIZE=$SAVEHIST


# Python & Django
alias dj='python manage.py'
alias p=python
alias pp=ipython


# Direnv integration
eval "$(direnv hook zsh)"


# Integration with fzf
# Respect .gitignore using rg
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob '!.git''


# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Neovim
export NVIM_PYTHON_HOST=$PYENV_ROOT/versions/neovim/bin/python


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# Rust
export PATH="$HOME/.rustup:$HOME/.cargo/bin:$PATH"


# Utils
# Check memory usage
alias psmem="ps aux  | awk '{print \$6/1024 \" MB\\t\\t\" \$11}'  | sort -n"
alias cat=bat
alias ts=tree-sitter
alias up='sudo dnf up --refresh -y'
alias clear-meta='exiftool -overwrite_original -ALL= '

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Kitty
alias icat="kitty +kitten icat"
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin


# SSH
# Make ssh compatible with kitty
alias ssh="TERM=xterm-256color ssh"
# ssh-agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
