#! /usr/bin/bash
DEV_ENV=$HOME/DevEnv
NVIM_DIR=$HOME/.config/nvim

ln -sf $DEV_ENV/vimrc $HOME/.vimrc
ln -sf $DEV_ENV/zshrc $HOME/.zshrc
ln -sf $DEV_ENV/p10k.zsh $HOME/.p10k.zsh

if [ ! -d NVIM_DIR ]
then
  mkdir -p NVIM_DIR
fi

ln -sf $DEV_ENV/init.vim $NVIM_DIR/init.vim
