# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Settings for rustup
export PATH=$HOME/.cargo/env:$PATH

# Settings for bob
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH

# Settings for zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
plugins=(git python postgres nvm yarn zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)
source $ZSH/oh-my-zsh.sh

# Settings for pyenv
PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]
then
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH=$(pyenv root)/shims:$PATH
  eval "$(pyenv init -)"
fi

# Settings for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Settings for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# Settings for Ruby
export PATH=$(which gem):$PATH

# Settings for poetry
POETRY_PATH="$HOME/.poetry"
if [ -d $POETRY_PATH ]
then
  export PATH="$POETRY_PATH/bin:$PATH"
fi

# Settings for python
PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]
then
  eval "$(pyenv init --path)"
fi

# Aliases
alias lo='source $HOME/.zshrc'
alias s='kitty +kitten ssh'

test -f $HOME/.fzf.zsh && source $HOME/.fzf.zsh

# Settings for Perl
PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# Should stay at the end of this file
eval "$(starship init zsh)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# bun completions
[ -s "/Users/guillaume/.bun/_bun" ] && source "/Users/guillaume/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
