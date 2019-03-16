# LANG for Visual Studio Code
export LANG=ja_JP.UTF-8

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# pipenv
eval "$(pipenv --completion)"

# Elixir
# export PATH=$HOME/.exenv/bin:$PATH
# eval "$(exenv init -)"

# Rust
# source $HOME/.cargo/env

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
# golang
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

# crror
export PATH=$HOME/crror:$PATH

# gcc color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
