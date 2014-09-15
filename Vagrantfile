# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

BOX_MEM = "4096"
BOX_NAME =  "CentOS-6.5-x86_64-v20140311.box"
BOX_URI = "https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140311.box"
HOSTS_NO_PROXY = "localhost,127.0.0.0/8,devworkstation1.local,devworkstation2.local"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = BOX_NAME
    config.vm.box_url = BOX_URI
	config.vm.box_download_insecure = true
  
  config.vm.define :workstation1 do |workstation1_config|
    workstation1_config.vm.network :private_network, ip: "10.1.42.10"    
    workstation1_config.vm.hostname = "workstation1.local"
    workstation1_config.vm.provider "virtualbox" do |v|
      v.name = "devworkstation1"
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end  
  end
  
  config.vm.define :workstation2 do |workstation2_config|
    workstation2_config.vm.network :private_network, ip: "10.1.42.20"    
    workstation2_config.vm.hostname = "workstation2.local"
    workstation2_config.vm.network "forwarded_port", guest: 443, host: 4443
    workstation2_config.vm.network "forwarded_port", guest: 8443, host: 8443
    workstation2_config.vm.provider "virtualbox" do |v|
      v.name = "devworkstation2"
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end  
  end

  config.vm.provision :hosts do |provisioner|
        provisioner.add_host '10.1.42.10', ['workstation1.local']
        provisioner.add_host '10.1.42.20', ['workstation2.local']
  end
  config.proxy.http = ""
  config.proxy.https = ""
  config.proxy.no_proxy = "localhost,127.0.0.1,workstation1.local,workstation2.local"  
  # Puppet Provisioner setup
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "foreman/manifests"
    puppet.module_path    = "foreman/modules"
    puppet.manifest_file  = "site.pp"
  end
end