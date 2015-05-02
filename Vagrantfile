# -*- mode: ruby -*-
# vi: set ft=ruby :


# Adds hostname to /etc/hosts (or the windows equivalent)
# https://github.com/cogitatio/vagrant-hostsupdater
# Requires a hostname and a :private_network network with a fixed ip.
unless Vagrant.has_plugin? 'vagrant-hostsupdater'
  puts 'Install the hosts plugin: vagrant plugin install vagrant-hostsupdater'
  exit 1
end


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Use Ubuntu 14.04 64-bit.
    config.vm.box = "ubuntu/trusty64"

    # vagrant-hostsupdater requires a hostname and a :private_network network with a fixed ip.
    config.vm.hostname = "meteor.dev"
    config.vm.network :private_network, ip: '172.16.10.10'

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    config.ssh.forward_agent = true

    # Run the provisioning script.
    config.vm.provision :shell, path: "bootstrap.sh"

    # Forward the port used by meteor.
    config.vm.network :forwarded_port, guest: 3000, host: 3000

    # Add a synced folders for a project
    #config.vm.synced_folder '../projectA', '/projectA'

    config.vm.provider "virtualbox" do |vm|
        vm.name = "meteor"
        vm.memory = 1024
        vm.cpus = 1

        # This config option is required in order to be able to create the symlink to the sync folder
        vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end

end
