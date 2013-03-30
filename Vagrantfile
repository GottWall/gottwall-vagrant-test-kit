Vagrant::Config.run do |config|

  config.vm.define :web do |web_config|
    web_config.vm.box = "precise64"
    #web_config.vm.forward_port 22, 2249
    web_config.vm.customize ["modifyvm", :id, "--memory", 1024]

    web_config.vm.box_url = "http://files.vagrantup.com/precise64.box"

    web_config.vm.network :hostonly, "10.7.8.1"

    web_config.vm.host_name = "gottwall-test-precise"


    web_config.vm.provision :chef_solo do |chef|
      chef.log_level = :debug

      chef.provisioning_path = "/tmp/vagrant-chef"
      chef.data_bags_path = "./databags"
      chef.cookbooks_path = "./cookbooks"
      chef.roles_path = "./roles"

      chef.add_role("base")
      chef.add_role("redis")
      chef.add_role("rabbitmq")
      chef.add_role("database")
    end
  end
end
