require "sketchup.rb"
# Main code (start module name with capital letter)
module My_module
 def self.my_method
# do something...
end
 def self.my_second_method
 # do something...
 end
end
# Create menu items
unless file_loaded?(__FILE__)
 mymenu = UI.menu("Plugins").add_submenu("My Plugin Collection")
 mymenu.add_item("My Tool 1") {My_module::my_method}
 mymenu.add_item("My Tool 2") {My_module::my_second_method}
 file_loaded(__FILE__)
end