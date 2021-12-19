# 
# some memos and tips for vim commands
#

##############################################################################
#### buffer navigation

Ctrl-o - to the previous buffer.
Ctrl-i - to the next buffer

##############################################################################
#### Search in current buffer

* - will search the current word forward
/# - will search the current word backward
/ - will search the user input forward
? - will search the user input backward

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
:nnoremap gS :grep -rE --include=*.java --exclude='*/target/*' '<cword>' .<CR>
# map "gc" to the grep search which has the class/interface definition
:nnoremap gc :grep -rE --include=*.java --exclude='*/target/*' '(class\\|interface) <cword>' .<CR>

# map "gm" to find all method in current java file.
# we need the "\\" here!
:nnoremap gm :vimgrep /public\\|protected\\|private\s\w\s\w(/ %<CR>

# map "gf" to find the file match the current word, exclude the "target" folder.
# we don't need escapt the first "!"
:nnoremap gf :!find . -name <cword>.java \! -path "*/target/*"<CR>

# map "ge" to edit the file name
:nnoremap ge :e **/*<C-R><C-W>

# map "sb" to generate the buffer search pattern:
# the "<C-R><C-W>" is the same with "<cword>" in here.
# The difference is the command such as "grep" will expand "<cword>" to current word.
:nnoremap sb :b <C-R><C-W>

####################
# How to unmap a map.
# unmap will remove the map.
:unmap gf
:unmap gc

##############################################################################
#### vim window management.

# resize the current window
:resize +5

# resize the current window vertically.
:vertical resize +20

##############################################################################
#### fold and expand

zf - create fold, it can be used in virtual mode,
zc - collapse fold
zo - expand fold
