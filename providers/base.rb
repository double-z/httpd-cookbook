# Cookbook Name:: httpd
# Provider:: base
#
# Copyright 2012, double_z
#

action :install do

  th =  template httpd_conf do
    source "httpd.conf.erb"
    cookbook cookbook_name
    owner "root"
    group root_group
    mode 0644
    notifies :restart, "service[httpd]", :delayed
    # notify_httpd_restart?
  end

  unless  ::File.exists?("#{root_dir}/conf.d/mod_log_config.conf")
    cookbook_file "#{root_dir}/conf.d/mod_log_config.conf" do
      source "mod_log_config.conf"
      mode 00644
    end
  end

  # Server Base Conf
  ts = template server_base_conf do
    source "01_server_base.conf.erb"
    cookbook cookbook_name
    owner "root"
    group root_group
    mode 0644
    variables(
      :root_dir => root_dir,
      :httpd_listen_ports => httpd_listen_ports,
      :servertokens => servertokens,
      :serversignature => serversignature,
      :servername => servername,
      :serveradmin => serveradmin,
      :traceenable => traceenable,
      :usecanonicalname => usecanonicalname,
      :error_log => error_log,
      :loglevel => loglevel,
      :mpm_type => mpm_type,
      :prefork_startservers => prefork_startservers,
      :prefork_minspareservers => prefork_minspareservers,
      :prefork_maxspareservers => prefork_maxspareservers,
      :prefork_serverlimit => prefork_serverlimit,
      :prefork_maxclients => prefork_maxclients,
      :lockfile => lock_file,
      :pidfile => pidfile,
      :http_timeout => http_timeout,
      :keepalive => keepalive,
      :maxkeepaliverequests => maxkeepaliverequests,
      :keepalivetimeout => keepalivetimeout,
      :process_user => process_user,
      :process_group => process_group,
      :typesconfig => typesconfig
    )
    notifies :restart, "service[httpd]", :delayed
    # notify_httpd_restart?
  end
  new_resource.updated_by_last_action(true)
  # Notify
  # new_resource.updated_by_last_action(th.updated_by_last_action? || ts.updated_by_last_action?) # || tc.updated_by_last_action?)

  # Httpd Logrotate
  template "logrotate.httpd" do
    path "/etc/logrotate.d/httpd"
    cookbook cookbook_name
    source "logrotate.httpd.erb"
    owner "root"
    group "root"
    mode 0644
  end

end

def load_current_resource
  @current_resource = Chef::Resource::HttpdBase.new(@new_resource.name)
  @current_resource
  # Walk the resource collection to find resources that appear to be
  # contained by the managed_directory.  This depends on the resource's
  # name attribute containing the full path to the file.
  # managed_files = run_context.resource_collection.all_resources.map { |r|
  #   r.name #if r.name.start_with?("#{new_resource.path}/")
  # }.compact

  # puts "managed files"
  #   puts managed_files

end

def root_dir
  @new_resource.root_dir || node[:httpd][:base][:root_dir]
end

def package_name
  @new_resource.package_name || node[:httpd][:base][:package_name]
end

def traceenable
  @new_resource.traceenable || node[:httpd][:base][:traceenable]
end

def usecanonicalname
  @new_resource.usecanonicalname || node[:httpd][:base][:usecanonicalname]
end

def service_name
  @new_resource.service_name || node[:httpd][:base][:service_name]
end

def httpd_root_group
  @new_resource.root_group || node[:httpd][:base][:root_group]
end

def listen_ports
  @new_resource.listen_ports || node[:httpd][:listen_ports]
end

def httpd_listen_ports
  listen_ports.map{|p| p.to_i}.uniq
end

def httpd_conf
  ::File.join(root_dir, "/conf/httpd.conf")
end

def server_base_conf
  ::File.join(root_dir, "/conf.d/01_server_base.conf")
end

def servertokens
  @new_resource.servertokens || node[:httpd][:base][:servertokens]
end

def pidfile
  @new_resource.pidfile || node[:httpd][:base][:pidfile]
end

def http_timeout
  @new_resource.timeout || node[:httpd][:base][:timeout]
end

def keepalive
  @new_resource.keepalive || node[:httpd][:base][:keepalive]
end

def maxkeepaliverequests
  current_resource.maxkeepaliverequests || node[:httpd][:base][:keepaliverequests]
end

def keepalivetimeout
  @new_resource.keepalivetimeout || node[:httpd][:base][:keepalivetimeout]
end

def extendedstatus
  @new_resource.extendedstatus || node[:httpd][:base][:extendedstatus]
end

def servername
  @new_resource.servername || node[:httpd][:base][:servername]
end

def serveradmin
  @new_resource.serveradmin || node[:httpd][:base][:serveradmin]
end

def serversignature
  @new_resource.serversignature || node[:httpd][:base][:serversignature]
end

def traceenable
  @new_resource.traceenable || node[:httpd][:base][:traceenable]
end

def root_group
  @new_resource.root_group || node[:httpd][:base][:root_group]
end

def process_user
  @new_resource.process_user || node[:httpd][:base][:process_user]
end

def process_group
  @new_resource.process_group || node[:httpd][:base][:process_group]
end

def log_dir
  @new_resource.log_dir || node[:httpd][:base][:log_dir]
end

def error_log
  @new_resource.error_log || node[:httpd][:base][:error_log]
end

def loglevel
  @new_resource.loglevel || node[:httpd][:base][:loglevel]
end

def lock_file
  @new_resource.lockfile || node[:httpd][:base][:lockfile]
end

def typesconfig
  @new_resource.typesconfig || node[:httpd][:base][:typesconfig]
end

def apachectl
  @new_resource.apachectl || node[:httpd][:base][:apachectl]
end

def binary
  @new_resource.binary || node[:httpd][:base][:binary]
end

def cache_dir
  @new_resource.cache_dir || node[:httpd][:base][:cache_dir]
end

def lib_dir
  @new_resource.lib_dir || node[:httpd][:base][:lib_dir]
end

def mpm_type
  @new_resource.mpm_type || node[:httpd][:mpm_type]
end

def prefork_startservers
  @new_resource.prefork_startservers || node[:httpd][:prefork][:startservers]
end

def prefork_minspareservers
  @new_resource.prefork_minspareservers || node[:httpd][:prefork][:minspareservers]
end

def prefork_maxspareservers
  @new_resource.prefork_maxspareservers || node[:httpd][:prefork][:maxspareservers]
end

def prefork_serverlimit
  @new_resource.prefork_serverlimit || node[:httpd][:prefork][:serverlimit]
end

def prefork_maxclients
  @new_resource.prefork_maxclients || node[:httpd][:prefork][:maxclients]
end

def prefork_maxrequestsperchild
  @new_resource.prefork_maxrequestsperchild || node[:httpd][:prefork][:maxrequestsperchild]
end

def modules
  @new_resource.modules || node[:httpd][:base][:modules]
end

def cookbook_name
  @new_resource.cookbook || node[:httpd][:base][:cookbook] || "httpd"
end

def source_template
  @new_resource.source || node[:httpd][:base][:source]
end
