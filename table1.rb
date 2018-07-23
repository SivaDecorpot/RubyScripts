model = Sketchup.active_model
ents = model.entities

mats = Sketchup.active_model.materials
ct_mat = mats.add "Color_Texture"
ct_mat.color = "red"

h = 5.3
l = 5
w = 0.3

leg1 = ents.add_face [0, 0, 0], [w, 0, 0], [w, w, 0], [0, w, 0]
leg2 = ents.add_face [l, 0, 0], [l+w, 0, 0], [l+w, w, 0], [l, w, 0]
leg3 = ents.add_face [0, l, 0], [w, l, 0], [w, l+w, 0], [0, l+w, 0]
leg4 = ents.add_face [l, l, 0], [l+w, l, 0], [l+w, l+w, 0], [l, l+w, 0]

leg1.pushpull(-5)
leg2.pushpull(-5)
leg3.pushpull(-5)
leg4.pushpull(-5)

s = h + 2

cube = ents.add_group
rect = cube.entities.add_face [-2, -2, h], [s, -2, h], [s, s, h], [-2, s, h]
rect.pushpull(-0.3)
cube.material = ct_mat