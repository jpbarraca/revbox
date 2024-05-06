#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export PIP_ROOT_USER_ACTION=ignore

echo 'Installing base tools'
apt-get update
apt install -y binutils ltrace gdb-multiarch python3-pip apktool qemu-user qemu-system curl radare2 python3-virtualenv objdump ghidra edb-debugger jd-gui jadx wireshark imhex pulseview zaproxy

# Vagrant?
if [ -d /home/vagrant ]; then
echo "Installing VM only tools"
    apt install -y docker.io 
fi

echo "Installing GEF"
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

echo "Installing qiling"
mkdir /opt/qiling
virtualenv /opt/qiling/venv
source /opt/qiling/venv/bin/activate
pip3 install qiling

echo 'alias activate_qiling="source /opt/qiling/venv/bin/activate"' >> /etc/bash.bashrc
echo 'echo "Type activate_qiling to enter the Qiling Python environment"' >> /etc/bash.bashrc

echo 'All done'
