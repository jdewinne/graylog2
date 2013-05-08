Vagrant.configure("2") do |config|

  config.vm.box      = "centos-64"
  config.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
  config.vm.hostname = "graylog2"

  config.vm.provider "virtualbox" do |v|
    v.name = "graylog2"
    v.gui  = true
    v.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.network :forwarded_port, guest: 3000, host: 3000
#  config.vm.network :forwarded_port, guest: 5601, host: 5601
  config.vm.network :forwarded_port, guest: 9200, host: 9200
#  config.vm.network :forwarded_port, guest: 9292, host: 9292

  config.vm.synced_folder "transfer", "/tmp/transfer"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "default.pp"
#    puppet.options        = "--verbose"
  end

end
