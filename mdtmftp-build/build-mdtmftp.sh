#!/bin/bash
cd ~
wget -c http://mdtm.fnal.gov/downloads/mdtm-1.0.1.tar.gz
wget -c http://mdtm.fnal.gov/downloads/libbitmask-2.0-rev.tar.gz
wget -c http://mdtm.fnal.gov/downloads/libcpuset-1.0-rev.tar.gz
wget -c http://mdtm.fnal.gov/downloads/mdtmftp-1.0.1.tar.gz

tar -xvzf mdtm-1.0.1.tar.gz
tar -xvzf libbitmask-2.0-rev.tar.gz
tar -xvzf libcpuset-1.0-rev.tar.gz
tar -xvzf mdtmftp-1.0.1.tar.gz

rm -rvf mdtm-1.0.1.tar.gz libbitmask-2.0-rev.tar.gz libcpuset-1.0-rev.tar.gz mdtmftp-1.0.1.tar.gz

sudo apt-get -y update
sudo apt-get -y install build-essential

cd libbitmask/
./configure && make && sudo make install

cd ~
cd libcpuset/
./configure && make && sudo make install


cd ~
sudo apt-get -y install libnuma-dev libncurses5-dev libhwloc-dev
cd mdtm-1.0.1/
./configure && make && sudo make install

cd ~
sudo apt-get -y install rrdtool librrd-dev libssl-dev
cd mdtm-app-gt/
./configure --prefix=/home/ubuntu/mdtmftp
make mdtm_ftp_server mdtm_ftp_client
