# #
# # Cookbook Name:: httpd
# # Recipe:: install
# #
# # Copyright (C) 2012 double-z
# #
# extend HttpdInstall
# include_recipe "httpd::default"

# Chef::Log.info("Recipe test_definition".upcase)

# test_definition

# Chef::Log.info("Recipe httpd_prep".upcase)

httpd_install





# # Local Variables

# httpd_install_modules        = node['httpd']['default_enabled_modules']
# httpd_install_package         = node[:httpd][:base][:package_name]
# httpd_install_binary            = node[:httpd][:base][:binary]
# httpd_install_dir                  = node[:httpd][:base][:root_dir]
# httpd_install_group             = node[:httpd][:base][:root_group]
# httpd_install_service_name = node[:httpd][:base][:service_name]
# httpd_install_log_dir            = node[:httpd][:base][:log_dir]
# httpd_install_cache_dir        = node[:httpd][:base][:cache_dir]
# httpd_install_lock_dir            = node[:httpd][:base][:lock_dir]

# #=========
# # INSTALL
# #=========

# include_recipe "httpd::default"

# package httpd_install_package

# # Just Making Sure
# directory httpd_install_dir do
#   owner "root"
#   group "root"
#   mode 00755
# end

# #
# # The accept serialization lock file MUST BE STORED ON A LOCAL DISK.
# #
# directory httpd_install_lock_dir do
#   owner "root"
#   group httpd_install_group
#   mode 00750
# end

# # Create Vhosts Directory
# directory ::File.join(httpd_install_dir, "vhosts.d") do
#   mode 00755
#   owner "root"
#   group httpd_install_group
# end

# # Create Modules Directory
# directory ::File.join(httpd_install_dir, "modules.d") do
#   mode 00755
#   owner "root"
#   group httpd_install_group
#   notifies :restart, "service[httpd]", :delayed
# end

# # Just Making Sure
# directory ::File.join(httpd_install_dir, "conf.d") do
#   mode 00755
#   owner "root"
#   group httpd_install_group
# end

# # Allow the Developers to be able to read the logs
# directory "/var/log/httpd" do
#   mode 00755
# end

# # Just Making Sure
# directory httpd_install_cache_dir do
#   mode 00755
#   owner "root"
#   group httpd_install_group
# end

# #=========
# # The node attrs defined as default are pretty much
# # the bare minimum needed for a functional server.
# # Enable them.
# #=========

# httpd_install_modules.each do |mod|
#   httpd_module mod
# end

# #=========
# # CLEAN HOUSE
# #=========

# # installed by default on centos/rhel, remove in favour of mods-enabled
# %w{ proxy_ajp auth_pam authz_ldap webalizer ssl welcome }.each do |f|
#   file "#{httpd_install_dir}/conf.d/#{f}.conf" do
#     action :delete
#     backup false
#   end
# end

# # Delete the stock httpd.conf - only if this is the initial install - thereby forcing usage of the httpd_config LWRP
# if ::File.exists?("#{httpd_install_dir}/conf.d/README")
#   file "#{httpd_install_dir}/conf/httpd.conf" do
#     action :delete
#     backup false
#   end
# end

# # installed by default on centos/rhel, remove in favour of mods-enabled
# file "#{httpd_install_dir}/conf.d/README" do
#   action :delete
#   backup false
# end
