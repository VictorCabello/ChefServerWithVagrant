# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
file_to_disk = './tmp/large_disk.vdi'
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "basic_centos_64"

  config.vm.network "public_network", ip: "192.162.123.127", :bridge => 'eth0'
  config.vm.hostname = "ChefServer"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ['createhd', '--filename', file_to_disk, '--size', 12 * 1024]
    v.customize [
        'storageattach', 
        :id,
        '--storagectl',
        'SATA Controller',
        '--port',
        1,
        '--device',
        0,
        '--type',
        'hdd',
        '--medium',
        file_to_disk]
  end


  #config.vm.provision :shell, path: "install_chef.sh"




end
