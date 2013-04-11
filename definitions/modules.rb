# #
# # Cookbook Name:: apache
# # Definition:: apache_module
# #
# # Copyright 2012, SecondMarket Labs, LLC.
# # Copyright 2008-2009, Opscode, Inc.
# #
# # Licensed under the Apache License, Version 2.0 (the "License");
# # you may not use this file except in compliance with the License.
# # You may obtain a copy of the License at
# #
# #     http://www.apache.org/licenses/LICENSE-2.0
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
# # This simplifies the "definitions", however, such that you need only one, apache_module.

# define :httpd_module, :enable => true do

#   filename    = params[:filename]    || "mod_#{params[:name]}.so"
#   module_path = params[:module_path] || "#{node['apache']['libexecdir']}/#{params[:filename]}"
#   name        = params[:name]
#   config_file = params[:config_file]
#   cookbook    = params[:cookbook]

#   enabled = params[:enabled] ? params[:enabled]  : false

#   # CREATE IF TRUE
#   if enabled == true

#     # Chef::Log.info "ENABLING HTTPD MODULE: mod_#{params[:name]}" unless ::File.exists?("#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load")
#     # Chef::Log.info "HTTPD MODULE ALREADY IS ENABLED: mod_#{params[:name]}" if ::File.exists?("#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load")

#     template "#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load" do
#       if params[:config_file] == true
#         source "conf.d/mod_#{name}.conf.erb"
#       else
#         source "module.load.erb"
#       end

#       mode 0644
#       variables(
#         :enable => params[:enable],
#         :name        => name,
#         :module_path => module_path,
#         :cookbook    => cookbook
#       )
#       notifies :restart, "service[httpd]"
#     end

#     # DELETE
#   else
#     # Chef::Log.info "MODULE ALREADY DISABLED: mod_#{params[:name]}" unless ::File.exists?("#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load")
#     # Chef::Log.info "DISABLING MODULE: mod_#{params[:name]}"  if ::File.exists?("#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load")

#     file "#{node[:apache][:dir]}/modules.d/mod_#{params[:name]}.load" do
#       action :delete
#       notifies :restart, "service[httpd]"

#     end
#   end


# end


