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
export BASH_SILENCE_DEPRECATION_WARNING=1

[ -f $HOME/.bashrc ] && . $HOME/.bashrc
