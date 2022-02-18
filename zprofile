PYENV_ROOT="$HOME/.pyenv"
if [ -d $PYENV_ROOT ]
then
  eval "$(pyenv init --path)"
fi
