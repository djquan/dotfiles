alias ll='exa -alh'
alias l='exa -lh'

alias cdc='cd ~/code'

alias gh='git hist'
alias g='git'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git status'
alias gp='git push'
alias gpl='git pull'
alias ga='git add -v'
alias gcmsg='git commit -m'

alias kns='kubens'
alias kctx='kubectx'

alias reliex='iex --name $(whoami)@127.0.0.1 --cookie $(kubectl get secret release -o "go-template={{index .data \"release_cookie\"}}" | base64 -D) '
alias nv='nvim'

if hash batcat 2>/dev/null; then
  alias bat='batcat'
fi

alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vim="nvim"
