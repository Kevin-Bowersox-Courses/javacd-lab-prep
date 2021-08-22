#!/bin/sh

#Install GUI, VBox Utils
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt install -y ubuntu-desktop-minimal

sudo usermod -a -G sudo vagrant

#Enable Vbox Utils
sudo VBoxClient --clipboard
sudo VBoxClient --draganddrop
sudo VBoxClient --checkhostversion
sudo VBoxClient --seamless

export JENKINS_URL="/var/lib/jenkins"

#Gets rid of error upon start regarding bluetooth
#sudo "echo 'manual' > /etc/init/bluetooth.override"


