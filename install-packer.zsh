#!/usr/bin/env zsh

TARGET_PATH=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
PACKER_URL=https://github.com/wbthomason/packer.nvim

if [ ! -d ${TARGET_PATH} ] 
then
    git clone --depth 1 $PACKER_URL $TARGET_PATH
    echo packer install success
else
    echo packer installed
fi
