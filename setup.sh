echo "adding the appropirate nvim init file"
mkdir -p ~/.config/nvim
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim

echo "creating symlink to .tmux.conf"
ln -s ~/.vim/.tmux.conf ~/.tmux.conf

echo "done and done 👻 "


