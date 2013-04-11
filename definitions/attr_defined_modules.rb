# action :create do
#   httpd_config "base"
#   mods = node['httpd']['modules']

#   mods.each do |k,v|

#     mod_name        = k
#     mod_conf_value  = v
#     mod_config_file = mod_conf_value['config_file']
#     mod_enabled     = mod_conf_value['enabled']
#     mod_cookbook    = mod_conf_value['cookbook']

#     httpd_module mod_name do
#       action :enable
#       cookbook mod_cookbook
#       enabled mod_enabled
#       config_file mod_config_file
#     end
#     # # My state has changed so I'd better notify observers
#     # new_resource.updated_by_last_action(true)
#   end
#     # My state has changed so I'd better notify observers
#     #new_resource.updated_by_last_action(true)
# end
