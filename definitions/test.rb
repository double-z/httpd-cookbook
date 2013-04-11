define :test_definition do

  Chef::Log.info("Running test_definition pakage install".upcase)

  package "nmap"

  Chef::Log.info("Finished test_definition pakage install".upcase)

end
