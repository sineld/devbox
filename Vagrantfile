# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

 config.vm.customize [
    "modifyvm", :id,
    "--memory", "4096"
  ]

  config.vm.box = "precise32"
  #config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.box_url = "precise32.box"
  config.vm.host_name = "tuana.se"
  config.vm.share_folder("www", "/var/www", "./www", :extra => 'dmode=777,fmode=777')
  # Set the Timezone to something useful
  config.vm.provision :shell, :inline => "echo \"Europe/Istanbul\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.

  config.vm.network :hostonly, "192.168.3.3"

  config.vm.provision :puppet do |puppet|
     puppet.facter = { "fqdn" => "tuana.se", "hostname" => "tuana.se" }
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base.pp"
     puppet.module_path = "modules"
  end
end
