# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/DevEnv/oh-my-zsh/custom/
ZSH_THEME="powerlevel10k/powerlevel10k"
 export UPDATE_ZSH_DAYS=1
 COMPLETION_WAITING_DOTS="true"
plugins=(git python poetry postgres nvm yarn zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=$HOME/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Settings for Stripe
fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i


# Settings for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

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
export BAT_THEME="gruvbox-dark"

# Settings for python
export PYTHONSTARTUP="$HOME/DevEnv/.pythonrc"

# Settings for git
alias dirt='git diff --name-only --relative | xargs vi'

if [ -f ~/.fzf.zsh ]
then
  source ~/.fzf.zsh
fi

# Aliases for sketchfab
if [ $USER = 'skfb-data' ] && [ $HOST = 'skfb-local' ]
then
  source "$HOME/DevEnv/zshrc_sketchfab"
fi
#
# Aliases for macOS 
if [[ $OSTYPE == darwin* ]]
then
  alias vi=nvim
fi

# Update llvm
LLVM_DIR='$HOME/dev/llvm-project'
function update_llvm () {
  (
    cd $LLVM_DIR
    git pull origin master
  ) && \
    cmake -S $LLVM_DIR/llvm -B $LLVM_DIR/build -G Ninja -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra;lldb' && \
    cmake --build $LLVM_DIR/build
}
if [[ -d $LLVM_DIR ]]
then
  alias ullvm=update_llvm
fi
