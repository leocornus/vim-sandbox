# /bin/bash

# copy the .vimrc
cp ../advanced/.vimrc ~/

# install view-pathogen.
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install the AWESOME git wrapper in vim!
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git

# install vim-vue syntax highlighting
cd ~/.vim/bundle
git clone https://github.com/posva/vim-vue.git
