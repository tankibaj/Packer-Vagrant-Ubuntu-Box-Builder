#!/bin/bash -eux

# Apt cleanup.
apt-get autoremove -y
apt-get clean -y

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M | true

rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync