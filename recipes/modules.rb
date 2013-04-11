
# node.override['httpd']['modules'] = {
#   "auth_basic" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "auth_digest" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authn_file" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authn_alias" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authn_anon" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authn_dbm" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authn_default" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_host" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_user" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_owner" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_groupfile" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_dbm" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authz_default" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "ldap" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "authnz_ldap" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "include" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "log_config" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "logio" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "env" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "ext_filter" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "mime_magic" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "expires" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "deflate" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "headers" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "usertrack" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "setenvif" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "mime" => {
#     "config_file" => true,
#     "TypesConfig" => "/etc/mime.types",
#     "cookbook"     => "resolver",
#     "enabled"     => true
#   },
#   "dav" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "status" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "autoindex" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "info" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "dav_fs" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "vhost_alias" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "negotiation" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "dir" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "actions" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "speling" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "userdir" => {
#     "config_file" => true,
#     "enabled"     => false,
#     # "template_name"     => "modules.d/mod_userdir.conf.erb"
#     # "cookbook"     => "httpd",
#     "UserDir"         => "disable"
#   },
#   "alias" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "rewrite" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "proxy" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "proxy_balancer" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "proxy_ftp" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "proxy_http" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "proxy_connect" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "cache" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "suexec" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "disk_cache" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "file_cache" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "mem_cache" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "cgi" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "version" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   # "cern_meta" => {
#   #   "config_file" => false,
#   #   "enabled"     => false
#   # },
#   # "asis" => {
#   #   "config_file" => false,
#   #   "enabled"     => false
#   # }
# # }

# #node.override['httpd']['modules'] = {
# #  "auth_basic" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "auth_digest" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authn_file" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authn_alias" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authn_anon" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authn_dbm" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authn_default" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_host" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_user" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_owner" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_groupfile" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_dbm" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authz_default" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "ldap" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "authnz_ldap" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "include" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "log_config" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "logio" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "env" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "ext_filter" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "mime_magic" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "expires" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "deflate" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "headers" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "usertrack" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "setenvif" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "mime" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "dav" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "status" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "autoindex" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "info" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "dav_fs" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "vhost_alias" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "negotiation" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "dir" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "actions" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "speling" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "userdir" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "alias" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "rewrite" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "proxy" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "proxy_balancer" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "proxy_ftp" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "proxy_http" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "proxy_connect" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "cache" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "suexec" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "disk_cache" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "file_cache" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "mem_cache" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "cgi" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
# #  "version" => {
# #    "enabled"     => false,
# #    "config_file" => false,
# #    "cookbook" => ""
# #   },
#  "cern_meta" => {
#     "config_file" => false,
#     "enabled"     => false
#   },
#   "asis" => {
#     "config_file" => false,
#     "enabled"     => false,
#     "cookbook"   => "httpd"
#   }

#  # "cern_meta" => {
#  #   "enabled"     => true,
#  #   "config_file" => false
#  #   # "cookbook" => ""
#  #  },
#  # "asis" => {
#  # "cern_meta" => {
#  #   "enabled"     => true,
#  #   "config_file" => false
#  #   # "cookbook" => ""
#  # }
# }


# httpd_module "mod_deflate" do
#   action :test
# end

include_recipe "httpd"

httpd_config "alias" do
  action :create
end

httpd_config "deflate" do
  action :create
  module_dependencies %w{ actions autoindex }
end

httpd_module "cache" do
  action :enable
end

httpd_config "filter" do
  action :create
end
httpd_config "setenvif" do
  action :create
  source "mod_setenvif.conf.erb"
end

httpd_module "expires" do
  action :enable
end

httpd_config "test" do
  action :create
end

httpd_config "test2" do
  action :create
end
httpd_config "test4" do
  action :create
end
httpd_config "test5" do
  action :create
end
httpd_module "test6" do
  action :enable

end
httpd_config "test7" do
  action :create
end

# DELETE

# httpd_config "alias" do
#   action :delete
# end

# httpd_config "deflate" do
#   action :delete
  # module_dependencies %w{ actions autoindex }
# end

# httpd_module "cache" do
#   action :disable
# end

# httpd_config "filter" do
#   action :delete
# end
# httpd_config "filter45" do
#   action :delete
# end

# httpd_module "expires" do
#   action :disable
# end

# httpd_config "test" do
#   action :delete
# end

# httpd_config "test2" do
#   action :delete
# end
# httpd_config "test4" do
#   action :delete
# end
# httpd_config "test5" do
#   action :delete
# end
# httpd_module "test6" do
#   action :disable
# end
# httpd_config "test7" do
#   action :delete
# end
