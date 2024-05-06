Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = "4096"
  end

  config.vm.synced_folder "host/", "/host"

  config.vm.provision "shell",  inline: <<-SHELL
    # Preprovisioning
  SHELL

  config.vm.provision "shell", path: "scripts/provision.sh"
end
