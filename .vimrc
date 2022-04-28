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

" providing a list of different options.
nnoremap \gs :grep -rE --include=*.java --exclude-dir={target,classes} '<C-R><C-W>' .
"nnoremap gS :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .<CR>
" map "gc" to the grep search which has the class/interface definition
"nnoremap gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .
nnoremap \gc :grep -rE --include=*.java --exclude-dir={target,classes} '(enum\\|class\\|interface) <C-R><C-W>' .
"nnoremap gC :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .<CR>

" show the easier way to set up include.
" search Java class with multiple file type includes.
nnoremap \gg :grep -rE --include={*.java,pom.xml} --exclude-dir={target,classes} '(enum\\|class\\|interface) <C-R><C-W>' .

" run current line as bash
nnoremap \rb :.w !bash<CR>

" list all methods / members in current Java file
" \\ will be the \!
nnoremap \lm :vimgrep /public\\|private\\|protected / %<CR>
