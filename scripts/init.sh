#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# apt-get update
# apt-get upgrade -y

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Install necessary dependencies
#-sudo apt-get -y -q install unzip curl wget git tmux

# Installing vagrant keys
mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys 'https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub'
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh



# Installing Virtual Box Guest Additions
cd /opt
sudo wget -c https://download.virtualbox.org/virtualbox/6.1.10/VBoxGuestAdditions_6.1.10.iso -O VBoxGuestAdditions.iso
sudo mount VBoxGuestAdditions.iso -o loop /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
sudo rm -rf VBoxGuestAdditions.iso