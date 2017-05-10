#/bin/sh
set -e
cd

# https://aws.amazon.com/jp/premiumsupport/knowledge-center/connect-to-linux-desktop-from-windows/
# https://github.com/neutrinolabs/xrdp/wiki/Building-on-Debian-8

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git autoconf libtool pkg-config gcc g++ make  libssl-dev libpam0g-dev libjpeg-dev libx11-dev libxfixes-dev libxrandr-dev  flex bison libxml2-dev intltool xsltproc xutils-dev python-libxml2 g++ xutils libfuse-dev libmp3lame-dev nasm libpixman-1-dev xserver-xorg-dev xfce4 xfce4-goodies


BD=`pwd`
mkdir -p "${BD}"/git/neutrinolabs
cd "${BD}"/git/neutrinolabs
wget https://github.com/neutrinolabs/xrdp/releases/download/v0.9.1/xrdp-0.9.1.tar.gz
wget https://github.com/neutrinolabs/xorgxrdp/releases/download/v0.2.0/xorgxrdp-0.2.0.tar.gz

cd "${BD}"/git/neutrinolabs
tar xvfz xrdp-0.9.1.tar.gz
cd "${BD}"/git/neutrinolabs/xrdp-0.9.1
./bootstrap
./configure --enable-fuse --enable-mp3lame --enable-pixman
make
sudo make install
sudo ln -f -s /usr/local/sbin/xrdp /usr/sbin
sudo ln -f -s /usr/local/sbin/xrdp-sesman /usr/sbin

cd "${BD}"/git/neutrinolabs
tar xvfz xorgxrdp-0.2.0.tar.gz
cd "${BD}"/git/neutrinolabs/xorgxrdp-0.2.0
./bootstrap
./configure
make
sudo make install

echo xfce4-session > ~/.xsession
sudo cp /home/ubuntu/.xsession /etc/skel

sudo systemctl enable xrdp
sudo service xrdp restart

sudo passwd ubuntu
