Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |v|
    v.memory = '4096'
    v.cpus = '4'
  end

  config.vm.network "private_network", ip: "192.168.44.10"
  config.vm.synced_folder ".", "/sitespeed", type: "virtualbox"
  config.vm.provision :shell, path: "setup/provision.sh"
  config.vm.provision :shell, path: "setup/traffic-control.sh", run: "always"
end