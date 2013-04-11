require 'chef/mixin/command'
require 'chef/mixin/language'
include Chef::Mixin::Command

def log_lwrp_init(init)
  Chef::Log.info("Running load_current_resource for: #{init}".upcase)
end

# Checks to see if httpd is... wait for it... running! Suprise!
def httpd_running?

  process_service_name = node[:httpd][:base][:service_name]

  begin
    if ::File.exists?("/etc/init.d/httpd")
      # if run_command_with_systems_locale(:command => "/etc/init.d/#{process_service_name} status") == 0
      if run_command_with_systems_locale(:command => "/etc/init.d/httpd status") == 0
        true
      end
    end
  rescue Chef::Exceptions::Exec
    false
  end

end

# Check and see whether modified resource should notify httpd to restart delayed based on whether it is currently running
def notify_httpd_restart?
  notifies :restart, "service[httpd]", :delayed  unless httpd_running? == false
end

module Httpd
  module Install
    include Chef::Mixin::LanguageIncludeRecipe
    def httpd_install

      # Chef::Log.info("full collection #{run_context.cookbook_collection.values}".upcase)
      # Chef::Log.info("no values collection #{run_context.cookbook_collection}".upcase)

      Chef::Log.info("Running httpd_prep".upcase)

      httpd_install_modules        = node['httpd']['default_enabled_modules']
      httpd_install_package         = node[:httpd][:base][:package_name]
      httpd_install_binary            = node[:httpd][:base][:binary]
      httpd_install_dir                  = node[:httpd][:base][:root_dir]
      httpd_install_group             = node[:httpd][:base][:root_group]
      httpd_install_service_name = node[:httpd][:base][:service_name]
      httpd_install_log_dir            = node[:httpd][:base][:log_dir]
      httpd_install_cache_dir        = node[:httpd][:base][:cache_dir]
      httpd_install_lock_dir            = node[:httpd][:base][:lock_dir]

      #=========
      # INSTALL
      #=========

      # service "httpd" do
      #   supports [:restart, :reload, :start, :stop, :status]
      #   service_name "httpd"
      #   action :nothing
      #   # If restarted/reloaded too quickly httpd has a habit of failing.
      #   # This may happen with multiple recipes notifying apache to restart - like
      #   # during the initial bootstrap.
      #   # restart_command "/sbin/service httpd restart && sleep 1"
      #   restart_command "/sbin/service httpd graceful && sleep 1"
      #   reload_command "/sbin/service httpd reload && sleep 1"
      # end

      include_recipe "httpd::default"

      package httpd_install_package

      # Just Making Sure
      directory httpd_install_dir do
        owner "root"
        group "root"
        mode 00755
      end

      #
      # The accept serialization lock file MUST BE STORED ON A LOCAL DISK.
      #
      directory httpd_install_lock_dir do
        owner "root"
        group httpd_install_group
        mode 00750
      end

      # Create Vhosts Directory
      directory ::File.join(httpd_install_dir, "vhosts.d") do
        mode 00755
        owner "root"
        group httpd_install_group
      end

      # Create Modules Directory
      directory ::File.join(httpd_install_dir, "modules.d") do
        mode 00755
        owner "root"
        group httpd_install_group
        notifies :restart, "service[httpd]", :delayed
      end

      # Just Making Sure
      directory ::File.join(httpd_install_dir, "conf.d") do
        mode 00755
        owner "root"
        group httpd_install_group
      end

      # Allow the Developers to be able to read the logs
      directory "/var/log/httpd" do
        mode 00755
      end

      # Just Making Sure
      directory httpd_install_cache_dir do
        mode 00755
        owner "root"
        group httpd_install_group
      end

      #=========
      # The node attrs defined as default are pretty much
      # the bare minimum needed for a functional server.
      # Enable them.
      #=========

      httpd_install_modules.each do |mod|
        httpd_module mod
      end

      #=========
      # CLEAN HOUSE
      #=========

      # installed by default on centos/rhel, remove in favour of mods-enabled
      %w{ proxy_ajp auth_pam authz_ldap webalizer ssl welcome }.each do |f|
        file "#{httpd_install_dir}/conf.d/#{f}.conf" do
          action :delete
          backup false
        end
      end

      # Delete the stock httpd.conf - only if this is the initial install - thereby forcing usage of the httpd_config LWRP
      if ::File.exists?("#{httpd_install_dir}/conf.d/README")
        file "#{httpd_install_dir}/conf/httpd.conf" do
          action :delete
          backup false
        end
      end

      # installed by default on centos/rhel, remove in favour of mods-enabled
      file "#{httpd_install_dir}/conf.d/README" do
        action :delete
        backup false
      end

      Chef::Log.info("ending httpd_prep".upcase)

    end

    def app_dirs(app, root)

      dir_root = root
      app_name = app
      app_root = ::File.join(dir_root, app_name)

      puts dir_root
      puts app_name
      puts app_root

      directory app_root do
        owner "root"
        group "root"
        mode 00755
        action :create
        recursive true
      end
    end
  end
end

Chef::Recipe.send :include, Httpd::Install
