point = Geom::Point3d.new 10,20,30
transform = Geom::Transformation.new point
model = Sketchup.active_model
entities = model.active_entities
path = Sketchup.find_support_file "rawimg.skp",  "Components/skpfile/"
definitions = model.definitions
componentdefinition = definitions.load path
p transform
instance = entities.add_instance componentdefinition, transform
instance.rotx = 90
status = instance.glued_to