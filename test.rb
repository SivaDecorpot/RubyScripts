=begin
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
#save_path = Sketchup.find_support_file "Plugins", ""
comp_def.save_as("C:/Users/Admin/Desktop/Shapes" + "/cube.skp")
puts "The definition was saved to: " + comp_def.path
=end

#square = Sketchup.active_model.entities.add_face [-2,2,0],[2,2,0], [2,-2,0], [-2,-2,0]
#square.pushpull 4
=begin
model = Sketchup.active_model
model.rendering_options["BackgroundColor"] = [195, 255, 195]
ents = model.entities

# Create a 4x4 cube
cube = ents.add_group
square = cube.entities.add_face [-6,6,0],[6,6,0], [6,-6,0], [-6,-6,0]
square.pushpull -12
cube.material = "Yellow"

# Add two layers to the design
layers = Sketchup.active_model.layers
layer1 = layers.add "Cylinder Layer"
layer2 = layers.add "Sphere Layer"

# Create a cylinder in Layer 1
model.active_layer = layer1
cyl = ents.add_group
base = cyl.entities.add_circle [-18, 0, 0], [0, 0, -1], 6
base_face = cyl.entities.add_face base
base_face.pushpull -12
cyl.material = "Blue"

# Create a sphere in Layer 2
model.active_layer = layer2
sph = ents.add_group
circle = sph.entities.add_circle [18, 0, 6], [0, 0, -1], 6
circle_face = sph.entities.add_face circle
path = sph.entities.add_circle [18, 0, 6], [0, 1, 0], 7
circle_face.followme path
sph.entities.erase_entities path
sph.material = "Red"

# Access the Pages container and get the time
pages = Sketchup.active_model.pages
now = Time.now

# Create the first page
pg1 = pages.add "Pg1"
pg1.camera.aspect_ratio = 2
pg1.shadow_info["DisplayShadows"] = true
pg1.shadow_info["ShadowTime"] = now

# Create the second page
pg2 = pages.add "Pg2"
pg2.camera.aspect_ratio = 1.5
pg2.shadow_info["DisplayShadows"] = true
pg2.shadow_info["ShadowTime"] = now + (60 * 60 * 6)
pg2.set_visibility layer1, false
pg2.set_visibility layer2, true

# Create the third page
pg3 = pages.add "Pg3"
pg3.camera.aspect_ratio = 1
pg3.shadow_info["DisplayShadows"] = true
pg3.shadow_info["ShadowTime"] = now + (60 * 60 * 12)
pg3.set_visibility layer1, true
pg3.set_visibility layer2, false
=end

#ents = Sketchup.active_model.entities
#normal = [0, 0, 1]
#radius = 1
# Polygon with 8 sides
#ents.add_ngon [0, 0, 0], normal, radius, 8
# Circle with 8 sides
#ents.add_circle [3, 0, 0], normal, radius, 8
# Polygon with 24 sides
#ents.add_ngon [6, 0, 0], normal, radius, 24
# Circle with 24 sides
#ents.add_circle [0, 0, 0], normal, radius



#ents = Sketchup.active_model.entities
=begin
# Create a 4x4 cube
x = 5000.0
l=15.0
ents = Sketchup.active_model.entities
while x > 0
cube = ents.add_group
z = 0+(l*(5000.0-x)/5000.0)
square = cube.entities.add_face [-l+(l*(5000.0-x)/5000.0),l-(l*(5000.0-x)/5000.0),z],[l-(l*(5000.0-x)/5000.0),l-(l*(5000.0-x)/5000.0),z], [l-(l*(5000.0-x)/5000.0),-l+(l*(5000.0-x)/5000.0),z], [-l+(l*(5000.0-x)/5000.0),-l+(l*(5000.0-x)/5000.0),z]
#square.pushpull -12
square.material = "Yellow"
x-=1
end
=end

=begin
# Create the cube
cube = Sketchup.active_model.entities.add_group
face = cube.entities.add_face [-0.5, -0.5, -0.5], [0.5, -0.5, -0.5], [0.5, 0.5, -0.5], [-0.5, 0.5, -0.5]
face.pushpull 1

# Set timing parameters in seconds
Interval = 0.1
First_limit = 5
Second_limit = 15
Third_limit = 20

# Create the transformations
first_trans = Geom::Transformation.translation [5, 0, 0]
second_trans = Geom::Transformation.rotation [0, 0, 0], [0, 0, 1], -180.degrees
third_trans = Geom::Transformation.translation [5, 0, 0]

# Create the interval translations
t1 = Geom::Transformation.new
first_int = Geom::Transformation.interpolate t1, first_trans, (Interval/First_limit)
second_int = Geom::Transformation.interpolate t1, second_trans, (Interval/(Second_limit - First_limit))
third_int = Geom::Transformation.interpolate t1, third_trans, (Interval/(Third_limit - Second_limit))

# Initialize the clock and perform the first animation
clock = 0
timer = UI.start_timer(Interval, true) {
# Increment clock and test if animation complete
clock += Interval
# Perform transformation depending on time
case clock
when 0..First_limit
cube.transform! first_int
when First_limit..Second_limit
cube.transform! second_int
when Second_limit..Third_limit
cube.transform! third_int
else UI.stop_timer timer
end
}
=end

vector = Geom::Vector3d.new 0,0,1
vector2 = Geom::Vector3d.new 1,0,0
vector3 = vector.normalize!
model = Sketchup.active_model
entities = model.active_entities
arccurve = entities.add_arc centerpoint, vector2, vector3, 10, 15, 35
UI.messagebox arccurve 