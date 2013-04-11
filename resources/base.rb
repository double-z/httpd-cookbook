def initialize(*args)
  super
  @action = :install
    # , :disable ]
end

actions :create, :install, :uninstall, :purge, :status, :remove, :erase, :enable, :disable, :start, :stop, :restart, :reload, :test

default_action :install

# attribute :httpd_package, :kind_of => String
attribute :listen_ports, :kind_of => Array, :default => %w{ 80 }
attribute :contact, :kind_of => String
attribute :loglevel, :kind_of => String
attribute :extendedstatus, :kind_of => String
attribute :servertokens, :kind_of => String
attribute :servername, :kind_of => String
attribute :serveradmin, :kind_of => String
attribute :serversignature, :kind_of => String
attribute :traceenable, :kind_of => String
attribute :usecanonicalname, :kind_of => String
attribute :root_group, :kind_of => String
attribute :process_user, :kind_of => String
attribute :process_group, :kind_of => String
attribute :package_name, :kind_of => String
attribute :service_name, :kind_of => String
attribute :log_dir, :kind_of => String
attribute :error_log, :kind_of => String
attribute :root_dir, :kind_of => String
attribute :lockfile, :kind_of => String
attribute :apachectl, :kind_of => String
attribute :binary, :kind_of => String
attribute :pidfile, :kind_of => String
attribute :cache_dir, :kind_of => String
attribute :lib_dir, :kind_of => String
attribute :http_timeout, :kind_of => [ String, Fixnum, Integer ]
attribute :timeout, :kind_of => [ String, Fixnum, Integer ]
attribute :keepalive, :kind_of => String
attribute :maxkeepaliverequests, :kind_of => [ String, Fixnum, Integer ]
attribute :keepalivetimeout, :kind_of => [ String, Fixnum, Integer ]
attribute :mpm_type, :kind_of => String, :default => "prefork"
attribute :prefork_startservers, :kind_of => [ String, Fixnum, Integer ]
attribute :prefork_minspareservers, :kind_of => [ String, Fixnum, Integer ]
attribute :prefork_maxspareservers, :kind_of => [ String, Fixnum, Integer ]
attribute :prefork_serverlimit, :kind_of => [ String, Fixnum, Integer ]
attribute :prefork_maxclients, :kind_of => [ String, Fixnum, Integer ]
attribute :prefork_maxrequestsperchild, :kind_of => [ String, Fixnum, Integer ]
attribute :modules, :kind_of => Array, :default => %w{}
attribute :cookbook, :kind_of => String, :default => "httpd"
attribute :source, :kind_of => String, :default => "01_server_base.conf.erb"
attribute :typesconfig, :kind_of => String
