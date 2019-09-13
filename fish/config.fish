# Aliases
alias ll='ls -alh'
alias l='ls -lh'

alias gh='git hist'
alias g='git'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git status'
alias gp='git push'
alias gpl='git pull'
alias ga='git add -v'
alias gcmsg='git commit -m'
alias kubeon='kube_ps on'
alias kubeoff='kube_ps off'

alias kns='kubens'
alias kctx='kubectx'

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_prompt
    set -l last_status $status
    if test $last_status -ne 0
        printf "😦 "
    else
        printf "😃 "
    end
    set_color blue
    printf '%s' (prompt_pwd)
    set_color white
    printf '%s' (__fish_git_prompt)

    set_color bryellow
    printf '%s' (__kube_prompt)

    if jobs > /dev/null
        set_color red
        printf " (%s)" (jobs -c | wc -l | tr -d " ")
        set_color white
    end

    set_color green
    printf " > "
end

# sources
source ~/.asdf/asdf.fish

# Env
export EDITOR='vim'
export GOPATH="$HOME/Code/go"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/opt/cmake/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/11/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export skip_global_compinit=1

export ERL_AFLAGS="-kernel shell_history enabled"
