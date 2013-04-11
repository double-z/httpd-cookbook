action :test do
end

##
# Create
##

action :create do
  unless exists?

    template conf_path do
      source source_template
      cookbook source_cookbook
      owner "root"
      group "root"
      mode 00644
      variables(
        :options => conf_directives
      )
      notifies :restart, "service[httpd]", :delayed
    end

    httpd_module conf_name

    if mod_deps
      unless mod_deps.nil? || mod_deps.empty?
        mod_deps.each do |dep_mod|
          httpd_module dep_mod
        end
      end
    end

    new_resource.updated_by_last_action(true)
  else
    Chef::Log.info("#{@new_resource} at #{conf_path} already exists")
    new_resource.updated_by_last_action(false)
  end
end

##
# Delete
##

action :delete do

  if exists?

    file conf_path do
      action :delete
      backup false
      notifies :restart, "service[httpd]", :delayed
    end

    httpd_module mod_name do
      action :disable
    end

    unless mod_deps.nil? || mod_deps.empty?
      mod_deps.each do |dep_mod|
        httpd_module dep_mod do
          action :disable
        end
      end
    end

    new_resource.updated_by_last_action(true)

  else
    Chef::Log.info("#{@new_resource} at #{conf_path} doesn't exist".upcase)
    new_resource.updated_by_last_action(false)
  end

end

##
# Load Current Resource
##

def load_current_resource
  @current_resource = Chef::Resource::HttpdConfig.new(new_resource.name)
  @current_resource.conf_path(conf_path)
  @current_resource

  log_lwrp_init(@current_resource)
  Chef::Log.info("conf_dir value is:".upcase + " #{conf_dir}")
  Chef::Log.info("conf_name value is:".upcase + " #{conf_name}")
  Chef::Log.info(("conf_path value is:".upcase + " #{conf_path}"))
  Chef::Log.info("source_template value is:".upcase + " #{source_template}")
  Chef::Log.info("source_cookbook value is:".upcase + " #{source_cookbook}")
  Chef::Log.info("httpd_root value is:".upcase + " #{httpd_root}")
  Chef::Log.info("conf_directives value is:".upcase + " #{conf_directives}")
end

def source_cookbook
  @new_resource.cookbook || "httpd"
end

def source_template
  @new_resource.source || "custom_config.conf.erb"
end

def httpd_root
  @new_resource.httpd_root || node[:httpd][:base][:root_dir]
end

def conf_directives
  if node['httpd']['module'].has_key?(conf_name)
    node['httpd']['module'][conf_name]['config_options'].to_hash.merge(new_resource.options)
  elsif node['httpd']['module'].has_key?(mod_short_name)
    node['httpd']['module'][mod_short_name]['config_options'].to_hash.merge(new_resource.options)
  else
    new_resource.options
  end
end

def conf_dir
  ::File.join(httpd_root, "/conf.d")
end

def conf_name
  @new_resource.conf_name
end

def conf_path
  ::File.join(conf_dir, "#{conf_name}.conf")
end

def mod_name
  conf_name =~ /^mod_/ ? conf_name : "mod_#{conf_name}"
end

def mod_short_name
  conf_name =~ /^mod_/ ?   conf_name.gsub("mod_", "") : "#{conf_name}"
end

def mod_deps
  @new_resource.module_dependencies
end

private

def exists?
  ::File.exists?(@current_resource.conf_path)
end
