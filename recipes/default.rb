#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright (C) 2012 double-z
#

service "httpd" do
  supports [:restart, :reload, :start, :stop, :status]
  service_name "httpd"
  action :nothing
  # If restarted/reloaded too quickly httpd has a habit of failing.
  # This may happen with multiple recipes notifying apache to restart - like
  # during the initial bootstrap.
  # restart_command "/sbin/service httpd restart && sleep 1"
  restart_command "/sbin/service httpd graceful && sleep 1"
  reload_command "/sbin/service httpd reload && sleep 1"
end

