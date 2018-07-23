# Create the component definition
list = Sketchup.active_model.definitions
comp_def = list.add "Cube"
comp_def.description = "This is a simple cube-shaped component."
# Add entities to the component definition
ents = comp_def.entities
face = ents.add_face [0,0,0], [1,0,0], [1,1,0], [0,1,0]
face.reverse!
face.pushpull 1
# Save the component definition
save_path = Sketchup.find_support_file "Components", ""
comp_def.save_as(save_path + "/cube.skp")
puts "The definition was saved to: " + comp_def.path