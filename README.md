# Vagrant Ubuntu Box

Build your own vagrant ubuntu box with packer for virtualbox.



# Building prerequisite 



## Virtualbox

**macOS:** `brew install virtualbox`

**Ubuntu / Debian:** `sudo apt install virtualbox-6.1`



## VirtualBox Extension Pack

[Download](https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack)

Run VirtualBox, then go to `Tools` > `Preferences` and select the `Extensions` tab. Click the add icon to `install VirtualBox Extension Pack`. Browse the `extension pack` file you have downloaded from the VirtualBox site.



## Packer

**macOS:** `brew install packer`

**Ubuntu / Debian:** `sudo apt install packer`



## Clone repository

```bash
git clone git@github.com:stevenliebregt/docker-compose-lemp-stack.git
```



## ISO

Download ubuntu server iso and put into `iso` directory.

```bash
curl http://cdimage.ubuntu.com/releases/18.04/release/ubuntu-18.04.5-server-amd64.iso --output 'iso/ubuntu-18.04.5-server-amd64.iso'
```



# Build

Please run following command to build Vagrant Box:

```bash
packer build ubuntu-18.04.5.json
```

Your created Vagrant Box will be saved in `box` directory. 



# Add Vagrant Box

```bash
vagrant box add box/ubuntu-18.04.5.box --name ubuntu18045
```

Enjoy!!!!!!
