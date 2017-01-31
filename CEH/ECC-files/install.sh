#!/bin/bash

# Foremost Config
cp foremost/foremost.conf /etc/foremost.conf

# Sorter
cp sorter/* /usr/share/tsk/sorter

# Samba
cp samba/* /etc/samba

# WB Tools
cp wbtools/* /usr/local/bin

# PDF Tools
cp pdf-tools/* /usr/local/bin

# Misc Scripts
cp scripts/* /usr/local/bin

# Volatility Plugins
cp volatility/*.py /usr/lib/python2.7/dist-packages/volatility/plugins
rm -f /usr/lib/python2.7/dist-packages/volatility/plugins/javarat.py
chmod -R 644 /usr/lib/python2.7/dist-packages/volatility/plugins/*.py

# Remove boxedit.py(c)
rm /usr/lib/python2.7/dist-packages/volatility/plugins/editbox.py
rm /usr/lib/python2.7/dist-packages/volatility/plugins/editbox.pyc

# Install Density Scout
cp densityscout/densityscout /usr/local/bin

# Intall PE Carver
cp pe_carver/*.py /usr/local/bin

# Install Page Brute
cp page_brute/*.py /usr/local/bin

# Install Java PDX Parser
cp java_idx_parser/*.py /usr/local/bin

# 4n6 Scripts
cp 4n6-scripts/* /usr/local/bin

# Install ECC Files
mkdir -p /usr/share/ECC/resources
cp ECC/resources/* /usr/share/ECC/resources
mkdir -p /usr/share/ECC/images
cp ECC/images/* /usr/share/ECC/images
mkdir -p /usr/share/ECC/audio
cp ECC/audio/* /usr/share/ECC/audio
mkdir -p /usr/share/ECC/other
cp ECC/other/* /usr/share/ECC/other
mkdir -p /usr/share/ECC/scripts
cp ECC/scripts/* /usr/local/bin

# Updated Regripper Stuff
mkdir -p /usr/share/regripper
cp -R regripper/* /usr/share/regripper
chmod -R 644 /usr/share/regripper/*

# Removing old tzworks id app
# Now called id64, installed by line #14
if [ -e /usr/local/bin/id ]; then
  rm -f /usr/local/bin/id
fi

chmod 755 /usr/local/bin/*

## Fix Privacy Controls
bash fixubuntu.sh

## Install Patches

# Install rc.local patch for more loopback devices
# fixes https://github.com/sans-dfir/sift/issues/22
patch -sN /etc/rc.local < patches/rc.local.patch
patch -sN /usr/lib/python2.7/dist-packages/dfvfs/vfs/tsk_file_entry.py < patches/dfvfs.patch
