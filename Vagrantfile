# -*- mode: ruby -*-
# vi: set ft=ruby :

###########################################################
# Settings

$memory = 4096  # In megabytes
$cpus   = 1
$address = "" # Set this if you want to set a static IP alias on eth0 (e.g. "192.168.3.13")
$fqdn = ""    # Set this if you will access the kube cluster remotely (e.g. "api.kube1.example.com")

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of resources on the VM:
    vb.memory = $memory
    vb.cpus = $cpus
  end
  config.vm.provider "hyperv" do |vb|
    # Customize the amount of resources on the VM:
    vb.memory = $memory
    vb.cpus = $cpus
  end

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  #######################################
  # Network Configuration
  #  Hyperv ignores all network settings, so in order to get a static
  #    IP add an alias to eth0

  config.vm.provision "shell",
                      privileged: false,
                      run: "always",
                      args: [ $address, $fqdn ],
                      inline: <<-SHELL
    # Add a staticIP alias
    if [[ ! -z "$1" ]]; then
      sudo ifconfig eth0:1 $1
      ifconfig eth0:1
    fi

    # Fix line endins for Windows machines
    sudo apt-get install -y dos2unix
    pushd /vagrant
    dos2unix kubeadm-one

    # Launch the setup script
    if [[ -z "$2" ]]; then
      sudo ./kubeadm-one --dotfiles --force --local-only
    else
      sudo ./kubeadm-one --dotfiles --force --apiserver-cert-extra-sans="$2"
    fi
  SHELL
end
