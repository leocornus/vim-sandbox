# 
# some memos and tips for vim commands
#

#########
# some tips for the grep.
#

# Example to ind a java class and exclude all java files from the target folder.
# There are some generated java source code in the target folder.
:grep -r --include=*.java --exclude="*/target/*" 'class MLotMessage' .

# if we put the -l option, the grep search result will NOT be able to
# load the match file from the quickfix list panel (:copen)
:grep -lr --include=*.java --exclude="*/target/*" 'class MLotMessage' .

# Exampl to find a file and exclude a the foler node_modules.
:!find . -name *.md ! -path "*/node_modules/*"
