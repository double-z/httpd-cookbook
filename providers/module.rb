action :test do

end

action :enable do
  new_resource.updated_by_last_action(false)

  if exists? && ! enabled?

    Chef::Log.info("Creating #{@new_resource} at #{mod_load_path}")

    directory mod_load_dir do
      action :create
    end

    template mod_load_path do
      mode 0644
      cookbook source_cookbook
      source source_template
      variables(
        :name => mod_name,
        :short_name => mod_short_name
      )
      notifies :restart, "service[httpd]", :delayed
    end

    new_resource.updated_by_last_action(true)
  else
    Chef::Log.info("#{@new_resource} at #{mod_load_path} doesn't exist or is already enabled".upcase)
  end
end

action :disable do
  new_resource.updated_by_last_action(false)
  if exists? && enabled?
    if ::File.writable?(mod_load_path)
      Chef::Log.info("Disabling #{@new_resource} at #{mod_load_path}")
      ::File.delete(mod_load_path)
      new_resource.updated_by_last_action(true)
    else
      # raise "Cannot delete #{@new_resource} at #{mod_load_path}!"
      Chef::Log.info("Cannot delete #{@new_resource} at #{mod_load_path}!")
    end
  else
    Chef::Log.info("#{@new_resource} #{mod_name} doesn't exists or isn't enabled")
  end
end

def load_current_resource
  @current_resource = Chef::Resource::HttpdModule.new(new_resource.name)
  @current_resource.path(mod_load_path)
  @current_resource.mod_load_path(mod_load_path)
  @current_resource.mod_lib_path(mod_lib_path)
  @current_resource
  log_lwrp_init(@current_resource)
  Chef::Log.info(("mod_lib_path value is:".upcase + " #{mod_lib_path}"))
  Chef::Log.info("mod_load_dir value is:".upcase + " #{mod_load_dir}")
  Chef::Log.info(("mod_load_path value is:".upcase + " #{mod_load_path}"))
  Chef::Log.info("mod_short_name value is:".upcase + " #{mod_short_name}")
  Chef::Log.info("mod_name value is:".upcase + " #{mod_name}")
  Chef::Log.info("module_name value is:".upcase + " #{module_name}")
  Chef::Log.info("source_template value is:".upcase + " #{source_template}")
  Chef::Log.info("source_cookbook value is:".upcase + " #{source_cookbook}")
  Chef::Log.info("httpd_root value is:".upcase + " #{httpd_root}")
end

def lib_dir
  node[:httpd][:base][:libexecdir]
end

def mod_lib_path
  ::File.join(lib_dir, "#{mod_name}.so")
end

def mod_load_dir
  ::File.join(httpd_root, "modules.d")
end

def mod_load_path
    "#{mod_load_dir}/#{mod_name}.load"
end

def mod_short_name
  module_name =~ /^mod_/ ?   module_name.gsub("mod_", "") : "#{module_name}"
end

def mod_name
  module_name =~ /^mod_/ ? module_name : "mod_#{module_name}"
end

def module_name
  @new_resource.name
end

def source_template
  @new_resource.source || "module.load.erb"
end

def source_cookbook
  @new_resource.cookbook || "httpd"
end

def httpd_root
  node[:httpd][:base][:root_dir] || "/etc/httpd"
end

private

def exists?
  ::File.exists?(@current_resource.mod_lib_path)
end

def enabled?
  if exists?
    ::File.exists?(@current_resource.mod_load_path)
  else
    false
  end
end
