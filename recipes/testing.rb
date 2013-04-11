include_recipe "httpd::install"
# include_recipe "httpd::mod_php"

httpd_module "logio"
httpd_module "mime"
httpd_module "authz_host"
httpd_module "dir"
httpd_module "rewrite"

httpd_base "httpd" do
  servertokens "Prod"
  root_dir "/etc/httpd"
  serveradmin "root@cp.theuseful.com"
  servername "cp.theuseful.com"
  serversignature "Off"
  usecanonicalname "off"
  traceenable "off"
  timeout "3000"
  keepalive "on"
  maxkeepaliverequests "100"
  keepalivetimeout "15"
  mpm_type "prefork"
  prefork_startservers "16"
  prefork_minspareservers "16"
  prefork_maxspareservers "320"
  prefork_serverlimit "41"
  prefork_maxclients "40"
  prefork_maxrequestsperchild "100"
  listen_ports %w{ 80 443 }
  root_group "root"
  process_user "nobody"
  process_group "nobody"
  error_log "base_server_error.log"
  loglevel "debug"
  notifies :restart, "service[httpd]", :delayed
end


# httpd_config "mod_log_config" do
#   action :delete
#   source "mod_log_config.conf.erb"
# end

httpd_config "setenvif" do
  source "mod_setenvif.conf.erb"
end

httpd_config "log_config" do
  # action :delete
  options  'Setup Logging' => {
    'Defines Alias for vhost_combined' => {
      'LogFormat' => '"%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined'
    },
    'Defines Alias for combined' => {
      'LogFormat' => '"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined'
    },
    'Defines Alias for common' => {
      'LogFormat' => '"%h %l %u %t \"%r\" %>s %b" common'
    },
    'Defines Alias for referer' => {
      'LogFormat' => '"%{Referer}i -> %U" referer'
    }
  }
end

httpd_config "deflate" do
  options  'Setup Mod_Deflate' => {
    'DEFLATE text/html' => {
      'AddOutputFilterByType' => 'DEFLATE text/html'
    },
    'DEFLATE text/css' => {
      'AddOutputFilterByType' => 'DEFLATE text/css'
    },
    'DEFLATE text/plain' => {
      'AddOutputFilterByType' => 'DEFLATE text/plain'
    },
    'DEFLATE text/xml' => {
      'AddOutputFilterByType' => 'DEFLATE text/xml'
    },
    'DEFLATE application/xhtml+xml' => {
      'AddOutputFilterByType' => 'DEFLATE application/xhtml+xml'
    },
    'DEFLATE application/xml' => {
      'AddOutputFilterByType' => 'DEFLATE application/xml'
    },
    'DEFLATE image/svg+xml' => {
      'AddOutputFilterByType' => 'DEFLATE image/svg+xml'
    },
    'DEFLATE application/rss+xml' => {
      'AddOutputFilterByType' => 'DEFLATE application/rss+xml'
    },
    'DEFLATE application/atom_xml' => {
      'AddOutputFilterByType' => 'DEFLATE application/atom_xml'
    },
    'DEFLATE application/javascript' => {
      'AddOutputFilterByType' => 'DEFLATE application/javascript'
    },
    'DEFLATE application/x-javascript' => {
      'AddOutputFilterByType' => 'DEFLATE application/x-javascript'
    },
    'DEFLATE application/x-httpd-php' => {
      'AddOutputFilterByType' => 'DEFLATE application/x-httpd-php'
    },
    'DEFLATE application/x-httpd-fastphp' => {
      'AddOutputFilterByType' => 'DEFLATE application/x-httpd-fastphp'
    },
    'DEFLATE application/x-httpd-eruby' => {
      'AddOutputFilterByType' => 'DEFLATE application/x-httpd-eruby'
    }
  }
end

httpd_vhost "myface.com" do
  # action :delete
end

httpd_vhost "www.myface.com" do
  # action :delete
  log_type "vhost_combined"
  serveralias %w{ www1.myface.com www2.myface.com }
  doc_root "/var/www/html/current"
  load_order_position "02"
end

httpd_vhost "www3.myface.com" do
  # action :delete
  is_default true
  directoryindex "index.php"
  doc_root "/var/www/html"
  enable_mmap "off"
  enable_sendfile "on"
  keepalive "off"
  log_level "info"
  rewrite_log_level "info"
  port "8080"
  serveralias %w{ other.com www.other.com }
  use_canonical_name "off"
end

template "/var/www/html/index.html" do
  source "index.html.erb"
  mode 00644
end

file "/var/www/html/index.php" do
  mode 00644
  content "<?php phpinfo(); php?>"
end

link "/var/www/myface.com/current" do
  to "/var/www/html"
end

directory "/var/www/html/current" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

%w{ index.php index.html}.each do |index|
  link "/var/www/html/current/#{index}" do
    to "/var/www/html/#{index}"
  end
end

# extend HttpdInstall
# TMP
app = "testapp"
root = "/var/www/approot"

app_dirs(app, root)


file "/root/chef_node-#{node.name}.json" do
  hsh = Mash.new(node.to_hash)
  # role recipe roles recipes
  # %w[ keys ohai_time uptime_seconds uptime idletime_seconds idletime counters run_away ].each{|key| hsh.delete(key)}
  # hsh[:announces].each{|k,v| v.delete("timestamp") }
  # hsh[:kernel][:modules].each{|nm,mod| mod.delete(:refcount) }
  # hsh[:network][:interfaces].each{|nm,i| Chef::Log.info(i) ; next unless i[:rx] ; i[:rx].delete(:packets); i[:rx].delete(:bytes); }
  content       JSON.pretty_generate(hsh)
  action        :create
  owner         'root'
  group         'root'
  mode          "0666" # only readable by root
end

require 'set'

file "/root/chef_resources-#{node.name}.json" do
  resource_clxn = Chef::ResourceCollection.new
  run_context.resource_collection.each do |r|
    next if r.class.to_s == 'Chef::Resource::NodeMetadata'
    r = r.dup
    r.instance_eval do
      content('')   if respond_to?(:content)
      variables({}) if respond_to?(:variables)
      remove_instance_variable('@options') rescue nil
      params.delete(:options) if respond_to?(:params)
      # if respond_to?(:options)
      #   begin ; options({})  ; rescue options('') ; end
      # end
      @delayed_notifications = []
      @immediate_notifications = []
    end
    resource_clxn << r
  end
  content       resource_clxn.to_json(JSON::PRETTY_STATE_PROTOTYPE)+"\n"
  action        :create
  owner         'root'
  group         'root'
  mode          "0666" # only readable by root
end

