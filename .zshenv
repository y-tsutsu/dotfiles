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

# crror
export PATH=$HOME/crror:$PATH
export GOPATH=$HOME/golang

# gcc color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
