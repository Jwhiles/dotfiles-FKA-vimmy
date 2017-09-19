cd ~/.vim/bundle
echo "installing plugins"

echo "ctrlp"
git clone git@github.com:kien/ctrlp.vim.git ctrlp

echo "nerdtree"
git clone git@github.com:scrooloose/nerdtree.git nerdtree

echo "syntastic"
git clone git@github.com:vim-syntastic/syntastic.git syntastic

echo "vim-airline"
git clone git@github.com:vim-airline/vim-airline.git vim-airline

echo "vim-commentary"
git clone git@github.com:tpope/vim-commentary.git vim-commentary

echo "vim-fugitive"
git clone git@github.com:tpope/vim-fugitive.git vim-fugitive

echo "vim-javascrpt"
git clone git@github.com:pangloss/vim-javascript.git vim-javascript

echo "vim-jsx"
git clone git@github.com:mxw/vim-jsx.git vim-jsx

echo "vim-surround"
git clone git@github.com:tpope/vim-surround.git vim-surround

echo "typescript-vim"
git clone git@github.com:leafgarland/typescript-vim.git typescript-vim


echo "creating symlink to .vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

echo "done and done 👻 "

