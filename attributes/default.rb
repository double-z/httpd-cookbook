#
# Cookbook Name:: httpd
# Attributes:: default
#

default['httpd']['default_packages'] = %w{ }
default['httpd']['default_enabled_modules'] = %w{ }
default['httpd']['additional_packages'] = %w{ }
default['httpd']['additional_enabled_modules'] = %w{ }
default['httpd']['disable_modules'] = %w{ }

# Source template to use and cookbook to get it from for base config
default[:httpd][:base][:cookbook] = "httpd"
default[:httpd][:base][:source] = "01_server_base.conf.erb"

# General settings
default[:httpd][:base][:listen_ports] = %w{ 80 }
default[:httpd][:base][:serveradmin] = "webmaster@localhost"
default[:httpd][:base][:extendedstatus] = "Off"
default[:httpd][:base][:usecanonicalname] = "On"

# Security
default[:httpd][:base][:servertokens] = "Prod"
default[:httpd][:base][:serversignature] = "Off"
default[:httpd][:base][:traceenable] = "Off"

# Root and Service User and Groups
default[:httpd][:base][:root_group]  = "root"
default[:httpd][:base][:process_user] = "nobody"
default[:httpd][:base][:process_group] = "nobody"

# Service and Package
default[:httpd][:base][:package_name] = "httpd"
default[:httpd][:base][:service_name] = "httpd"

# Base Logging
default[:httpd][:base][:log_dir] = "/var/log/httpd"
default[:httpd][:base][:error_log] = "base_server_error.log"
default[:httpd][:base][:loglevel] = "warn"

# Base Server Directories and Files
default[:httpd][:base][:root_dir] = "/etc/httpd"
set[:httpd][:base][:lock_dir] = "/var/lock/httpd"
default[:httpd][:base][:lockfile] = "#{set[:httpd][:base][:lock_dir]}/accept.lock"
default[:httpd][:base][:apachectl]  = "/usr/sbin/apachectl"
default[:httpd][:base][:binary]  = "/usr/sbin/httpd"
default[:httpd][:base][:pidfile] = "/var/run/httpd.pid"
default[:httpd][:base][:cache_dir] = "/var/cache/httpd"
set[:httpd][:base][:lib_dir] = node[:kernel][:machine] =~ /^i[36]86$/ ? "/usr/lib/httpd" : "/usr/lib64/httpd"
default[:httpd][:base][:libexecdir] = "#{set[:httpd][:base][:lib_dir]}/modules"
default[:httpd][:base][:typesconfig] = "/etc/mime.types"
default['httpd']['base']['www_root'] = "/var/www"

# Performance
default[:httpd][:base][:timeout] = "10"
default[:httpd][:base][:keepalive] = "off"
default[:httpd][:base][:keepaliverequests] = "20"
default[:httpd][:base][:keepalivetimeout] = "3"

# MPM to use
default[:httpd][:mpm_type] = "prefork"

# Prefork Attributes
default[:httpd][:prefork][:startservers] = "16"
default[:httpd][:prefork][:minspareservers] = "16"
default[:httpd][:prefork][:maxspareservers] = "32"
default[:httpd][:prefork][:serverlimit] = "400"
default[:httpd][:prefork][:maxclients] = "400"
default[:httpd][:prefork][:maxrequestsperchild] = "1000"

# Worker Attributes
default[:httpd][:worker][:startservers] = "4"
default[:httpd][:worker][:maxclients] = "1024"
default[:httpd][:worker][:minsparethreads] = "64"
default[:httpd][:worker][:maxsparethreads] = "192"
default[:httpd][:worker][:threadsperchild] = "64"
default[:httpd][:worker][:maxrequestsperchild] = "0"

# Instantiate a hash for all rpm installed modules for use with httpd_config resource
default['httpd']['module']['config_options'] = {}

