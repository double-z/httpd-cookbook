root = File.absolute_path(File.dirname(__FILE__))
puts root
file_cache_path = root + ' ../../.chef/checksums'
cookbook_path = root + ' ../../cookbooks'
role_path = root + ' ../../roles'
puts file_cache_path
puts cookbook_path
puts role_path
