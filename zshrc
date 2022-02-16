# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Settings for zsh
export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git python poetry postgres nvm yarn zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Settings for pyenv
PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]
then
  export $PYENV_ROOT
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# Settings for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Aliases for NVM
function update_nvm () {
  (
  cd $NVM_DIR
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
}
if [ -f $NVM_DIR/nvm.sh ]
then
  alias unvm=update_nvm
fi

# Settings for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# Settings for Ruby
export PATH=$(which gem):$PATH

# Settings for poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Settings for bat
export BAT_THEME="dracula"

# Settings for python
export PYTHONSTARTUP="$HOME/DevEnv/.pythonrc"

# Settings for git
alias dirt='git diff --name-only --relative | xargs vi'

test -f $HOME/.fzf.zsh && source $HOME/.fzf.zsh

# Aliases for sketchfab
ZSHRC_SKETCHFAB=$HOME/DevEnv/zshrc_sketchfab && test -f $ZSHRC_SKETCHFAB && source $ZSHRC_SKETCHFAB

# Aliases for macOS
if [[ $OSTYPE == darwin* ]]
then
  alias vi=nvim
fi

alias lo='source $HOME/.zshrc'
