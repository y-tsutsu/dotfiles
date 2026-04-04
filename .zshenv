# LANG for Visual Studio Code
export LANG=ja_JP.UTF-8

# pyenv
export PYENV_ROOT=$HOME/.pyenv
command -v pyenv >/dev/null || export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# pipenv
autoload -U compinit
compinit
eval "$(register-python-argcomplete pipenv)"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

# golang
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$PATH

# rust
source "$HOME/.cargo/env"

# gcc color
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Google Test color
export GTEST_COLOR=1
