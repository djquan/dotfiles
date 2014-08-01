c() { cd ~/Dropbox/code/$1; }
_c() { _files -W ~/Dropbox/code -/; }
compdef _c c

alias ghist='git hist'
alias rg='rails generate'
