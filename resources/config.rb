def initialize(*args)
  super
  @action = :create
end

actions :create, :delete, :test

default_action :create

attribute :conf_name, :kind_of => String, :name_attribute => true
attribute :cookbook, :kind_of => String, :default => "httpd"
attribute :source, :kind_of => String
attribute :httpd_root, :kind_of => String # , :default => "/etc/httpd"
attribute :options, :kind_of => [Hash, NilClass], :default => {}
attribute :module_dependencies, :kind_of => Array
attribute :conf_path, :kind_of => String
attribute :path, :kind_of => String
