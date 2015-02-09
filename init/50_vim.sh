# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/vim

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
