#/bin/sh
set -e
cd

# https://github.com/pyenv/pyenv

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

setting() {
    eval $1
    echo $1 >> ~/.bashrc
}
setting 'export PATH=$HOME/.pyenv/bin:$PATH'
setting 'eval "$(pyenv init -)"'
setting 'eval "$(pyenv virtualenv-init -)"'

pyenv install 3.6.1
pyenv global 3.6.1