default['httpd']['module']['actions']['config_options'] = {}
default['httpd']['module']['alias']['config_options'] = {}
default['httpd']['module']['asis']['config_options'] = {}
default['httpd']['module']['auth_basic']['config_options'] = {}
default['httpd']['module']['auth_digest']['config_options'] = {}
default['httpd']['module']['authn_alias']['config_options'] = {}
default['httpd']['module']['authn_anon']['config_options'] = {}
default['httpd']['module']['authn_dbd']['config_options'] = {}
default['httpd']['module']['authn_dbm']['config_options'] = {}
default['httpd']['module']['authn_default']['config_options'] = {}
default['httpd']['module']['authn_file']['config_options'] = {}
default['httpd']['module']['authnz_ldap']['config_options'] = {}
default['httpd']['module']['authz_dbm']['config_options'] = {}
default['httpd']['module']['authz_default']['config_options'] = {}
default['httpd']['module']['authz_groupfile']['config_options'] = {}
default['httpd']['module']['authz_host']['config_options'] = {}
default['httpd']['module']['authz_owner']['config_options'] = {}
default['httpd']['module']['authz_user']['config_options'] = {}
default['httpd']['module']['autoindex']['config_options'] = {}
default['httpd']['module']['cache']['config_options'] = {}
default['httpd']['module']['cern_meta']['config_options'] = {}
default['httpd']['module']['cgid']['config_options'] = {}
default['httpd']['module']['cgi']['config_options'] = {}
default['httpd']['module']['dav_fs']['config_options'] = {}
default['httpd']['module']['dav']['config_options'] = {}
default['httpd']['module']['dbd']['config_options'] = {}
default['httpd']['module']['deflate']['config_options'] = {}
default['httpd']['module']['dir']['config_options'] = {}
default['httpd']['module']['disk_cache']['config_options'] = {}
default['httpd']['module']['dumpio']['config_options'] = {}
default['httpd']['module']['env']['config_options'] = {}
default['httpd']['module']['expires']['config_options'] = {}
default['httpd']['module']['ext_filter']['config_options'] = {}
default['httpd']['module']['file_cache']['config_options'] = {}
default['httpd']['module']['filter']['config_options'] = {}
default['httpd']['module']['headers']['config_options'] = {}
default['httpd']['module']['ident']['config_options'] = {}
default['httpd']['module']['imagemap']['config_options'] = {}
default['httpd']['module']['include']['config_options'] = {}
default['httpd']['module']['info']['config_options'] = {}
default['httpd']['module']['ldap']['config_options'] = {}
default['httpd']['module']['log_config']['config_options'] = {}
default['httpd']['module']['log_forensic']['config_options'] = {}
default['httpd']['module']['logio']['config_options'] = {}
default['httpd']['module']['mem_cache']['config_options'] = {}
default['httpd']['module']['mime_magic']['config_options'] = {}
default['httpd']['module']['mime']['config_options'] = {}
default['httpd']['module']['negotiation']['config_options'] = {}
default['httpd']['module']['proxy_ajp']['config_options'] = {}
default['httpd']['module']['proxy_balancer']['config_options'] = {}
default['httpd']['module']['proxy_connect']['config_options'] = {}
default['httpd']['module']['proxy_ftp']['config_options'] = {}
default['httpd']['module']['proxy_http']['config_options'] = {}
default['httpd']['module']['proxy']['config_options'] = {}
default['httpd']['module']['reqtimeout']['config_options'] = {}
default['httpd']['module']['rewrite']['config_options'] = {}
default['httpd']['module']['setenvif']['config_options'] = {}
default['httpd']['module']['speling']['config_options'] = {}
default['httpd']['module']['status']['config_options'] = {}
default['httpd']['module']['substitute']['config_options'] = {}
default['httpd']['module']['suexec']['config_options'] = {}
default['httpd']['module']['unique_id']['config_options'] = {}
default['httpd']['module']['userdir']['config_options'] = {}
default['httpd']['module']['usertrack']['config_options'] = {}
default['httpd']['module']['version']['config_options'] = {}
default['httpd']['module']['vhost_alias']['config_options'] = {}
