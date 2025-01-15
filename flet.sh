#!/bin/bash

# Update the package list
sudo dnf update -y

# Install Python and pip
sudo dnf install -y python3 python3-pip

# Install necessary development tools
sudo dnf groupinstall -y "Development Tools"

# Create and activate a virtual environment
python3 -m venv flet-env
source flet-env/bin/activate

# Install Flet
pip install flet

# Install libmpv and create a symlink if necessary
sudo dnf install -y mpv
if [ ! -f /usr/lib/libmpv.so.1 ]; then
    sudo ln -s /usr/lib64/libmpv.so.2 /usr/lib/libmpv.so.1
fi

echo "Flet has been successfully installed!"
