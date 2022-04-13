"==============================================================================
" How to use this file.
"==============================================================================
" Simply copy this file to home folder:
"  cp .vimrc ~/
"

" turn on syntax.
syntax on
filetype plugin indent on

" set the faviorate color scheme
colorscheme elflord

"==============================================================================
" General editing settings.
"==============================================================================
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

"==============================================================================
" set up vim folding to using manual folding:
" zf - create folding
" zc - collapse folding
" zo - open (expand) folding
" zd - delete folding
"==============================================================================
set foldmethod=manual

"nnoremap \gs :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .
nnoremap \gs :grep -rE --include=*.java --exclude='*/target/*' '<C-R><C-W>' .
"nnoremap gS :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .<CR>
" map "gc" to the grep search which has the class/interface definition
"nnoremap gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .
nnoremap \gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <C-R><C-W>' .
"nnoremap gC :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .<CR>

" run current line as bash
nnoremap \rb :.w !bash<CR>
