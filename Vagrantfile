require 'berkshelf/vagrant'

Vagrant::Config.run do |config|

  config.vm.host_name = "httpd-berkshelf"
#  config.vm.box = "opscode-centos-5.8-bento"
  config.vm.box = "opscode-centos-5.8"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-centos-5.8.box"
  config.vm.network :hostonly, "192.168.33.105"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  if ENV["CHEF_RUN_MODE"] == "client"
    config.vm.provision :chef_client do |chef|

      chef.chef_server_url        = "http://192.168.33.11:4000"

# ENV["CHEF_SERVER_URL"]

      chef.validation_key_path    = "/etc/chef/validation.pem"

# "/home/zzondlo/.chef/validation.pem"
# ENV["VALIDATION_KEY"]

     chef.validation_client_name = "chef-validator"

# ENV["VALIDATION_CLIENT_NAME"]
     # chef.client_key_path        = "/home/zzondlo/.chef/zzondlo.pem"
     # "#{ENV["HOME"]}/.chef/zzondlo.pem"
# "/home/zzondlo/.chef/zzondlo.pem"

      # chef.environment = "vagrant"
      #chef.environment = ENV["CHEF_ENVIRONMENT"]

      # Change the node/client name for the Chef Server
      chef.node_name = "httpd-berkshelf"
      # chef.log_level = :debug
      chef.log_level = :info

      chef.json = {
        :resolver => {
          "nameservers" => ["8.8.8.8"],
          "search" => "localhost.localdomain"
        },
        :mysql => {
          :server_root_password => 'rootpass',
          :server_debian_password => 'debpass',
          :server_repl_password => 'replpass'
        }
      }

      chef.run_list = [
      "recipe[resolver::default]",
      "recipe[httpd::testing]"
      ]

    end

  else
    unless  ENV["CHEF_RUN_MODE"] == "client"
      config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = %w{ /workspace/site-cookbooks }
      # chef.log_level = :debug
      chef.log_level = :info
        chef.json = {
          :mysql => {
            :server_root_password => 'rootpass',
            :server_debian_password => 'debpass',
            :server_repl_password => 'replpass'
          }
        }

        chef.run_list = [
          "recipe[resolver::default]",
      "recipe[httpd::testing]"
      # "recipe[php53::test]"
      # "recipe[httpd::modules]"
        ]

      end
    end
  end




end
