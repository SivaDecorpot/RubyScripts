model = Sketchup.active_model
ents = model.entities

mats = Sketchup.active_model.materials
ct_mat = mats.add "Color_Texture"
ct_mat.color = "red"

h = 5

edgearray1 = ents.add_circle [0, 0, 0], [0, 0, 1], 0.2
edgearray2 = ents.add_circle [h, 0, 0], [0, 0, 1], 0.2
edgearray3 = ents.add_circle [h, h, 0], [0, 0, 1], 0.2
edgearray4 = ents.add_circle [0, h, 0], [0, 0, 1], 0.2

face1 = ents.add_face(edgearray1)
face2 = ents.add_face(edgearray2)
face3 = ents.add_face(edgearray3)
face4 = ents.add_face(edgearray4)

face1.pushpull(-4.9)
face2.pushpull(-4.9)
face3.pushpull(-4.9)
face4.pushpull(-4.9)

s = h + 2

cube = ents.add_group
rect = cube.entities.add_face [-2, -2, h], [s, -2, h], [s, s, h], [-2, s, h]
rect.pushpull(-0.3)
cube.material = ct_mat

rangle = ents.add_group
reangle = rangle.entities.add_face [-2.01, -2.01, h+0.01], [s+0.01, -2.01, h+0.01], [s+0.01, s+0.01, h+0.01], [-2.01, s+0.01, h+0.01]
rangle.material = "Orange"