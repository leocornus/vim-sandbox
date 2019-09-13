"==============================================================================
" How to use this file.
"==============================================================================
" Simply copy this file to home folder:
"  cp .vimrc ~/
"

"==============================================================================
" How to install vim-pathogen:
"==============================================================================
" Just one command line:
" $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" > curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"
" Now we could load pathogen to manage other bundles.
"
execute pathogen#infect()

syntax on
filetype plugin indent on

" set the faviorate color scheme
colorscheme elflord

"==============================================================================
" Install the AWESOME git wrapper in vim!
"==============================================================================
" It is so easy to install the vim-fugigive:
"
" $ cd ~/.vim/bundle
" $ git clone https://github.com/tpope/vim-fugitive.git
"
" Now you could use Git in any file.

"==============================================================================
" General editing settings.
"==============================================================================
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

"==============================================================================
" use JavaScript for Vue template.
"==============================================================================
autocmd BufNewFile,BufRead *.vue set syntax=html

"==============================================================================
" vim-vue
"==============================================================================
" install vim-vue syntax highlighting
" cd ~/.vim/bundle && \
" git clone https://github.com/posva/vim-vue.git

"=================================
"vim-pug
"=================================
" install vim-pug syntax highlighting
" cd ~/.vim/bundle
" git clone git://github.com/digitaltoad/vim-pug.git
