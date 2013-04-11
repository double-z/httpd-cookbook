# httpd_base "example" do
#   action [:install, :start]
#   listen_ports %w{ 80 }
#   contact "ops@example.com"
#   extendedstatus "Off"
#   servertokens "Prod"
#   servername "localhost.localdomain"
#   serversignature "Off"
#   traceenable "Off"
#   root_group "root"
#   process_user "apache"
#   process_group "apache"
#   package_name "httpd"
#   service_name "httpd"
#   log_dir "/var/log/httpd"
#   error_log "server_error.log"
#   root_dir "/etc/httpd"
#   lock_file "accept.lock"
#   apachectl "/usr/sbin/apachectl"
#   binary "/usr/sbin/httpd"
#   pidfile "/var/run/httpd.pid"
#   cache_dir "/var/cache/httpd"
#   lib_dir "/usr/lib64/httpd"
#   timeout "100"
#   keepalive "off"
#   maxkeepaliverequests "20"
#   keepalivetimeout "3"
#   mpm_type "prefork"
#   prefork_startservers "160"
#   prefork_minspareservers "160"
#   prefork_maxspareservers "320"
#   prefork_serverlimit "4000"
#   prefork_maxclients "4000"
#   prefork_maxrequestsperchild "10000"
#   modules %w{ status log_config deflate rewrite }
# end

# httpd_base "test" do
#   # action :install
#   action [:install, :start]
#   servertokens ""
#   root_dir "/etc/httpd"
#   cookbook_name "httpd"
#   servername "localhost.localdomain"
#   serversignature "Off"
#   serveradmin ""
#   usecanonicalname ""
#   traceenable ""
#   timeout "100"
#   keepalive "off"
#   maxkeepaliverequests "20"
#   keepalivetimeout "3"
#   mpm_type "prefork"
#   prefork_startservers "160"
#   prefork_minspareservers "160"
#   prefork_maxspareservers "320"
#   prefork_serverlimit "4000"
#   prefork_maxclients "4000"
#   prefork_maxrequestsperchild "10000"
#   listen_ports %w{ 80 }
#   root_group "root"
#   process_user "apache"
#   process_group "apache"
#   error_log "server_error.log"
# end

# httpd_base "example" do
#   # action :purge
#   # action :install
#   action [:install, :start]
#   listen_ports %w{ 443 80 }
#   servertokens "Prod"
#   root_group "root"
#   process_user "nobody"
#   process_group "nobody"
#   root_dir "/etc/httpd"
#   pidfile "/var/run/httpd.pid"
#   timeout "3000"
#   keepalive "off"
#   maxkeepaliverequests "3000"
#   keepalivetimeout "3000"
#   mpm_type "prefork"
#   prefork_startservers "160"
#   prefork_minspareservers "160"
#   prefork_maxspareservers "320"
#   prefork_serverlimit "4000"
#   prefork_maxclients "4000"
#   prefork_maxrequestsperchild "10000"
# end
