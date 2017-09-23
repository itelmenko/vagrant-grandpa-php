# -*- mode: ruby -*-
# vi: set ft=ruby :

# The "2" in Vagrant.configure configures the configuration version 
Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "hashicorp/precise64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false
  
  # Guest hostname
  config.vm.hostname = "grandpa-php" 

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.11"
  # https://github.com/cogitatio/vagrant-hostsupdater
  config.hostsupdater.aliases = ["testhost1.local", "testhost2.local"]

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./sites", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # true - Display the VirtualBox GUI when booting the machine
    vb.gui = false 
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  
  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  # 
  config.vm.provision "puppet", run: "always" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "provision.pp"
  end

end
