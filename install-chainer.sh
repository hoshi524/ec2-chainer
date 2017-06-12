#/bin/sh
set -e
cd

# https://github.com/pfnet/chainer

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-*_amd64.deb
sudo apt update
sudo apt -y install cuda

echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
. ~/.bashrc

pip install -U setuptools
pip install cupy
pip install chainer
pip install matplotlib

git clone https://github.com/pfnet/chainer.git
