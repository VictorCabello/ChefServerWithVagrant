# -*- mode: ruby -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
FILE_DISK = './tmp/large_disk.vdi'
GIGA_SIZE = 1024

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "basic_centos_64"

   config.vm.provider "virtualbox" do |v|
     v.memory = 2048
     v.cpus = 2

     v.customize  ['createhd', 
                   '--filename', FILE_DISK, 
                   '--size', 21 * GIGA_SIZE]
     v.customize  ['storageattach', :id, 
                   '--storagectl', 'SATA',
                   '--port', 1, 
                   '--device', 0, 
                   '--type', 'hdd', 
                   '--medium', FILE_DISK]
   end

  config.vm.network "public_network", ip: "192.168.123.136", :bridge => 'eth0'
  config.vm.hostname = "chefserver.intech.com"


  config.vm.provision :shell, path: "add_new_disk.sh"
  config.vm.provision :shell, path: "install_chef.sh"


end
