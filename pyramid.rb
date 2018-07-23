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