x = 5000.0
r = 10.0
l=15.0
while x > 0
ents = Sketchup.active_model.entities
z = 0+(l*(5000.0-x)/5000.0)
ra = 10-(r*(5000.0-x)/5000.0)
puts "-----z axis----#{z}"
puts "-----radius----#{ra}"
ents.add_circle [0, 0, z.to_f], [0, 0, 1], ra.to_f
puts "AFTER-----z axis----#{z.to_f}"
puts "-AFTER----radius----#{ra.to_f}"
x -= 1
end