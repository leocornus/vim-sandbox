# 
# some memos and tips for vim commands
#

##############################################################################
#### buffer navigation

Ctrl-o - to the previous buffer.
Ctrl-i - to the next buffer

##############################################################################
#### Search in current buffer

* - will search the current word (under the cursor) forward
# - will search the current word backward
/ - will search the user input forward
? - will search the user input backward

# search and replace: "gc" global and confirm
:%s/from string/to string/gc

# to search for visually selected text, we will need create a
# map in visual mode.
:vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
# This post (https://vim.fandom.com/wiki/Search_for_visually_selected_text)
# has a lot more advanced way to serch visually selected text

##############################################################################
#### some tips for the grep.
# some good post to read:
# - https://phoenixnap.com/kb/grep-multiple-strings

# Example to ind a java class and exclude all java files from the target folder.
# There are some generated java source code in the target folder.
:grep -r --include=*.java --exclude="*/target/*" 'class MLotMessage' .

# search bothe class and interface
# using the extended regular expressions, -E
grep -rE --include=*.java --exclude='*/target/*' '(interface\|class)\sLotService' .
grep -rE --include=*.java --exclude='*/target/*' '(interface\|class) LotService' .

# if we put the -l option, the grep search result will NOT be able to
# load the match file from the quickfix list panel (:copen)
:grep -lr --include=*.java --exclude="*/target/*" 'class MLotMessage' .

# find all methods in current file:
:vimgrep /public\|protected\|private\s\w\s\w(/ %

# find all sections parts in an ini file
# buildout config .cfg file is using ini format.
# for example:
# [buildout]
# 
:vimgrep /\[.\+\]/ %

# search a line starts with a whitespace,
# for example search a line starts with at less one whitespace and ServerName:
:vimgrep /^ \+ServerName/ %

# navigate iterate through the search result:
cn - next match
cp - previous match
copen - load the quickfix to show all matches

# Exampl to find a file and exclude a the foler node_modules.
:!find . -name *.md ! -path "*/node_modules/*"

# read the output to current line.
:r!find . -name *.md ! -path "*/node_modules/*"

##############################################################################
#### map 

# map will show current map function, or bookmark
:map

# NOTE: The ending "<CR>" will add the return keyboard at the end.
# Without "<CR>" will hwlp debug the map.

# create map to grep current word.
# we need the double escape "\\" in map!
# this map will hook "gs" to search all java files to find the class and interface defination.
:nnoremap gs :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .
:nnoremap gs :grep -rE --include=*.java --exclude='*/target/*' '<C-R><C-W>' .
:nnoremap gS :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .<CR>
# map "gc" to the grep search which has the class/interface definition
:nnoremap gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .
:nnoremap gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <C-R><C-W>' .
:nnoremap gC :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .<CR>

# map "gm" to find all method in current java file.
# we need the "\\" here!
:nnoremap gm :vimgrep /public\\|protected\\|private\s\w\s\w(/ %<CR>
:nnoremap gm :grep -E '(public\\|protected\\|private) ' %
:nnoremap gM :grep -E '(public\\|protected\\|private) ' %<CR>

# map "gf" to find the file match the current word, exclude the "target" folder.
# we don't need escapt the first "!"
:nnoremap gf :!find . -name <cword>.java \! -path "*/target/*"
:nnoremap gf :!find . -name <C-R><C-W>.java \! -path "*/target/*"
:nnoremap gF :!find . -name <cword>.java \! -path "*/target/*"<CR>

# map "ge" to edit the file name
:nnoremap ge :e **/*<C-R><C-W>

# map "sb" to generate the buffer search pattern:
# the "<C-R><C-W>" is the same with "<cword>" in here.
# The difference is the command such as "grep" will expand "<cword>" to current word.
:nnoremap sb :b <C-R><C-W>

# map "sc" to search current word in current buffer.
:nnoremap sc :vimgrep /<C-R><C-W>/ %

####################
# How to unmap a map.
# unmap will remove the map.
:unmap gf
:unmap gc

##############################################################################
#### work with bash

# execute current line as bash command.
# . will get the current line
:.w !bash
# we could map this to .br
:nnoremap .br :.w !bash<CR>

# read current date time to next line.
# execute the date bash command.
:r!date

##############################################################################
#### vim window management.

# split buffer
:sp
# vertically split buffer
:vsp

# resize the current window
:resize +5

# resize the current window vertically.
:vertical resize +20

##############################################################################
#### fold and expand

zf - create fold, it can be used in virtual mode,
zc - collapse fold
zo - expand fold

##############################################################################
#### session management

# save session.
# maps will b saved when save session.
:mksession ~/.vim/session-name.vim
# override the existing session file.
:mksession! ~/.vim/session-name.vim

# load existing session.
:sourc ~/.vim/session-name.vim
