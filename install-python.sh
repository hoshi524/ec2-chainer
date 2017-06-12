#/bin/sh
set -e
cd

sudo apt-get update
sudo apt-get -y install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev

# https://github.com/pyenv/pyenv

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

setting() {
    eval $1
    echo $1 >> ~/.bashrc
}

setting 'export PATH=$HOME/.pyenv/bin:$PATH'
setting 'eval "$(pyenv init -)"'
setting 'eval "$(pyenv virtualenv-init -)"'

pyenv install anaconda3-4.4.0
pyenv global anaconda3-4.4.0
