Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"

 config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = "4096"
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo 'Installing base tools'
	apt-get update
    apt install -y ghidra binutils ltrace gdb-multiarch  python3-pip docker.io apktool edb-debugger jd-gui jdax wireshark qemu-user qemu-system imhex

	echo "Installing GEF"
    sudo -u vagrant bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
    
	echo "Installing qiling"
	mkdir /opt/qiling
	chown vagrant:vagrant /opt/qiling
	sudo -u vagrant bash -c "virtualenv /opt/qiling/venv; source /opt/qiling/venv/bin/activate; pip3 install qiling"
	echo 'alias activate_qiling="source /opt/qiling/venv/bin/activate"; echo "Qiling rootfs at /opt/qiling/rootfs"' >> /home/vagrant/.bashrc
	
	cp -r /vagrant/qiling/rootfs /opt/qiling/rootfs
	
    echo 'All done'
	echo "echo 'Qiling at /opt/qiling. Type activate_qiling to enter the environment'" >> /home/vagrant/.bashrc

  SHELL
end
