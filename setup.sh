mkdir -p ~/.vim/pack/git-plugins/start && cd ~/.vim/pack/git-plugins/start
echo "installing plugins"

echo "ctrlp"
git clone git@github.com:ctrlpvim/ctrlp.vim.git ctrlp

echo "nerdtree"
git clone git@github.com:scrooloose/nerdtree.git nerdtree

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

echo "elm-vim"
git clone git@github.com:ElmCast/elm-vim.git elm-vim

echo "ack - for searching your project"
git clone git@github.com:mileszs/ack.vim.git ack.vim

echo "fireplace - for doing wild things with clojure"
git clone git@github.com:tpope/vim-fireplace.git vim-fireplace

echo "vim prettier. Because code formatting is important"
git clone git@github.com:prettier/vim-prettier.git vim-prettier

echo "adding purescript syntax highlighting"
git clone https://github.com/raichoo/purescript-vim.git

echo "adding psc ide"
git clone git@github.com:FrigoEU/psc-ide-vim.git

echo "adding ale for asynchronous linting"
git clone https://github.com/w0rp/ale.git

echo "vim tidal"
git clone git@github.com:tidalcycles/vim-tidal.git

echo "vim tmux nav"
git clone git@github.com:christoomey/vim-tmux-navigator.git

echo "typescript stuff"
git clone git@github.com:leafgarland/typescript-vim.git

echo "creating symlink to .vimrc"
ln -s ~/.vim/vimrc ~/.vimrc

echo "adding the appropirate nvim init file"
mkdir -p ~/.config/nvim
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim

echo "creating symlink to .tmux.conf"
ln -s ~/.vim/.tmux.conf ~/.tmux.conf

echo "done and done 👻 "


