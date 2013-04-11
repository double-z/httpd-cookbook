#
# Cookbook Name:: httpd
# Recipe:: mod_php
#
# Copyright (C) 2013 QInteractive
#
# All rights reserved - Do Not Redistribute
#

include_recipe "httpd::install"

package "php53"

file "#{node[:httpd][:base][:root_dir]}/conf.d/php.conf" do
  action :delete
  backup false
end

template "php.conf" do
  path "#{node[:httpd][:base][:root_dir]}/conf.d/mod_php.conf"
  source "php.conf.erb"
  owner "root"
  group node[:httpd][:base][:root_group]
  mode 0644
  notifies :reload, "service[httpd]", :delayed
end
