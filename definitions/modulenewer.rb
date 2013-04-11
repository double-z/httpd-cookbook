# #
# # Cookbook Name:: httpd
# # Definition:: httpd_module
# #
# # Copyright 2012, SecondMarket Labs, LLC.
# # Copyright 2008-2009, Opscode, Inc.
# #
# # Licensed under the Apache License, Version 2.0 (the "License");
# # you may not use this file except in compliance with the License.
# # You may obtain a copy of the License at
# #
# #     http://www.httpd.org/licenses/LICENSE-2.0
# #
# # Unless required by applicable law or agreed to in writing, software
# # distributed under the License is distributed on an "AS IS" BASIS,
# # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# # See the License for the specific language governing permissions and
# # limitations under the License.
# #
# #
# # Differs from the Opscode cookbook in that you always need a basic file,
# # even if there are no config directives beyond just enabling the module.
# # This simplifies the "definitions", however, such that you need only one, httpd_module.

# define :httpd_module, :enable => true do

#   # # Sets the Service Name and chkconfig on
#   # service "httpd" do
#   #   action :nothing
#   #   supports :restart => true, :reload => true, :start => true, :stop => true, :status => true
#   #   service_name "httpd"
#   #   start_command "/sbin/service httpd start"
#   #   stop_command "/sbin/service httpd stop"
#   #   restart_command "/sbin/service httpd restart"
#   #   reload_command "/sbin/service httpd reload"
#   # end

#   httpd_initiate

#   filename    = params[:filename]    || "mod_#{params[:name]}.so"
#   module_path = params[:module_path] || "#{node['httpd']['libexecdir']}/#{params[:filename]}"
#   name        = params[:name]
#   config_file = params[:config_file]
#   cookbook    = params[:cookbook] if params[:cookbook]
#   template_name = params[:mod_template_name] if params[:mod_template_name]

#   enabled = params[:enabled] ? params[:enabled]  : false

#   if enabled == true

#     Chef::Log.debug "ENABLING HTTPD MODULE: mod_#{params[:name]}" unless ::File.exists?("#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load")
#     Chef::Log.debug "HTTPD MODULE ALREADY IS ENABLED: mod_#{params[:name]}" if ::File.exists?("#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load")

#   directory "#{node[:httpd][:dir]}/modules.d" do
#     action :create
#   end

#     template "#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load" do
#       source "module.load.erb"
#       mode 0644
#       variables(
#         :enable => params[:enable],
#         :name        => name,
#         :module_path => module_path,
#         :cookbook    => cookbook
#       )
#       only_if { File::exists?("#{node[:httpd][:dir]}/modules.d") }
#       # notifies :restart, "service[httpd]", :delayed
#       notify_httpd_restart?
#     end

#     if config_file == true

#       template "#{node[:httpd][:dir]}/conf.d/mod_#{params[:name]}.conf" do
#         if cookbook
#           cookbook cookbook
#         else
#           cookbook "httpd"
#         end

#         if template_name
#           source template_name #"modules.d/mod_#{name}.conf.erb"
#         else
#           source "modules.d/mod_#{name}.conf.erb"
#         end
#         only_if { File::exists?("#{node[:httpd][:dir]}/conf.d") }
#         mode 0644
#         notify_httpd_restart?
#         # notifies :restart, "service[httpd]", :delayed
#       end

#     end

#   else

#     Chef::Log.debug "MODULE ALREADY DISABLED: mod_#{params[:name]}" unless ::File.exists?("#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load")
#     Chef::Log.debug "DISABLING MODULE: mod_#{params[:name]}"  if ::File.exists?("#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load")

#     file "#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load" do
#       action :delete
#       only_if { File::exists?("#{node[:httpd][:dir]}/modules.d") && File::exists?("#{node[:httpd][:dir]}/modules.d/mod_#{params[:name]}.load") }
#       # notifies :restart, "service[httpd]", :delayed
#      notify_httpd_restart?
#     end

#     file "#{node[:httpd][:dir]}/conf.d/mod_#{params[:name]}.conf" do
#       action :delete
#       only_if { File::exists?("#{node[:httpd][:dir]}/conf.d") && File::exists?("#{node[:httpd][:dir]}/conf.d/mod_#{params[:name]}.conf") }
#       # notifies :restart, "service[httpd]", :delayed
#       notify_httpd_restart?
#     end

#   end

# end
