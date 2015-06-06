# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "Mesta/phonofeel"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  config.vm.synced_folder "./", "/home/vagrant/web"
end
