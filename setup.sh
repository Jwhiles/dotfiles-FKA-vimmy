echo "adding the appropirate nvim init file"
mkdir -p ~/.config/nvim
ln -s ~/.vim/init.lua ~/.config/nvim/init.lua
ln -s ~/.vim/lua ~/.config/nvim/lua

echo "creating symlink to .tmux.conf"
ln -s ~/.vim/.tmux.conf ~/.tmux.conf

echo "done and done 👻 "


