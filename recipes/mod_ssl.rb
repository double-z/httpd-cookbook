#
# Cookbook Name:: httpd
# Recipe:: mod_ssl
#
# Copyright (C) 2013 QInteractive
#
# All rights reserved - Do Not Redistribute
#

package "mod_ssl" do
  action :install
end

file "#{node[:httpd][:base][:root_dir]}/conf.d/ssl.conf" do
  action :delete
  backup false
end

template "mod_ssl" do
  path "#{node[:httpd][:base][:root_dir]}/conf.d/mod_ssl.conf"
  source "mod_ssl.conf.erb"
  owner "root"
  mode 0644
end
