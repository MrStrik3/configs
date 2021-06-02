#!/usr/bin/zsh
#
# Neovim's installation
yay -S neovim-git
git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
stow nvim




echo "=====> Don't forget to run ':PackUpdate' in neovim!!!"
