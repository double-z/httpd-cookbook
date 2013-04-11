def initialize(*args)
  super
  @action = :enable
end

default_action :enable

actions :enable, :disable, :test

attribute :module_name, :kind_of => String, :name_attribute => true
attribute :source, :kind_of =>  String
attribute :cookbook, :kind_of =>  String
attribute :path, :kind_of => String
attribute :mod_load_path, :kind_of => String
attribute :mod_lib_path, :kind_of => String
attribute :with_config, :kind_of => [TrueClass,FalseClass], :default => false
attribute :config_source, :kind_of => String
attribute :config_cookbook, :kind_of => String
