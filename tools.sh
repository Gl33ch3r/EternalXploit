#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install nmap
sudo apt-get install netcat
sudo apt-get install aircrack-ng
sudo apt-get install dsniff
sudo apt-get install ettercap-text-only
sudo apt-get install w3af
sudo apt-get install kismet
sudo apt-get install scapy
sudo apt-get install john
sudo apt-get install unzip
sudo apt-get install nikto
sudo apt-get install tor
sudo apt-get install git
sudo git clone https://github.com/LionSec/katoolin.git
sudo cp katoolin/katoolin.py /usr/bin/katoolin
sudo chmod ugo+x /usr/bin/katoolin
sudo apt-get install network-manager-openvpn network-manager
sudo apt-get install build-essential libssl-dev libreadline-dev libpq5 libpq-dev libreadline5 libpcap-dev openjdk-7-jre git-core autoconf postgresql libsqlite3-dev pgadmin3 curl zlib1g-dev libxml2-dev curl zlib1g-dev libxslt1-dev vncviewer libyaml-dev