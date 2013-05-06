# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-quantal-i386"
  config.vm.box_url = "http://cloud-images.ubuntu.com/quantal/current/quantal-server-cloudimg-vagrant-i386-disk1.box"
  config.vm.forward_port 5432, 5432

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "vagrant/cookbooks"


    chef.json = {
      :postgresql => {
        :version  => "9.1",
        :listen_addresses => "*",
        :pg_hba => [
          "host all all 0.0.0.0/0 md5",
          "host all all ::1/0 md5",
        ],
        :users => [{ 
          :username => "postgres", 
          :password => "password",
          :superuser => true, 
          :login => true, 
          :createdb => true 
        }]
      }
    }
    chef.add_recipe "apt"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql"
  end
end
