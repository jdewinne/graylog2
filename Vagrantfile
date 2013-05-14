Vagrant.configure("2") do |config|

  config.vm.define :elasticsearch do |elasticsearch|
    elasticsearch.vm.box      = "centos-64"
    elasticsearch.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
    elasticsearch.vm.hostname = "elasticsearch"
    elasticsearch.vm.network :private_network, ip: "10.11.12.20"

    elasticsearch.vm.provider "virtualbox" do |v|
      v.name = "elasticsearch"
      v.gui  = false
      v.customize ["modifyvm", :id, "--memory", 2048]
    end
  end

  config.vm.define :mongodb do |mongodb|
    mongodb.vm.box      = "centos-64"
    mongodb.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
    mongodb.vm.hostname = "mongodb"
    mongodb.vm.network :private_network, ip: "10.11.12.21"

    mongodb.vm.provider "virtualbox" do |v|
      v.name = "mongodb"
      v.gui  = false
      v.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

  config.vm.define :graylog2 do |graylog2|
    graylog2.vm.box      = "centos-64"
    graylog2.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
    graylog2.vm.hostname = "graylog2"
    graylog2.vm.network :private_network, ip: "10.11.12.22"

    graylog2.vm.provider "virtualbox" do |v|
      v.name = "graylog2"
      v.gui  = false
      v.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

  config.vm.define :client do |client|
    client.vm.box      = "centos-64"
    client.vm.box_url  = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"
    client.vm.hostname = "client"
    client.vm.network :private_network, ip: "10.11.12.23"

    client.vm.provider "virtualbox" do |v|
      v.name = "client"
      v.gui  = false
      v.customize ["modifyvm", :id, "--memory", 512]
    end
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "default.pp"
#    puppet.options        = "--verbose"
  end

end
