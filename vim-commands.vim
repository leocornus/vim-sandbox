# 
# some memos and tips for vim commands
#

##############################################################################
#### buffer navigation
#

Ctrl-o to the previous buffer.
Ctrl-i to the next buffer

##############################################################################
#### some tips for the grep.
#

# Example to ind a java class and exclude all java files from the target folder.
# There are some generated java source code in the target folder.
:grep -r --include=*.java --exclude="*/target/*" 'class MLotMessage' .

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
#### vim window management.
#

# resize the current window
:resize +5

# resize the current window vertically.
:vertical resize +20

##############################################################################
#### fold and expand

zf - create fold, it can be used in virtual mode,
zc - collapse fold
zo - expand fold
