# dotfiles
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim\
cd $HOME
git clone https://github.com/nirlevi/dotfiles.git .dotfiles
ln -s .dotfiles/.??* -t .
vim +PluginInstall +qall

