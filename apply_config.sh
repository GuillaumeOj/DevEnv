#! /bin/bash
DEV_ENV=$HOME/DevEnv
NVIM_DIR=$HOME/.config/nvim
NVIM_PLUGINS_DIR=$HOME/.local/share/nvim/site/autoload
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# === NVIM ===
if [ ! -d $NVIM_DIR ]
then
  mkdir -p $NVIM_DIR
fi

if [ ! -d $NVIM_PLUGINS_DIR/plug.vim ]
then
/bin/bash -c "$(curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"
fi

# === OS SPECIFIC PACKAGES ===
if [[ $OSTYPE == linux* ]]
then
  if [ ! -d $HOME/.pyenv ]
  then
    curl https://pyenv.run | bash
  fi
  if [ ! -d $HOME/.nvm ]
  then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  fi
  sudo apt-get update && sudo apt-get install -y zsh universal-ctags silversearcher-ag
elif [[ $OSTYPE == darwin* ]]
then
  if type brew &> /dev/null
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install zsh pyenv universal-ctags the_silver_searcher nvm
  brew tap homebrew/cask-fonts && brew install font-jetbrains-mono-nerd-font
fi

# === SYMBOLIC LINKS ===
ln -sf $DEV_ENV/vimrc $HOME/.vimrc
ln -sf $DEV_ENV/zshrc $HOME/.zshrc
ln -sf $DEV_ENV/p10k.zsh $HOME/.p10k.zsh
ln -sf $DEV_ENV/init.vim $NVIM_DIR/init.vim

if [ ! -d $HOME/.config/git ]
then
  mkdir -p $HOME/.config/git
fi
ln -sf $DEV_ENV/default_git_ignore $HOME/.config/git/ignore

if [ -s $DEV_ENV/zshrc_sketchfab ]
then
  ln -sf $DEV_ENV/gitconfig-sketchfab $HOME/.config/git/config
else
  ln -sf $DEV_ENV/gitconfig $HOME/.config/git/config
fi

# === PLUGINS AND THEMES FOR ZSH ===
if [ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]
then
  mkdir -p $ZSH_CUSTOM/themes/powerlevl10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi
if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]
then
  mkdir -p $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi
if [ ! -d $ZSH_CUSTOM/plugins/poetry ]
then
  mkdir $ZSH_CUSTOM/plugins/poetry && poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi

# == POETRY ===
if [ ! -d $HOME/.poetry ]
then
  /bin/bash -c "$(cd $HOME && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -)"
fi
