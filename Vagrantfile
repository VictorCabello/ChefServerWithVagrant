# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
FILE_TO_DISK = './tmp/large_disk.vdi'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "basic_centos_64"

  config.vm.network "public_network", ip: "192.162.123.127", :bridge => 'eth0'
  config.vm.hostname = "ChefServer"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    if File.exist?(FILE_TO_DISK)
        FileUtils.rm(FILE_TO_DISK)
    end

    v.customize  ['createhd', '--filename', FILE_TO_DISK, '--size', 12 * 1024]
    v.customize  ['storageattach', :id, '--storagectl', 'SATA', '--port', 1, 
                  '--device', 0, '--type', 'hdd', '--medium', FILE_TO_DISK]
  end


  #config.vm.provision :shell, path: "install_chef.sh"


end
